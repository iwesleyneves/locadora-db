-- --------------------------------------------------------
-- TRIGGER 1: Bloquear o veículo ao registrar uma locação
-- --------------------------------------------------------
DELIMITER //
CREATE TRIGGER trg_atualiza_status_locacao
AFTER INSERT ON Locacoes
FOR EACH ROW
BEGIN
    -- Muda o status do carro alugado para 'Locado'
    UPDATE Veiculos 
    SET status = 'Locado' 
    WHERE id_veiculo = NEW.fk_id_veiculo;
END //
DELIMITER ;

INSERT INTO Locacoes (data_retirada, data_prevista_devolucao, fk_id_cliente, fk_id_veiculo, fk_id_funcionario, fk_id_seguro)
VALUES ('2026-05-01 10:00:00', '2026-05-05 10:00:00', 1, 1, 1, 1);

INSERT INTO Devolucoes (data_entrega_real, valor_total_pago, valor_multa, fk_id_locacao)
VALUES ('2026-05-05 10:00:00', 500.00, 0.00, 1);

SELECT id_veiculo, placa, status FROM Veiculos WHERE id_veiculo = 1;

-- --------------------------------------------------------
-- TRIGGER 2: Liberar o veículo ao registrar a devolução
-- --------------------------------------------------------
DELIMITER //
CREATE TRIGGER trg_atualiza_status_devolucao
AFTER INSERT ON Devolucoes
FOR EACH ROW
BEGIN
    -- Descobre qual era o veículo da locação e muda o status de volta para 'Disponível'
    UPDATE Veiculos 
    SET status = 'Disponível' 
    WHERE id_veiculo = (SELECT fk_id_veiculo FROM Locacoes WHERE id_locacao = NEW.fk_id_locacao);
END //
DELIMITER ;

-- --------------------------------------------------------
-- TRIGGER 3: Bloquear o veículo ao enviar para manutenção
-- --------------------------------------------------------
DELIMITER //
CREATE TRIGGER trg_atualiza_status_manutencao
AFTER INSERT ON Manutencoes
FOR EACH ROW
BEGIN
    -- Muda o status do carro que foi para a oficina para 'Manutenção'
    UPDATE Veiculos 
    SET status = 'Manutenção' 
    WHERE id_veiculo = NEW.fk_id_veiculo;
END //
DELIMITER ;