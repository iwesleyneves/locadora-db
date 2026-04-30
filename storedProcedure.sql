DELIMITER //
CREATE PROCEDURE sp_registrar_devolucao(
    IN p_id_locacao INT,
    IN p_data_entrega_real DATETIME
)
BEGIN
    -- Declaração das variáveis para armazenar os dados da locação
    DECLARE v_data_prevista DATETIME;
    DECLARE v_data_retirada DATETIME;
    DECLARE v_valor_diaria_carro DECIMAL(10,2);
    DECLARE v_valor_diario_seguro DECIMAL(10,2);
    
    DECLARE v_dias_previstos INT;
    DECLARE v_dias_reais INT;
    DECLARE v_dias_atraso INT DEFAULT 0;
    
    DECLARE v_valor_total_previsto DECIMAL(10,2);
    DECLARE v_valor_multa DECIMAL(10,2) DEFAULT 0.00;
    DECLARE v_valor_final_pago DECIMAL(10,2);

    -- 1. Busca os dados do contrato, do veículo (categoria) e do seguro
    SELECT 
        l.data_retirada,
        l.data_prevista_devolucao,
        c.valor_diaria_base,
        s.valor_diario_seguro
    INTO 
        v_data_retirada, v_data_prevista, v_valor_diaria_carro, v_valor_diario_seguro
    FROM Locacoes l
    JOIN Veiculos v ON l.fk_id_veiculo = v.id_veiculo
    JOIN Categorias c ON v.fk_id_categoria = c.id_categoria
    JOIN Seguros s ON l.fk_id_seguro = s.id_seguro
    WHERE l.id_locacao = p_id_locacao;

    -- 2. Calcula a quantidade de dias previstos no contrato
    SET v_dias_previstos = DATEDIFF(v_data_prevista, v_data_retirada);
    IF v_dias_previstos = 0 THEN SET v_dias_previstos = 1; END IF; -- Garante cobrança mínima de 1 diária

    -- 3. Calcula o valor total previsto original (sem multas)
    SET v_valor_total_previsto = (v_valor_diaria_carro + v_valor_diario_seguro) * v_dias_previstos;

    -- 4. Verifica se houve atraso
    IF p_data_entrega_real > v_data_prevista THEN
        -- Calcula os dias de atraso
        SET v_dias_atraso = DATEDIFF(p_data_entrega_real, v_data_prevista);
        
        -- Aplica a RN03: 10% sobre o total previsto + valor das diárias excedentes
        SET v_valor_multa = (v_valor_total_previsto * 0.10) + ((v_valor_diaria_carro + v_valor_diario_seguro) * v_dias_atraso);
    END IF;

    -- 5. Calcula o valor final que o cliente deve pagar
    SET v_valor_final_pago = v_valor_total_previsto + v_valor_multa;

    -- 6. Insere o registro definitivo na tabela de Devoluções
    INSERT INTO Devolucoes (data_entrega_real, valor_total_pago, valor_multa, fk_id_locacao)
    VALUES (p_data_entrega_real, v_valor_final_pago, v_valor_multa, p_id_locacao);

END //

DELIMITER ;

call sp_registrar_devolucao(2, '2026-05-10 14:00:00');