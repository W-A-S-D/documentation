create database wasd;
-- drop database wasd;
use wasd;
CREATE TABLE EMPRESA (
	empresa_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    , nome VARCHAR(100) NOT NULL
	, email_empresarial VARCHAR(50) NOT NULL
	, cnpj CHAR(14) NOT NULL
	, logradouro varchar(100) NOT NULL
	, numero INT
	, bairro VARCHAR(25) NOT NULL
	, cidade VARCHAR(30) NOT NULL
	, uf CHAR(2) NOT NULL
	, cep CHAR(9) NOT NULL
	, telefone VARCHAR(11) NOT NULL
);

CREATE TABLE USUARIO (
	usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    , fk_empresa INT NOT NULL
    , nome VARCHAR(100) NOT NULL
    , login VARCHAR(50) NOT NULL
    , senha VARCHAR(30) NOT NULL
    , nivelAcesso INT NOT NULL
    , avatar VARCHAR(255)
    , criado DATETIME NOT NULL
    , atualizado DATETIME NOT NULL
    , FOREIGN KEY(fk_empresa) REFERENCES EMPRESA(empresa_id)
);

CREATE TABLE MAQUINA (
	maquina_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    , nome VARCHAR(30) NOT NULL
    , so VARCHAR(15) NOT NULL
    , cpu VARCHAR(50) NOT NULL
    , ram DECIMAL(6,2) NOT NULL
    , disco DECIMAL(6,2) NOT NULL
    , gpu VARCHAR(50) NOT NULL
    , status VARCHAR(20) NOT NULL
);



CREATE TABLE SETOR (
	setor_id INT NOT NULL
    , fk_usuario INT NOT NULL
    , fk_maquina INT NOT NULL
    , jogo VARCHAR(50) NOT NULL
    , FOREIGN KEY(fk_usuario) REFERENCES USUARIO(usuario_id)
	, FOREIGN KEY(fk_maquina) REFERENCES EMPRESA(empresa_id)
);

CREATE TABLE PROCESSOS (
	processos_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    , fk_maquina INT NOT NULL
    , nome VARCHAR(30) NOT NULL
    , status VARCHAR(30) NOT NULL
    , iniciado DATETIME NOT NULL
    , encerrado DATETIME 
	, FOREIGN KEY(fk_maquina) REFERENCES MAQUINA(maquina_id)
);

CREATE TABLE LOG (
	log_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    , fk_maquina INT NOT NULL
    , freq_cpu DECIMAL(6,2) NOT NULL
    , uso_ram DECIMAL(6,2) NOT NULL
    , uso_disco DECIMAL(6,2) NOT NULL
    , temperatura DECIMAL(6,2) NOT NULL
    , criado DATETIME NOT NULL
	, FOREIGN KEY(fk_maquina) REFERENCES MAQUINA(maquina_id)
);

CREATE TABLE NOTIFICACOES (
	notificacao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    , fk_log INT NOT NULL
    , mensagem VARCHAR(30)
	, FOREIGN KEY(fk_log) REFERENCES LOG(log_id)
);





/*INSERT INTO EMPRESA(
  nome,
  email_empresarial,
  cnpj,
  logradouro,
  numero,
  bairro,
  cidade,
  uf,
  cep,
  telefone
) VALUES (
  'juninhoCorp',
  'juninho@gmail.com',
  '12345678911234',
  'Rua Paulo Ramos',
   25,
   'Vila',
   'São Paulo',
    'SP',
    '08461200',
    '95790779'
);



INSERT INTO MAQUINA (
maquina_id, nome, so, cpu, ram, disco, gpu, status) 
VALUES  (1, 'dell86', 'Windows', 12.9, 15.0, 500.4, 31.0, 'ativo');


INSERT INTO USUARIO( fk_empresa, nome, login, senha, nivelAcesso, avatar, criado, atualizado) 
VALUES (1, 'Minoqui', 'wasd', '1234', 1, 'fotodahora.png', now(), now()); */

