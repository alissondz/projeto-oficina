-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (nome, endereco, telefone) VALUES
('João Silva', 'Rua A, 123', '123456789'),
('Maria Santos', 'Avenida B, 456', '987654321');

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (placa, modelo, ano, Cliente_idCliente) VALUES
('ABC1234', 'Fiat Uno', 2010, 1),
('XYZ9876', 'VW Gol', 2015, 2);

-- Inserindo dados na tabela Equipe
INSERT INTO Equipe (nome) VALUES
('Equipe A'),
('Equipe B');

-- Inserindo dados na tabela Mecanico
INSERT INTO Mecanico (codigo, nome, endereco, especialidade, Equipe_idEquipe) VALUES
('MEC01', 'Carlos Ferreira', 'Rua C, 789', 'Motor', 1),
('MEC02', 'Ana Pereira', 'Rua D, 101', 'Pintura', 2);

-- Inserindo dados na tabela Mao_de_Obra
INSERT INTO Mao_de_Obra (descricao, valorHora) VALUES
('Troca de óleo', 50.00),
('Revisão geral', 100.00);

-- Inserindo dados na tabela Ordem_de_Servico
INSERT INTO Ordem_de_Servico (numOS, dataEmissao, valorTotal, status, dataConclusao, Veiculo_placa, Equipe_idEquipe, Cliente_idCliente) VALUES
('OS001', '2023-01-10', 300.00, 'Concluído', '2023-01-15', 'ABC1234', 1, 1),
('OS002', '2023-02-20', 500.00, 'Em andamento', NULL, 'XYZ9876', 2, 2);

-- Inserindo dados na tabela Peca
INSERT INTO Peca (descricao, valor) VALUES
('Filtro de óleo', 30.00),
('Pastilha de freio', 80.00);

-- Inserindo dados na tabela Servico_OS
INSERT INTO Servico_OS (OS_idOS, quantidade, Mao_de_Obra_idMO) VALUES
(1, 1, 1),
(2, 2, 2);

-- Inserindo dados na tabela Peca_OS
INSERT INTO Peca_OS (OS_idOS, Peca_idPeca, quantidade) VALUES
(1, 1, 2),
(2, 2, 4);

-- Inserindo dados na tabela Equipe_Servico
INSERT INTO Equipe_Servico (Equipe_idEquipe, Servico_idServico) VALUES
(1, 1),
(2, 2);


-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (nome, endereco, telefone) VALUES
('João Silva', 'Rua A, 123', '123456789'),
('Maria Santos', 'Avenida B, 456', '987654321');

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (placa, modelo, ano, Cliente_idCliente) VALUES
('ABC1234', 'Fiat Uno', 2010, 1),
('XYZ9876', 'VW Gol', 2015, 2);

-- Inserindo dados na tabela Equipe
INSERT INTO Equipe (nome) VALUES
('Equipe A'),
('Equipe B');

-- Inserindo dados na tabela Mecanico
INSERT INTO Mecanico (codigo, nome, endereco, especialidade, Equipe_idEquipe) VALUES
('MEC01', 'Carlos Ferreira', 'Rua C, 789', 'Motor', 1),
('MEC02', 'Ana Pereira', 'Rua D, 101', 'Pintura', 2);

-- Inserindo dados na tabela Mao_de_Obra
INSERT INTO Mao_de_Obra (descricao, valorHora) VALUES
('Troca de óleo', 50.00),
('Revisão geral', 100.00);

-- Inserindo dados na tabela Ordem_de_Servico
INSERT INTO Ordem_de_Servico (numOS, dataEmissao, valorTotal, status, dataConclusao, Veiculo_placa, Equipe_idEquipe, Cliente_idCliente) VALUES
('OS001', '2023-01-10', 300.00, 'Concluído', '2023-01-15', 'ABC1234', 1, 1),
('OS002', '2023-02-20', 500.00, 'Em andamento', NULL, 'XYZ9876', 2, 2);

-- Inserindo dados na tabela Peca
INSERT INTO Peca (descricao, valor) VALUES
('Filtro de óleo', 30.00),
('Pastilha de freio', 80.00);

-- Inserindo dados na tabela Servico_OS
INSERT INTO Servico_OS (OS_idOS, quantidade, Mao_de_Obra_idMO) VALUES
(1, 1, 1),
(2, 2, 2);

-- Inserindo dados na tabela Peca_OS
INSERT INTO Peca_OS (OS_idOS, Peca_idPeca, quantidade) VALUES
(1, 1, 2),
(2, 2, 4);

-- Inserindo dados na tabela Equipe_Servico
INSERT INTO Equipe_Servico (Equipe_idEquipe, Servico_idServico) VALUES
(1, 1),
(2, 2);

-- Recuperar todos os clientes
SELECT * FROM Cliente;

-- Recuperar todos os veículos
SELECT * FROM Veiculo;

-- Recuperar ordens de serviço concluídas
SELECT * FROM Ordem_de_Servico WHERE status = 'Concluído';

-- Recuperar mecânicos da equipe com id 1
SELECT * FROM Mecanico WHERE Equipe_idEquipe = 1;

-- Calcular o valor total de peças em uma ordem de serviço
SELECT OS_idOS, SUM(quantidade * valor) AS valor_total_pecas
FROM Peca_OS
JOIN Peca ON Peca_OS.Peca_idPeca = Peca.idPeca
GROUP BY OS_idOS;

-- Recuperar todos os clientes ordenados por nome
SELECT * FROM Cliente ORDER BY nome;

-- Recuperar todas as ordens de serviço ordenadas por data de emissão
SELECT * FROM Ordem_de_Servico ORDER BY dataEmissao;

-- Recuperar ordens de serviço com mais de 3 peças usadas
SELECT OS_idOS, SUM(quantidade) AS total_pecas
FROM Peca_OS
GROUP BY OS_idOS
HAVING total_pecas > 3;



-- Recuperar informações detalhadas das ordens de serviço, incluindo cliente e veículo
SELECT os.idOS, os.numOS, c.nome AS cliente_nome, v.modelo AS veiculo_modelo, os.dataEmissao, os.valorTotal, os.status
FROM Ordem_de_Servico os
JOIN Cliente c ON os.Cliente_idCliente = c.idCliente
JOIN Veiculo v ON os.Veiculo_placa = v.placa;

-- Recuperar mecânicos e suas respectivas equipes
SELECT m.nome AS mecanico_nome, e.nome AS equipe_nome
FROM Mecanico m
JOIN Equipe e ON m.Equipe_idEquipe = e.idEquipe;