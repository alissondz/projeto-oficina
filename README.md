# Descrição do Projeto: Sistema de Gestão de Oficina

## Contexto
Este projeto visa desenvolver um sistema de gestão para uma oficina mecânica, permitindo o controle de clientes, veículos, ordens de serviço, equipes de trabalho, mecânicos, peças utilizadas e serviços prestados. O sistema foi projetado para facilitar a gestão de todas as operações da oficina, desde o cadastro de clientes e veículos até a emissão e acompanhamento de ordens de serviço.

## Objetivos
1. **Gerenciamento de Clientes:** Cadastrar e manter informações atualizadas sobre os clientes da oficina.
2. **Gerenciamento de Veículos:** Registrar veículos dos clientes, associando-os aos proprietários e mantendo informações detalhadas sobre cada veículo.
3. **Gestão de Ordens de Serviço:** Emitir ordens de serviço, acompanhar o status, registrar a conclusão e calcular os custos totais.
4. **Equipes e Mecânicos:** Organizar equipes de trabalho e associar mecânicos a essas equipes, permitindo uma gestão eficiente dos recursos humanos.
5. **Controle de Peças e Serviços:** Gerenciar o estoque de peças e registrar os serviços prestados em cada ordem de serviço.

## Modelo Conceitual
O modelo conceitual do banco de dados foi desenvolvido utilizando o modelo entidade-relacionamento (ER), representando as entidades principais (Cliente, Veículo, Ordem de Serviço, Equipe, Mecanico, Peça, Serviço e Mao-de-Obra) e seus relacionamentos.

## Modelo Lógico
Com base no modelo conceitual, foi criado o esquema lógico do banco de dados, detalhando as tabelas, campos, tipos de dados e relações entre as tabelas. Abaixo estão as principais tabelas do esquema lógico:

### Cliente
- **idCliente** INT (PK)
- **nome** VARCHAR(45)
- **endereco** VARCHAR(255)
- **telefone** VARCHAR(20)

### Veiculo
- **placa** VARCHAR(10) (PK)
- **modelo** VARCHAR(50)
- **ano** INT
- **Cliente_idCliente** INT (FK)

### Ordem de Servico (OS)
- **idOS** INT (PK)
- **numOS** VARCHAR(20)
- **dataEmissao** DATE
- **valorTotal** DECIMAL(10,2)
- **status** VARCHAR(20)
- **dataConclusao** DATE
- **Veiculo_placa** VARCHAR(10) (FK)
- **Equipe_idEquipe** INT (FK)
- **Cliente_idCliente** INT (FK)

### Equipe
- **idEquipe** INT (PK)
- **nome** VARCHAR(45)

### Mecanico
- **idMecanico** INT (PK)
- **codigo** VARCHAR(10)
- **nome** VARCHAR(100)
- **endereco** VARCHAR(255)
- **especialidade** VARCHAR(50)
- **Equipe_idEquipe** INT (FK)

### Peca
- **idPeca** INT (PK)
- **descricao** VARCHAR(100)
- **valor** DECIMAL(10,2)

### Servico_OS
- **OS_idOS** INT (FK)
- **idServico** INT (PK)
- **quantidade** INT
- **Mao_de_Obra_idMO** INT (FK)

### Peca_OS
- **OS_idOS** INT (FK)
- **Peca_idPeca** INT (FK)
- **quantidade** INT

### Mao-de-Obra
- **idMO** INT (PK)
- **descricao** VARCHAR(100)
- **valorHora** DECIMAL(10,2)

### Equipe_Servico
- **Equipe_idEquipe** INT (FK)
- **Servico_idServico** INT (FK)
