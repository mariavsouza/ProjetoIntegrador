CREATE DATABASE IF NOT EXISTS NutriStreak;

USE NutriStreak;

CREATE TABLE Usuarios(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(16) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Senha VARCHAR(100) NOT NULL,
    Pontos INT NOT NULL DEFAULT 0
);

CREATE TABLE CheckIns(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioId INT NOT NULL,
    DataCheckIn DATE NOT NULL,
    Agua BOOLEAN NOT NULL,
    FrutasVerduras BOOLEAN NOT NULL,
    EvitouUltraprocessados BOOLEAN NOT NULL,
    Pontos INT NOT NULL,
    UNIQUE (UsuarioId, DataCheckIn),
    FOREIGN KEY (UsuarioId) REFERENCES 
    Usuarios(Id)
);

CREATE TABLE Refeicoes(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioId INT NOT NULL,
    Alimentos TEXT NOT NULL,
    Avaliacao TEXT NOT NULL,
    DataRefeicao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UsuarioId) REFERENCES 
    Usuarios(Id)
);

CREATE TABLE PlanejamentoRefeicoes(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioId INT NOT NULL,
    DataRefeicao DATE NOT NULL,
    TipoRefeicao VARCHAR(30) NOT NULL,
    Descricao TEXT NOT NULL,
    FOREIGN KEY (UsuarioId) REFERENCES 
    Usuarios(Id)
);