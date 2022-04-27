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