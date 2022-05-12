 
 --criação das tabelas no banco de dados uvv
 
CREATE TABLE departamento
(
    numero_departamento integer NOT NULL,
    nome_departamento varchar(15) NOT NULL,
    cpf_gerente char(11) NOT NULL,
    data_inicio_gerente date,
    PRIMARY KEY (numero_departamento),
    UNIQUE (nome_departamento),
    FOREIGN KEY (cpf_gerente) references funcionario(cpf)
);       

CREATE TABLE dependente
(
    cpf_funcionario char(11) NOT NULL,
    nome_dependente varchar(15) NOT NULL,
    sexo character(1),
    data_nascimento date,
    PRIMARY KEY (cpf_funcionario, nome_dependente),
    FOREIGN KEY (cpf_funcionario) REFERENCES funcionario (cpf) 
);       

CREATE TABLE funcionario
(
    cpf char(11) NOT NULL,
    primeiro_nome varchar(15) NOT NULL,
    nome_meio char(1),
    ultimo_nome varchar(15) NOT NULL,
    data_nascimento date,
    endereco varchar(50),
    sexo char(1),
    salario decimal(10,2),
    cpf_supervisor char(11) NOT NULL,
    numero_departamento integer NOT NULL,
    PRIMARY KEY (cpf),
    FOREIGN KEY (cpf_supervisor) REFERENCES funcionario (cpf)
);       

 CREATE TABLE localizacoes_departamento
(
    numero_departamento integer NOT NULL,
    local_ varchar(15) NOT NULL,
    PRIMARY KEY (numero_departamento, local_),
    FOREIGN KEY (numero_departamento) REFERENCES departamento (numero_departamento) 
);                

CREATE TABLE projeto
(
    numero_projeto integer NOT NULL,
    nome_projeto varchar(15) NOT NULL,
    local_projeto varchar(15),
    numero_departamento integer NOT NULL,
    PRIMARY KEY (numero_projeto),
    UNIQUE (nome_projeto),
    FOREIGN KEY (numero_departamento) REFERENCES departamento (numero_departamento) 
);

CREATE TABLE trabalha_em
(
    cpf_funcionario char(11) NOT NULL references funcionario(cpf),
    numero_projeto integer NOT NULL references projeto(numero_projeto),
    horas decimal(3,1) NOT NULL,
    PRIMARY KEY (cpf_funcionario, numero_projeto)
);

--inserindo os dados nas tabelas criadas

insert into funcionario ( primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values 
( 'João', 'B','Silva','12345678966', '09-01-1965', 'RuadasFlores, 751, São Paulo, SP', 'M', 30.000, '33344555587', 5),
('Fernando', 'T','Wong', '33344555587', '08-12-1955', 'Rua da Lapa, 34 ,São Paulo, SP', 'M', 40.000, '88866555576', 5),
('Alice','J','Zelaya', '99988777767', '19-01-1968', 'Rua Souza Lima, 35, Curitiba,PR', 'F', 25.000, '98765432168', 4),
( 'Jennifer','S', 'Souza', '98765432168', '20-06-1941', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43.000, '88866555576', 4),
( 'Ronaldo','K', 'Lima', '66688444476', '15-09-1962', 'Rua Rebouças, 65,Piracicaba,SP', 'M', 38.000, '33344555587', 5),
( 'Joice', 'A', 'Leite', '45345345376', '31-07-1972', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25.000, '33344555587', 5),
('André', 'V', 'Pereira', '98798798733', '29-03-1969', 'Rua Timbira, 35, São Paulo, SP', 'M',  25.000, '98765432168', 4),
('Jorge', 'E', 'Brito', '88866555576', '10-11-1937', 'Rua do Horta, 35, São Paulo, SP', 'M', 55.000, '98765432168' , 1);

insert into projeto(nome_projeto, numero_projeto, local_projeto, numero_departamento)
values
('ProdutoX', 1, 'Santo André', 5),
('ProdutoY', 2, 'Itu', 5),
('ProdutoZ', 3, 'São Paulo', 5),
('Informatização', 10, 'Mauá', 4),
('Reorganização', 20, 'São Paulo', 1),
('Novosbenefícios', 30, 'Mauá', 4);

insert into dependente(cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
values
('33344555587', 'Alicia', 'F', '05-04-1986', 'Filha'),
('33344555587', 'Tiago', 'M', '25-10-1983', 'Filho'),
('33344555587', 'Janaína', 'F', '03-05-1958', 'Esposa'),
('98765432168', 'Antonio', 'M', '28-02-1942', 'Marido'),
('12345678966', 'Michael', 'M', '04-01-1988', 'Filho'),
('12345678966', 'Alicia', 'F', '30-12-1988', 'Filha'),
('12345678966', 'Elizabeth', 'F', '05-05-1967', 'Esposa');

insert into trabalha_em(cpf_funcionario, numero_projeto, horas)
values
('12345678966', 1, 32.5),
('12345678966', 2, 7.5),
('66688444476', 3, 40.0),
('66688444476', 1, 20.0),
('66688444476', 2, 20.0),
('33344555587', 2, 10.0),
('33344555587', 3, 10.0),
('33344555587', 10, 10.0),
('33344555587', 20, 10.0),
('99988777767', 30, 30.0),
('99988777767', 10, 10.0),
('98798798733', 10, 35.0),
('98798798733', 30, 5.0),
('98765432168', 30, 20.0),
('98765432168', 20, 15.0),
('88866555576', 20, 15.0);

insert into departamento ( nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
values
('Pesquisa', 5, '33344555587', '22-05-1988'),
('Administração', 4, '98765432168', '01-01-1995'),
('Matriz', 1, '88866555576', '19-06-1981');

insert into localizacoes_departamento (numero_departamento, local_)
values
(1, 'São Paulo'),
(4, 'Mauá'),
(5, 'Santo André'),
(5, 'Itu'),
(5, 'São Paulo');

