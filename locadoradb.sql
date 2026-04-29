-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS locadora_veiculos;
USE locadora_veiculos;

-- 1. Tabela de Administradores (NOVA - Independente)
CREATE TABLE Administradores (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    nivel_acesso ENUM('Super', 'Gerente') DEFAULT 'Gerente',
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Tabela de Categorias (Independente)
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE,
    valor_diaria_base DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB;

-- 3. Tabela de Seguros (Independente)
CREATE TABLE Seguros (
    id_seguro INT AUTO_INCREMENT PRIMARY KEY,
    tipo_cobertura VARCHAR(50) NOT NULL UNIQUE,
    valor_diario_seguro DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB;

-- 4. Tabela de Clientes (Independente)
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cnh_numero VARCHAR(20) NOT NULL UNIQUE,
    cnh_vencimento DATE NOT NULL,
    telefone VARCHAR(20)
) ENGINE=InnoDB;

-- 5. Tabela de Funcionários (Independente)
CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- 6. Tabela de Veículos (Depende de Categorias)
CREATE TABLE Veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(30) NOT NULL,
    ano INT NOT NULL,
    status ENUM('Disponível', 'Locado', 'Manutenção') DEFAULT 'Disponível',
    fk_id_categoria INT NOT NULL,
    CONSTRAINT fk_veiculo_categoria FOREIGN KEY (fk_id_categoria) 
        REFERENCES Categorias(id_categoria)
) ENGINE=InnoDB;

-- 7. Tabela de Locações (Depende de Clientes, Veículos, Funcionários e Seguros)
CREATE TABLE Locacoes (
    id_locacao INT AUTO_INCREMENT PRIMARY KEY,
    data_retirada DATETIME NOT NULL,
    data_prevista_devolucao DATETIME NOT NULL,
    fk_id_cliente INT NOT NULL,
    fk_id_veiculo INT NOT NULL,
    fk_id_funcionario INT NOT NULL,
    fk_id_seguro INT NOT NULL,
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (fk_id_cliente) 
        REFERENCES Clientes(id_cliente),
    CONSTRAINT fk_locacao_veiculo FOREIGN KEY (fk_id_veiculo) 
        REFERENCES Veiculos(id_veiculo),
    CONSTRAINT fk_locacao_funcionario FOREIGN KEY (fk_id_funcionario) 
        REFERENCES Funcionarios(id_funcionario),
    CONSTRAINT fk_locacao_seguro FOREIGN KEY (fk_id_seguro) 
        REFERENCES Seguros(id_seguro)
) ENGINE=InnoDB;

-- 8. Tabela de Devoluções (Depende de Locações - Relacionamento 1:1)
CREATE TABLE Devolucoes (
    id_devolucao INT AUTO_INCREMENT PRIMARY KEY,
    data_entrega_real DATETIME NOT NULL,
    valor_total_pago DECIMAL(10, 2) NOT NULL,
    valor_multa DECIMAL(10, 2) DEFAULT 0.00,
    fk_id_locacao INT NOT NULL UNIQUE,
    CONSTRAINT fk_devolucao_locacao FOREIGN KEY (fk_id_locacao) 
        REFERENCES Locacoes(id_locacao)
) ENGINE=InnoDB;

-- 9. Tabela de Manutenções (Depende de Veículos)
CREATE TABLE Manutencoes (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    custo_reparo DECIMAL(10, 2),
    fk_id_veiculo INT NOT NULL,
    CONSTRAINT fk_manutencao_veiculo FOREIGN KEY (fk_id_veiculo) 
        REFERENCES Veiculos(id_veiculo)
) ENGINE=InnoDB;