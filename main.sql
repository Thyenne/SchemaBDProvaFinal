/* CRIANDO ESQUEMA*/
 CREATE SCHEMA `universidade` ;
 
 /* CRIANDO TABELAS*/
 CREATE TABLE `universidade`.`funcionario` (
  `registro` CHAR(5) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
`nome` VARCHAR(45) NOT NULL,
`rg` VARCHAR(9) NOT NULL,
`endereco` VARCHAR(50),
`cidade`VARCHAR(20),
`estado` CHAR(2),
`nacionalidade` VARCHAR(10),
`datanascimento` DATE,
`email` VARCHAR(50),
`salario` NUMERIC NOT NULL,
`coddependente` DECIMAL,
`cargo` VARCHAR(10),
`cnh` VARCHAR(10),
`admissao` DATETIME,
`demissao` DATETIME,
PRIMARY KEY (`registro`));

  CREATE TABLE `universidade`.`disciplina` (
  `coddisciplina` CHAR(5) NOT NULL,
  `codcurso` CHAR(5) NOT NULL,
  `nome` VARCHAR(40) NULL,
  `inclusao` DATETIME NULL,
  `exclusao` DATETIME NULL,
  PRIMARY KEY (`coddisciplina`));
  
CREATE TABLE `universidade`.`aluno` (
  `matricula` CHAR(10) NOT NULL,
  `codcurso` CHAR(5) NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `rg` VARCHAR(9) NOT NULL,
  `nacionalidade` VARCHAR(20) NOT NULL,
  `datanascimento` DATE NOT NULL,
  `email` VARCHAR(30) NULL,
  `turno` CHAR(5) NOT NULL,
  `datamatricula` DATETIME NOT NULL,
  `endereço` VARCHAR(45) NULL,
  `cidade` VARCHAR(20) NULL,
  `estado` CHAR(2) NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC),
  UNIQUE INDEX `rg_UNIQUE` (`rg` ASC));
  
 create TABLE `universidade`.`curso` (
  `codcurso` char(5) NOT NULL,
   `nome` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`codcurso`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC));
  
   
  CREATE TABLE `universidade`.`turma` (
  `codturma` CHAR(5) NOT NULL,
  `codprofessor` VARCHAR(5) NOT NULL,
  `coddisciplina` CHAR(3) NOT NULL,
  `inicio` DATE NULL,
  `fim` DATE NULL,
  `descricao` VARCHAR(45) NULL,
  `horario` TIME NULL,
 PRIMARY KEY (`codturma`));
  
  CREATE TABLE `universidade`.`historicoaluno` (
  `matricula` CHAR(10) NOT NULL,
  `codturma` CHAR(5) NOT NULL,
  `notas` DECIMAL NULL,
  `faltas` VARCHAR(45) NULL,
  `advertencias` DECIMAL NULL,
  `semestre` DECIMAL NULL,
  PRIMARY KEY (`matricula`, `codturma`));

 CREATE TABLE `universidade`.`professor` (
  `registro` CHAR(5) NOT NULL,
  `codturma` CHAR(5) NULL,
FOREIGN KEY (`registro`) REFERENCES funcionario(`registro`)
);

 CREATE TABLE `universidade`.`dependente` (
 `coddependente` DECIMAL NOT NULL,
 `registrofuncionario` CHAR(5) NOT NULL,
 `rg` VARCHAR(9) NOT NULL,
 `nome` VARCHAR(30),
 PRIMARY KEY (`coddependente`)
 );
 
/* ADICIONANDO OUTRAS CHAVES ESTRANGEIRAS*/
ALTER TABLE `universidade`.`disciplina`
ADD FOREIGN KEY (`codcurso`) REFERENCES curso(`codcurso`);

ALTER TABLE `universidade`.`aluno`
ADD FOREIGN KEY (`codcurso`) REFERENCES curso(`codcurso`);

ALTER TABLE `universidade`.`turma`
ADD FOREIGN KEY (`coddisciplina`) REFERENCES disciplina(`coddisciplina`);

ALTER TABLE `universidade`.`historicoaluno` 
ADD FOREIGN KEY (`codturma`) REFERENCES turma(`codturma`);

ALTER TABLE `universidade`.`dependente` 
ADD FOREIGN KEY (`registrofuncionario`) REFERENCES funcionario(`registro`);



/* INSERINDO NO BANCO 
(NÃO POR ESSA PARTE DE BAIXO NO TRABALHO)*/



INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('001','Artes');

INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('002','Arquitetura');

INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('003','Biologia');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('004','Bioquímica');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('005','Biomedicina');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('006','Biologia Marinha');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('007','Ciencias contábeis');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('008','Administração');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('009','Veterinaria');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('010','Direito');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('011','Educação Física');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('012','Medicina');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('013','Matemática');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('014','Engenharia Elétrica');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('015','Química');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('016','Física');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('017','História');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('018','Geografia');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('019','Filosofia');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('020','Psicologia');
INSERT INTO `universidade`.`curso` (`codcurso`,`nome`)
VALUES ('021','Sociologia');

/*UPDATE curso
SET codcurso = '021'
WHERE nome = 'Sociologia';*/


INSERT INTO `universidade`.`disciplina` (`coddisciplina`,`codcurso`,`nome`,`inclusao`,`exclusao`)
VALUES ('131','013','Lógica Matemática','2021-02-01 00:00:00','2021-06-30 23:59:59');

INSERT INTO `universidade`.`disciplina` (`coddisciplina`,`codcurso`,`nome`,`inclusao`,`exclusao`)
VALUES ('132','013','Geometria Analítica','2021-02-01 00:00:00','2021-06-30 23:59:59');

INSERT INTO `universidade`.`disciplina` (`coddisciplina`,`codcurso`,`nome`,`inclusao`,`exclusao`)
VALUES ('161','016','Física Básica Teórica','2021-02-01 00:00:00','2021-06-30 23:59:59');

INSERT INTO `universidade`.`disciplina` (`coddisciplina`,`codcurso`,`nome`,`inclusao`,`exclusao`)
VALUES ('162','016','Física Moderna','2021-02-01 00:00:00','2021-06-30 23:59:59');

INSERT INTO `universidade`.`disciplina` (`coddisciplina`,`codcurso`,`nome`,`inclusao`,`exclusao`)
VALUES ('141','014','Introdução à Engenharia','2021-02-01 00:00:00','2021-06-30 23:59:59');

INSERT INTO `universidade`.`disciplina` (`coddisciplina`,`codcurso`,`nome`,`inclusao`,`exclusao`)
VALUES ('142','014','Eletromagnetismo','2021-02-01 00:00:00','2021-06-30 23:59:59');

INSERT INTO `universidade`.`disciplina` (`coddisciplina`,`codcurso`,`nome`,`inclusao`,`exclusao`)
VALUES ('151','015','Bioquímica','2021-02-01 00:00:00','2021-06-30 23:59:59');

INSERT INTO `universidade`.`disciplina` (`coddisciplina`,`codcurso`,`nome`,`inclusao`,`exclusao`)
VALUES ('152','015','Química Analítica','2021-02-01 00:00:00','2021-06-30 23:59:59');




INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('5966778912','002','Diego Barcelos', '33999876541','124587669','brasileira','1991-08-03',
'bardiego@hotmail.com','manhã','2016-03-01 08:40:03','Rua Y número 404 bairro X',
'Rio de Janeiro','RJ');

INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2189877665','003','Fatima Alencar', '33999876987','985897669','brasileira','2000-12-27',
'fatinha@hotmail.com','noite','2017-03-01 10:00:03','Rua B número 404 bairro Doce Doce',
'Rio de Janeiro','RJ');

INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('3455566780','004','Eduardo Vilena', '11121314150','303099887','brasileira','1990-12-20',
'vinny@hotmail.com','tarde','2015-03-01 10:10:03','Rua B número 2000 bairro Lindo',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('4509669705','005','Jéssica Tatiane Flávia Jesus', '1746711516','437867379','brasileira','1992-07-01',
'jessjesus-91@lidertel.com.br','tarde','2016-03-01 11:20:03','Rua São Feliciano n 8 bairro Oliveiras',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('4913865663','006','Letícia Julia Isadora Costa', '2631830018','187691318','brasileira','1991-11-28',
'leticosta@id.uni.br','tarde','2012-01-11 16:10:03','Rua C n 1500 bairro Barbacena',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('1434003008','007','Vitor Eduardo Peixoto', '6662390413','796350312','brasileira','1995-06-18',
'vitoreduardo90@novot.org.br','tarde','2014-08-15 15:17:33','Rua D número 1512 bairro Novapole',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2673126674','008','Renan Diego Drumond', '5576358730','483951441','brasileira','1985-06-18',
'rdrumond@novot.org.br','tarde','2013-08-15 15:27:13','Rua Cassiano Barbosa n 12 bairro Teixeirão',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('3477766780','009','Kaique Drumond', '33321314150','483951432','brasileira','1991-12-20',
'diegonoah@hotmail.com','tarde','2013-08-15 15:37:03','Rua Cassiano Barbosa n 12 bairro Teixeirão',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2673126554','010','Augusto Lucas Almada', '5576358890','483951144','brasileira','1989-06-18',
'augustolucas@moen.com.br','tarde','2015-02-25 16:27:00','Rua Antônio Maia n 527 bairro Coroa do Meio',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2673127854','011','Thomas Benedito Guilherme da Rocha', '94113814996','395318452','brasileira','1987-09-07',
'tbgrocha-77@silicotex.net','tarde','2016-03-25 16:07:50','Rua Anari número 406 bairro Cohab',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2673127999','012','Elaine Ana Isis Nogueira', '96111785303','418009053','brasileira','1984-02-15',
'elainenogueira94@willianfd.com','tarde','2017-01-15 12:57:50','Rua O n 649 bairro Loteamento Pq das Rosas',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2673128140','013','Luiza Elisa Sales', '75261303737','309256719','brasileira','1985-09-27',
'luizaelisasales-71@yahoo.de','tarde','2011-09-25 14:31:03','Rua Malafaia número 246 bairro Araxá',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2673128270','014','Pietra Regina Isabelle Barbosa', '36974143052','101080815','brasileira','1992-03-06',
'pribarbosa_@akaer.com.br','tarde','2015-12-01 13:11:00','Rua Prof Pedro Gardés n 949 Jardim Aclimação',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2673128350','015','Kaique Henrique Calebe da Silva', '93074367202','425501863','brasileira','1981-05-02',
'khcsilva@pw.alston.com','tarde','2017-11-21 14:47:10','Rua MMM  n 785 bairro Setor Três Marias',
'Rio de Janeiro','RJ');



INSERT INTO `universidade`.`funcionario` (`registro`,`cpf`,`nome`,`rg`,`endereco`,`cidade`,`estado`,`nacionalidade`,
`datanascimento`,`email`,`salario`,`coddependente`,`cargo`,`cnh`,`admissao`)
VALUES ('00001','51262430712','Danilo Elias Aparício','176941848','Rua Haydéia n 924 Miramar','Rio das Ostras',
'RJ','brasileira','1994-01-12','daniloelias@umbernardo.com.br','1100','112','faxineiro','2946404575',
'2017-11-11 16:48:10');


INSERT INTO `universidade`.`funcionario` (`registro`,`cpf`,`nome`,`rg`,`endereco`,`cidade`,`estado`,`nacionalidade`,
`datanascimento`,`email`,`salario`,`coddependente`,`cargo`,`cnh`,`admissao`)
VALUES ('00002','85014246761','Vitor Victor Lima','174636313','Rua Roberto Ribeiro n 360 Jardim das Acácias','Belford Roxo',
'RJ','brasileira','1976-07-21','vitorvictor@lojabichopapao.com.br','4320','102','professor','6540159028',
'2016-09-05 10:38:30');


INSERT INTO `universidade`.`funcionario` (`registro`,`cpf`,`nome`,`rg`,`endereco`,`cidade`,`estado`,`nacionalidade`,
`datanascimento`,`email`,`salario`,`coddependente`,`cargo`,`cnh`,`admissao`)
VALUES ('00003','86902441740','Benjamin Nicolas Fábio Gomes','268179657','Rua Seis n 533 Recreio dos Bandeirantes','Rio de Janeiro',
'RJ','brasileira','1970-03-06','bbenjaminnicolas@grupoitamaraty.com.br','1418','205','porteiro','0551986936',
'2018-11-25 11:28:35');


INSERT INTO `universidade`.`funcionario` (`registro`,`cpf`,`nome`,`rg`,`endereco`,`cidade`,`estado`,`nacionalidade`,
`datanascimento`,`email`,`salario`,`coddependente`,`cargo`,`cnh`,`admissao`)
VALUES ('00004','21068236736','Raimundo Emanuel Figueiredo','179072018','Rua Edorezio Moura n 175 Campo Grande','Rio de Janeiro',
'RJ','brasileira','1971-09-03','rraimundoemanuel@valparaibaimoveis.com.br','4210','151','professor','9112695735',
'2017-01-02 13:48:55');


INSERT INTO `universidade`.`funcionario` (`registro`,`cpf`,`nome`,`rg`,`endereco`,`cidade`,`estado`,`nacionalidade`,
`datanascimento`,`email`,`salario`,`coddependente`,`cargo`,`cnh`,`admissao`)
VALUES ('00005','28749895761','Geraldo Theo Caleb Cavalcanti','194391346','Rua Mocangue n 528 Chácaras Rio-Petrópolis','Duque de Caxias',
'RJ','brasileira','1990-05-22','geraldotheocalebcavalcanti@arteche.com.br','4030','263','professor','1473974317',
'2019-06-12 18:27:23');


INSERT INTO `universidade`.`funcionario` (`registro`,`cpf`,`nome`,`rg`,`endereco`,`cidade`,`estado`,`nacionalidade`,
`datanascimento`,`email`,`salario`,`coddependente`,`cargo`,`cnh`,`admissao`)
VALUES ('00006','47434063742','Carolina Sophia Monteiro','240257017','Rua Paulino Afonso 477 n 893 Centro','Petrópolis',
'RJ','brasileira','1976-05-16','carolinasophiamonteiro_@yahoo.com.br','4950','143','professor','0742615261',
'2015-02-25 12:13:19');


INSERT INTO `universidade`.`funcionario` (`registro`,`cpf`,`nome`,`rg`,`endereco`,`cidade`,`estado`,`nacionalidade`,
`datanascimento`,`email`,`salario`,`coddependente`,`cargo`,`cnh`,`admissao`)
VALUES ('00007','14599440701','Filipe Carlos Eduardo Pires','469360641','Rua Santa Márcia n 458 Senador Camará','Rio de Janeiro',
'RJ','brasileira','1975-07-21','filipecarloseduardopires@gmail.com','4310','261','professor','2232610847',
'2014-01-17 13:40:25');

INSERT INTO `universidade`.`professor` (`registro`,`codturma`)
VALUES ('00002','00001');
INSERT INTO `universidade`.`professor` (`registro`,`codturma`)
VALUES ('00007','00002');
INSERT INTO `universidade`.`professor` (`registro`,`codturma`)
VALUES ('00002','00003');
INSERT INTO `universidade`.`professor` (`registro`,`codturma`)
VALUES ('00004','00004');


INSERT INTO `universidade`.`turma` (`codturma`,`codprofessor`,`coddisciplina`,`inicio`,`fim`,
`descricao`,`horario`)
VALUES ('00001','00002','131','2021-02-01','2021-06-30','Turma de Lógica Matemática','07:30:00');
INSERT INTO `universidade`.`turma` (`codturma`,`codprofessor`,`coddisciplina`,`inicio`,`fim`,
`descricao`,`horario`)
VALUES ('00002','00007','161','2021-02-01','2021-06-30','Turma de Física Básica Teórica','09:00:00');
INSERT INTO `universidade`.`turma` (`codturma`,`codprofessor`,`coddisciplina`,`inicio`,`fim`,
`descricao`,`horario`)
VALUES ('00004','00001','141','2021-02-01','2021-06-30','Turma de Introdução à Engenharia','07:30:00');
INSERT INTO `universidade`.`turma` (`codturma`,`codprofessor`,`coddisciplina`,`inicio`,`fim`,
`descricao`,`horario`)
VALUES ('00005','00004','151','2021-02-01','2021-06-30','Turma de Bioquímica','09:00:00');
INSERT INTO `universidade`.`turma` (`codturma`,`codprofessor`,`coddisciplina`,`inicio`,`fim`,
`descricao`,`horario`)
VALUES ('00007','00007','142','2021-02-01','2021-06-30','Turma de Eletromagnetismo','10:10:00');


INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('1221212121','021','Barbosa Soarez', '90123456789','233445667','mexicana','1995-01-20',
'bardosa@hotmail.com','tarde','2019-03-01 19:15:32','Rua Arriba número 3 bairro Abarro',
'Rio de Janeiro','RJ');

INSERT INTO `universidade`.`aluno` (`matricula`,`codcurso`,`nome`,`cpf`,`rg`,`nacionalidade`,`datanascimento`,
`email`,`turno`,`datamatricula`,`endereço`,`cidade`,`estado`)
VALUES ('2334455689','001','Carlos Santana', '44456678879','666788993','brasileira','1992-07-01',
'csantana@hotmail.com','noite','2017-03-01 08:15:32','Rua 9 número 101 bairro 1',
'Rio de Janeiro','RJ');


INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('1221212121','00001','10','3','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('1234567890','00001','9','0','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('5966778912','00001','10','3','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('3477766780','00001','9','0','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('2673126674','00001','9','0','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('1434003008','00001','9','0','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('4913865663','00001','9','0','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('4509669705','00002','9','0','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('3455566780','00002','9','0','0','1');

INSERT INTO `universidade`.`historicoaluno` (`matricula`,`codturma`,`notas`,`faltas`,`advertencias`,`semestre`)
VALUES ('2189877665','00002','3','0','3','1');





INSERT INTO `universidade`.`dependente` (`coddependente`,`rg`,`nome`,`registrofuncionario`)
VALUES ('261','102641687','Agatha Antonella Ramos','00002');
INSERT INTO `universidade`.`dependente` (`coddependente`,`rg`,`nome`,`registrofuncionario`)
VALUES ('143','389025884','Rodrigo Levi da Mota','00004');
INSERT INTO `universidade`.`dependente` (`coddependente`,`rg`,`nome`,`registrofuncionario`)
VALUES ('151','287484701','Mário Arthur Gabriel da Rocha','00007');

ALTER TABLE `universidade`.`professor`
ADD FOREIGN KEY (`codturma`) REFERENCES turma(`codturma`);

select registro, cargo, nome from universidade.funcionario
where cargo = 'professor';