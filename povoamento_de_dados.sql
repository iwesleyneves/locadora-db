-- 1. Inserindo 5 Administradores
INSERT INTO Administradores (nome, email, senha_hash, nivel_acesso) VALUES
('Carlos Mendes', 'carlos@autogestao.com', 'hash_123', 'Super'),
('Ana Julia', 'ana@autogestao.com', 'hash_123', 'Gerente'),
('Roberto Dias', 'roberto@autogestao.com', 'hash_123', 'Gerente'),
('Fernanda Lima', 'fernanda@autogestao.com', 'hash_123', 'Super'),
('Marcos Silva', 'marcos@autogestao.com', 'hash_123', 'Gerente');

-- 2. Inserindo 20 Categorias
INSERT INTO Categorias (nome_categoria, valor_diaria_base) VALUES
('Hatch Econômico', 80.00), ('Hatch Compacto', 90.00), ('Hatch Premium', 120.00),
('Sedan Econômico', 100.00), ('Sedan Médio', 140.00), ('Sedan Premium', 200.00),
('SUV Compacto', 180.00), ('SUV Médio', 250.00), ('SUV Premium', 350.00),
('Picape Leve', 150.00), ('Picape Média', 280.00), ('Picape Diesel 4x4', 400.00),
('Minivan 7 Lugares', 220.00), ('Van 12 Lugares', 300.00), ('Van 15 Lugares', 380.00),
('Esportivo Básico', 450.00), ('Esportivo Luxo', 800.00), ('Conversível', 600.00),
('Híbrido Econômico', 130.00), ('Elétrico Premium', 500.00);

-- 3. Inserindo 20 Seguros
INSERT INTO Seguros (tipo_cobertura, valor_diario_seguro) VALUES
('Básico', 20.00), ('Proteção Terceiros', 35.00), ('Proteção Total', 60.00),
('Roubo e Furto', 40.00), ('Vidros e Pneus', 25.00), ('Franquia Reduzida', 50.00),
('Franquia Zero', 90.00), ('Proteção Granizo', 15.00), ('Seguro Viagem', 30.00),
('Danos Morais', 20.00), ('Acidentes Pessoais', 25.00), ('Cobertura Plus', 70.00),
('Cobertura VIP', 100.00), ('Proteção Carga', 45.00), ('Proteção Interior', 10.00),
('Carro Reserva Básico', 35.00), ('Carro Reserva Luxo', 80.00), ('Assistência 24h', 15.00),
('Assistência Premium', 40.00), ('Pacote Tudo Incluso', 150.00);

-- 4. Inserindo 20 Clientes (CNH validade futura)
INSERT INTO Clientes (nome, cpf, cnh_numero, cnh_vencimento, telefone) VALUES
('João Pereira', '111.111.111-01', 'CNH00000001', '2028-05-10', '99999-0001'),
('Maria Santos', '111.111.111-02', 'CNH00000002', '2027-12-01', '99999-0002'),
('Pedro Alvares', '111.111.111-03', 'CNH00000003', '2029-01-15', '99999-0003'),
('Lucas Moraes', '111.111.111-04', 'CNH00000004', '2028-08-20', '99999-0004'),
('Juliana Costa', '111.111.111-05', 'CNH00000005', '2027-11-11', '99999-0005'),
('Camila Rocha', '111.111.111-06', 'CNH00000006', '2030-02-28', '99999-0006'),
('Felipe Gomes', '111.111.111-07', 'CNH00000007', '2029-04-10', '99999-0007'),
('Amanda Nunes', '111.111.111-08', 'CNH00000008', '2027-09-05', '99999-0008'),
('Ricardo Silva', '111.111.111-09', 'CNH00000009', '2031-03-12', '99999-0009'),
('Bruna Souza', '111.111.111-10', 'CNH00000010', '2028-07-22', '99999-0010'),
('Tiago Ribeiro', '111.111.111-11', 'CNH00000011', '2029-10-30', '99999-0011'),
('Letícia Carvalho', '111.111.111-12', 'CNH00000012', '2027-05-14', '99999-0012'),
('Gustavo Lima', '111.111.111-13', 'CNH00000013', '2028-11-19', '99999-0013'),
('Priscila Vieira', '111.111.111-14', 'CNH00000014', '2029-06-25', '99999-0014'),
('Daniel Castro', '111.111.111-15', 'CNH00000015', '2030-12-05', '99999-0015'),
('Larissa Barros', '111.111.111-16', 'CNH00000016', '2028-02-18', '99999-0016'),
('Marcelo Nogueira','111.111.111-17', 'CNH00000017', '2027-08-08', '99999-0017'),
('Tatiane Martins', '111.111.111-18', 'CNH00000018', '2029-09-09', '99999-0018'),
('Rodrigo Alves', '111.111.111-19', 'CNH00000019', '2031-01-20', '99999-0019'),
('Vanessa Cardoso', '111.111.111-20', 'CNH00000020', '2028-04-03', '99999-0020');

-- 5. Inserindo 20 Funcionários
INSERT INTO Funcionarios (nome, matricula, cargo) VALUES
('Wesley Neves Batista', 'MAT001', 'Desenvolvedor/Suporte'),
('Alice Ferreira', 'MAT002', 'Atendente'), ('Bruno Henrique', 'MAT003', 'Atendente'),
('Clara Mendes', 'MAT004', 'Vendedora'), ('Diogo Castro', 'MAT005', 'Atendente'),
('Eliane Diniz', 'MAT006', 'Vendedora'), ('Fábio Assunção', 'MAT007', 'Supervisor'),
('Gabriela Mota', 'MAT008', 'Atendente'), ('Hugo Leonardo', 'MAT009', 'Atendente'),
('Igor Freitas', 'MAT010', 'Vendedor'), ('Jéssica Alves', 'MAT011', 'Atendente'),
('Kleber Machado', 'MAT012', 'Atendente'), ('Luana Silva', 'MAT013', 'Supervisora'),
('Murilo Benicio', 'MAT014', 'Atendente'), ('Natália Guimarães', 'MAT015', 'Vendedora'),
('Otávio Mesquita', 'MAT016', 'Atendente'), ('Patrícia Poeta', 'MAT017', 'Atendente'),
('Quintino Bocaiuva', 'MAT018', 'Gerente de Pátio'), ('Renata Vasconcelos', 'MAT019', 'Atendente'),
('Sérgio Chapelin', 'MAT020', 'Atendente');

-- 6. Inserindo 20 Veículos (Ligando à fk_id_categoria de 1 a 20)
INSERT INTO Veiculos (placa, modelo, cor, ano, status, fk_id_categoria) VALUES
('ABC-1234', 'Chevrolet Onix', 'Branco', 2024, 'Disponível', 1),
('DEF-5678', 'Hyundai HB20', 'Prata', 2025, 'Disponível', 2),
('GHI-9012', 'VW Polo', 'Preto', 2023, 'Disponível', 3),
('JKL-3456', 'Fiat Cronos', 'Branco', 2024, 'Disponível', 4),
('MNO-7890', 'Toyota Corolla', 'Prata', 2025, 'Disponível', 5),
('PQR-1234', 'Honda Civic', 'Preto', 2026, 'Disponível', 6),
('STU-5678', 'Jeep Renegade', 'Branco', 2024, 'Disponível', 7),
('VWX-9012', 'Jeep Compass', 'Cinza', 2025, 'Disponível', 8),
('YZA-3456', 'Toyota SW4', 'Preto', 2026, 'Disponível', 9),
('BCD-7890', 'Fiat Strada', 'Branco', 2023, 'Disponível', 10),
('EFG-1234', 'Fiat Toro', 'Vermelho', 2024, 'Disponível', 11),
('HIJ-5678', 'Toyota Hilux', 'Prata', 2025, 'Disponível', 12),
('KLM-9012', 'Chevrolet Spin', 'Prata', 2024, 'Disponível', 13),
('NOP-3456', 'Renault Master', 'Branco', 2023, 'Disponível', 14),
('QRS-7890', 'Mercedes Sprinter', 'Branco', 2025, 'Disponível', 15),
('TUV-1234', 'Ford Mustang', 'Vermelho', 2026, 'Disponível', 16),
('WXY-5678', 'Porsche 911', 'Preto', 2026, 'Disponível', 17),
('ZAB-9012', 'BMW Z4', 'Branco', 2025, 'Disponível', 18),
('CDE-3456', 'Toyota Corolla Hybrid', 'Prata', 2025, 'Disponível', 19),
('FGH-7890', 'Tesla Model 3', 'Branco', 2026, 'Disponível', 20);

-- 7. Inserindo 20 Locações (Abril de 2026)
INSERT INTO Locacoes (data_retirada, data_prevista_devolucao, fk_id_cliente, fk_id_veiculo, fk_id_funcionario, fk_id_seguro) VALUES
('2026-04-01 08:00:00', '2026-04-05 08:00:00', 1, 1, 2, 1),
('2026-04-02 09:30:00', '2026-04-04 09:30:00', 2, 2, 3, 2),
('2026-04-03 10:00:00', '2026-04-10 10:00:00', 3, 3, 4, 3),
('2026-04-04 14:00:00', '2026-04-06 14:00:00', 4, 4, 5, 4),
('2026-04-05 11:15:00', '2026-04-08 11:15:00', 5, 5, 6, 5),
('2026-04-06 08:45:00', '2026-04-09 08:45:00', 6, 6, 7, 6),
('2026-04-07 13:20:00', '2026-04-12 13:20:00', 7, 7, 8, 7),
('2026-04-08 16:00:00', '2026-04-15 16:00:00', 8, 8, 9, 8),
('2026-04-09 09:00:00', '2026-04-11 09:00:00', 9, 9, 10, 9),
('2026-04-10 10:30:00', '2026-04-14 10:30:00', 10, 10, 11, 10),
('2026-04-11 08:00:00', '2026-04-13 08:00:00', 11, 11, 12, 11),
('2026-04-12 14:45:00', '2026-04-18 14:45:00', 12, 12, 13, 12),
('2026-04-13 11:00:00', '2026-04-20 11:00:00', 13, 13, 14, 13),
('2026-04-14 15:30:00', '2026-04-16 15:30:00', 14, 14, 15, 14),
('2026-04-15 09:15:00', '2026-04-19 09:15:00', 15, 15, 16, 15),
('2026-04-16 12:00:00', '2026-04-22 12:00:00', 16, 16, 17, 16),
('2026-04-17 08:30:00', '2026-04-21 08:30:00', 17, 17, 18, 17),
('2026-04-18 10:00:00', '2026-04-25 10:00:00', 18, 18, 19, 18),
('2026-04-19 14:00:00', '2026-04-23 14:00:00', 19, 19, 20, 19),
('2026-04-20 16:30:00', '2026-04-24 16:30:00', 20, 20, 2, 20);

-- 8. Inserindo 20 Devoluções (Todas referentes às 20 locações acima)
-- Obs: Algumas com atraso para testarmos as lógicas de multa futuramente.
INSERT INTO Devolucoes (data_entrega_real, valor_total_pago, valor_multa, fk_id_locacao) VALUES
('2026-04-05 08:00:00', 400.00, 0.00, 1),
('2026-04-04 09:30:00', 250.00, 0.00, 2),
('2026-04-10 10:00:00', 1260.00, 0.00, 3),
('2026-04-06 14:00:00', 280.00, 0.00, 4),
('2026-04-09 11:15:00', 600.00, 80.00, 5), -- Exemplo de devolução com atraso
('2026-04-09 08:45:00', 750.00, 0.00, 6),
('2026-04-12 13:20:00', 1350.00, 0.00, 7),
('2026-04-15 16:00:00', 1855.00, 0.00, 8),
('2026-04-12 09:00:00', 1200.00, 150.00, 9), -- Exemplo de devolução com atraso
('2026-04-14 10:30:00', 680.00, 0.00, 10),
('2026-04-13 08:00:00', 610.00, 0.00, 11),
('2026-04-18 14:45:00', 2820.00, 0.00, 12),
('2026-04-20 11:00:00', 2240.00, 0.00, 13),
('2026-04-16 15:30:00', 690.00, 0.00, 14),
('2026-04-19 09:15:00', 1560.00, 0.00, 15),
('2026-04-22 12:00:00', 2910.00, 0.00, 16),
('2026-04-21 08:30:00', 3520.00, 0.00, 17),
('2026-04-25 10:00:00', 4305.00, 0.00, 18),
('2026-04-23 14:00:00', 680.00, 0.00, 19),
('2026-04-24 16:30:00', 2600.00, 0.00, 20);

-- 9. Inserindo 20 Manutenções (Distribuidas entre os veículos)
INSERT INTO Manutencoes (descricao, data_inicio, data_fim, custo_reparo, fk_id_veiculo) VALUES
('Troca de óleo e filtro', '2026-01-10', '2026-01-10', 250.00, 1),
('Alinhamento e balanceamento', '2026-01-15', '2026-01-16', 150.00, 2),
('Substituição de pastilhas de freio', '2026-02-05', '2026-02-06', 300.00, 3),
('Revisão de 10.000 km', '2026-02-20', '2026-02-21', 450.00, 4),
('Troca de bateria', '2026-03-01', '2026-03-01', 500.00, 5),
('Higienização interna', '2026-03-10', '2026-03-11', 120.00, 6),
('Reparo no ar condicionado', '2026-03-15', '2026-03-17', 600.00, 7),
('Troca de pneus', '2026-04-01', '2026-04-02', 1200.00, 8),
('Revisão elétrica', '2026-04-05', '2026-04-06', 350.00, 9),
('Funilaria e pintura (Para-choque)', '2026-04-10', '2026-04-15', 850.00, 10),
('Troca de correia dentada', '2026-01-25', '2026-01-26', 700.00, 11),
('Troca de amortecedores', '2026-02-12', '2026-02-14', 1100.00, 12),
('Limpeza de bicos injetores', '2026-02-28', '2026-03-01', 280.00, 13),
('Troca do fluido de freio', '2026-03-05', '2026-03-05', 180.00, 14),
('Revisão de suspensão', '2026-03-20', '2026-03-22', 900.00, 15),
('Troca de palhetas do limpador', '2026-04-02', '2026-04-02', 80.00, 16),
('Reparo no câmbio automático', '2026-04-08', '2026-04-12', 2500.00, 17),
('Cristalização de pintura', '2026-04-15', '2026-04-16', 400.00, 18),
('Troca de lâmpadas do farol', '2026-04-18', '2026-04-18', 100.00, 19),
('Revisão geral', '2026-04-20', '2026-04-21', 650.00, 20);