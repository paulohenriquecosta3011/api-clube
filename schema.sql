CREATE DATABASE IF NOT EXISTS ClubeUva;
USE ClubeUva;

CREATE TABLE cidades (
   id_cidade INT UNSIGNED NOT NULL AUTO_INCREMENT,
   nome VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   uf_sigla CHAR(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   codigo_municipio VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (id_cidade)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE convidados (
   cpf VARCHAR(15) COLLATE utf8mb4_unicode_ci NOT NULL,
   nome VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
   data_cadastro TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   foto VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   PRIMARY KEY (cpf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE empresas (
   id_empresa INT UNSIGNED NOT NULL AUTO_INCREMENT,
   nome VARCHAR(150) COLLATE utf8mb4_unicode_ci NOT NULL,
   cnpj CHAR(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   id_cidade INT UNSIGNED DEFAULT NULL,
   endereco VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   telefone VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   email VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (id_empresa),
   UNIQUE KEY cnpj (cnpj),
   KEY id_cidade (id_cidade),
   CONSTRAINT empresas_ibfk_1 FOREIGN KEY (id_cidade) REFERENCES cidades (id_cidade)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO empresas VALUES 
(1,'Clube Uva','12.345.678/0001-90',1,'Rua Principal, 100','1234-5678','contato@clubeexemplo.com','2025-05-18 14:31:26','2025-05-18 14:31:26');

CREATE TABLE users (
   id_user INT UNSIGNED NOT NULL AUTO_INCREMENT,
   id_base INT DEFAULT NULL,
   name VARCHAR(63) COLLATE utf8mb4_unicode_ci NOT NULL,
   email VARCHAR(127) COLLATE utf8mb4_unicode_ci NOT NULL,
   nasc DATE DEFAULT NULL,
   password VARCHAR(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   createdAt TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
   updatedAt TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   CodigoValidacao INT DEFAULT NULL,
   id_empresa INT UNSIGNED DEFAULT NULL,
   tipo_user CHAR(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'S',
   PRIMARY KEY (id_user),
   KEY fk_usuarios_empresas (id_empresa),
   CONSTRAINT fk_usuarios_empresas FOREIGN KEY (id_empresa) REFERENCES empresas (id_empresa)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES 
(18,NULL,'Administrador','admin@hotmail.com',NULL,'$2b$10$tUEp49w/x6grzoIgjJOxkeVgjY2Qd1Tc0mOBLHgEpIZKtCueYgWTy','2025-05-18 15:51:28','2025-05-18 15:51:28',NULL,1,'A');
