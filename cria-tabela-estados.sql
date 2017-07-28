CREATE TABLE estados (
id_estado SMALLINT ( 5 ) NOT NULL AUTO_INCREMENT PRIMARY KEY,
uf VARCHAR ( 2 ) NOT NULL,
estado VARCHAR ( 19 ) NOT NULL UNIQUE	
);

INSERT INTO estados VALUES ( NULL , "AC", "Acre");
INSERT INTO estados VALUES ( NULL , "AL", "Alagoas");
INSERT INTO estados VALUES ( NULL , "AP", "Amapá");						
INSERT INTO estados VALUES ( NULL , "AM", "Amazonas");
INSERT INTO estados VALUES ( NULL , "BA", "Bahia");
INSERT INTO estados VALUES ( NULL , "CE", "Ceará");
INSERT INTO estados VALUES ( NULL , "DF", "Distrito Federal");
INSERT INTO estados VALUES ( NULL , "ES", "Espirito Santo");
INSERT INTO estados VALUES ( NULL , "GO", "Goiás");
INSERT INTO estados VALUES ( NULL , "MA", "Maranhão");
INSERT INTO estados VALUES ( NULL , "MT", "Mato Grosso");
INSERT INTO estados VALUES ( NULL , "MS", "Mato Grosso do Sul");
INSERT INTO estados VALUES ( NULL , "MG", "Minas Gerais");
INSERT INTO estados VALUES ( NULL , "PA", "Pará");
INSERT INTO estados VALUES ( NULL , "PB", "Paraíba");
INSERT INTO estados VALUES ( NULL , "PR", "Paraná");
INSERT INTO estados VALUES ( NULL , "PE", "Pernambuco");
INSERT INTO estados VALUES ( NULL , "PI", "Piauí");
INSERT INTO estados VALUES ( NULL , "RN", "Rio Grande do Norte");
INSERT INTO estados VALUES ( NULL , "RS", "Rio Grande do Sul");
INSERT INTO estados VALUES ( NULL , "RJ", "Rio de Janeiro");
INSERT INTO estados VALUES ( NULL , "RO", "Rondônia");
INSERT INTO estados VALUES ( NULL , "RR", "Roraima");
INSERT INTO estados VALUES ( NULL , "SC", "Santa Catarina");
INSERT INTO estados VALUES ( NULL , "SP", "São Paulo");
INSERT INTO estados VALUES ( NULL , "SE", "Sergipe");
INSERT INTO estados VALUES ( NULL , "TO", "Tocantins");  
