-- --------------------------------------------------------
-- VIEW 1: Faturamento Mensal
-- Objetivo: Mostrar a receita total arrecadada mês a mês.
-- --------------------------------------------------------
CREATE VIEW vw_faturamento_mensal AS
SELECT 
    DATE_FORMAT(data_entrega_real, '%Y-%m') AS mes_referencia,
    COUNT(id_devolucao) AS total_locacoes_encerradas,
    SUM(valor_total_pago) AS faturamento_total
FROM Devolucoes
GROUP BY DATE_FORMAT(data_entrega_real, '%Y-%m')
ORDER BY mes_referencia DESC;

-- --------------------------------------------------------
-- VIEW 2: Controle de Multas Aplicadas
-- Objetivo: Isolar apenas as locações que geraram multa e somar esse valor.
-- --------------------------------------------------------
CREATE VIEW vw_controle_multas AS
SELECT 
    DATE_FORMAT(data_entrega_real, '%Y-%m') AS mes_referencia,
    COUNT(id_devolucao) AS quantidade_multas_aplicadas,
    SUM(valor_multa) AS total_multas_arrecadadas
FROM Devolucoes
WHERE valor_multa > 0
GROUP BY DATE_FORMAT(data_entrega_real, '%Y-%m')
ORDER BY mes_referencia DESC;

-- --------------------------------------------------------
-- VIEW 3: Rentabilidade por Veículo (Mais e Menos Alugados)
-- Objetivo: Descobrir quais carros geram mais (ou menos) dinheiro.
-- --------------------------------------------------------
CREATE VIEW vw_rentabilidade_veiculo AS
SELECT 
    v.placa,
    v.modelo,
    c.nome_categoria,
    COUNT(l.id_locacao) AS total_vezes_alugado,
    IFNULL(SUM(d.valor_total_pago), 0) AS receita_total_gerada
FROM Veiculos v
JOIN Categorias c ON v.fk_id_categoria = c.id_categoria
LEFT JOIN Locacoes l ON v.id_veiculo = l.fk_id_veiculo
LEFT JOIN Devolucoes d ON l.id_locacao = d.fk_id_locacao
GROUP BY v.id_veiculo, v.placa, v.modelo, c.nome_categoria
ORDER BY receita_total_gerada DESC;

-- --------------------------------------------------------
-- VIEW 4: Clientes Mais Ativos
-- Objetivo: Ranquear os clientes que mais alugaram carros e mais gastaram.
-- --------------------------------------------------------
CREATE VIEW vw_clientes_mais_ativos AS
SELECT 
    cl.nome AS cliente_nome,
    cl.cpf,
    COUNT(l.id_locacao) AS quantidade_locacoes,
    IFNULL(SUM(d.valor_total_pago), 0) AS valor_total_gasto
FROM Clientes cl
LEFT JOIN Locacoes l ON cl.id_cliente = l.fk_id_cliente
LEFT JOIN Devolucoes d ON l.id_locacao = d.fk_id_locacao
GROUP BY cl.id_cliente, cl.nome, cl.cpf
ORDER BY quantidade_locacoes DESC, valor_total_gasto DESC;
