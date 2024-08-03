CREATE DATABASE Oficina;
USE Oficina;

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE Veiculo (
    placa VARCHAR(10) PRIMARY KEY,
    modelo VARCHAR(50),
    ano INT,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Equipe (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45)
);

CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10),
    nome VARCHAR(100),
    endereco VARCHAR(255),
    especialidade VARCHAR(50),
    Equipe_idEquipe INT,
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Mao_de_Obra (
    idMO INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    valorHora DECIMAL(10,2)
);

CREATE TABLE Ordem_de_Servico (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    numOS VARCHAR(20),
    dataEmissao DATE,
    valorTotal DECIMAL(10,2),
    status VARCHAR(20),
    dataConclusao DATE,
    Veiculo_placa VARCHAR(10),
    Equipe_idEquipe INT,
    Cliente_idCliente INT,
    FOREIGN KEY (Veiculo_placa) REFERENCES Veiculo(placa),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    valor DECIMAL(10,2)
);

CREATE TABLE Servico_OS (
    OS_idOS INT,
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT,
    Mao_de_Obra_idMO INT,
    FOREIGN KEY (OS_idOS) REFERENCES Ordem_de_Servico(idOS),
    FOREIGN KEY (Mao_de_Obra_idMO) REFERENCES Mao_de_Obra(idMO)
);

CREATE TABLE Peca_OS (
    OS_idOS INT,
    Peca_idPeca INT,
    quantidade INT,
    FOREIGN KEY (OS_idOS) REFERENCES Ordem_de_Servico(idOS),
    FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca)
);

CREATE TABLE Equipe_Servico (
    Equipe_idEquipe INT,
    Servico_idServico INT,
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe),
    FOREIGN KEY (Servico_idServico) REFERENCES Servico_OS(idServico),
    PRIMARY KEY (Equipe_idEquipe, Servico_idServico)
);
