-- Criação do Banco de Dados 
CREATE DATABASE biblioteca;

-- Selecionar o BD para uso 
USE biblioteca

-- Criar tabela cliente
-- Armazena os dados dos Clientes
CREATE TABLE Clientes(
    -- Identificador único (PK - chave primária)
    id_cliente INT  AUTO_INCREMENT PRIMARY KEY,
    -- Nome completo do cliente(obrigatório)
    nome VARCHAR(100) NOT NULL,

    -- Data de nascimento 
    data_nascimento DATE,

    -- CPF único para cada cliente (Restriçao de unicidade - UNIQUE)
    cpf VARCHAR(14) UNIQUE,

    -- Email do Cliente
    email VARCHAR(100)

    -- Telefone pra contato
    telefone VARCHAR(100) NOT NULL,

    -- Data de Cadastro
    data_cadastro DATE NOT NULL,
    
);

CREATE TABLE autores(
    -- Identificador único autores
    id_autor INT AUTO_INCREMENT PRIMARY KEY,

    -- Nome do Autor (Obrigatório - NOT NULL)
    nome VARCHAR(100) NOT NULL,

    -- Área de especialização (ex:Quantos anos trabalha na área da escrita) 
    especialidade VARCHAR(100) NOT NULL,

    -- Email do autor
    email VARCHAR(100) NOT NULL UNIQUE,

    -- Telefone para contato
    telefone VARCHAR(20)
);

CREATE TABLE Livros(
    -- Identificador Único do livro
    id_livro INT AUTO_INCREMENT PRIMARY KEY,

    -- Título do livro
    nome VARCHAR(100) NOT NULL

    -- Preço do Livro em reais
    preco_livro INT NOT NULL
);

    -- Tabela Gêneros
CREATE TABLE generos (
    --Identificador único do Gênero
    id_genero INT AUTO_INCREMENT PRIMARY KEY,

    -- FK para curso (cada livro pertence a um gênero)
    id_livro INT NOT NULL,

    -- FK para Autor (responsável pelo gênero do livro)
    id_autor INT AUTO_INCREMENT PRIMARY KEY,

    -- Ano de publicação (ex: 2026)
    ano INT NOT NULL,

    -- Faixa Etária
    faixaetaria INT NOT NULL

    -- Chave Estrangeira -> generos (1 gênero tem vários livros)
    FOREIGN KEY(id_genero)
        REFERENCES generos(id_genero)
        ON DELETE RESTRICT,
            -- RESTRICT impede apagar generos com livros vinculados

    -- Chave Estrangeira -> autores (1 autor pode ter vários livros vinculados)
    FOREIGN KEY (id_autor)
        REFERENCES autor(id_autor)
        ON DELETE RESTRICT
        -- Impede de excluir autores se ele estiver vinculado a um livro
);

-- Tabela: disciplina
CREATE TABLE disciplinas(
    -- Identificador da disciplina
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,

    -- Nome da disciplina
    nome VARCHAR(100) NOT NULL,

    -- Carga horária da disciplina
    carga_horaria INT NOT NUL
   -- Carga Horária da disciplina
        carga_horaria INT NOT NULL
);


--Tabela: curso_disciplinas
--Relacionamento N:N entre cursos e diciplinas


CREATE TABLE curso_disciplinas(
    --FK para curso
    id_curso INT NOT NULL


    --FK para disciplina
    id_disciplina INT NOT NULL


    --Chave primária composta (evita duplicidade)
    PRIMARY KEY (id_curso, id_disciplina),


    --FK /CURSOS
    FOREIGN KEY(id_curso)
    REFERENCES cursos(id_curso)
    ON DELETE CASCADE,
    -- Ao excluir curso, remove automaticamente relações



     --FK /Disciplina
    FOREIGN KEY(id_disciplina)
    REFERENCES disciplinas(id_disciplina)
    ON DELETE CASCADE
    --Ao excluir disciplina, remove automaticamente relações

    -- Tabela: notas
    -- Armazena notas dos alunos por disciplinas
    CREATE TABLE notas(

    --Identificador único
    id_nota INT AUTO_INCREMENT PRIMARY KEY,

    -- FK para aluno
    id_cliente INT NOT NULL

    -- FK para disciplina
    id_disciplina INT NOT NULL,

    -- Nota (Ex.: 7.5)
    nota DECIMAL(5,2)

        
    -- FK -> alunos (aluno pode ter várias notas) 
    FOREIGN KEY (id_aluno)
		REFERENCES alunos(id_aluno)
        
		ON DELETE CASCADE,
    -- se o aluno for excluído, suas notas também serão

-- FK -> disciplina 
FOREIGN KEY (id_disciplina)
	REFERENCES disciplinas(id_disciplina)
    ON DELETE RESTRICT,
    -- impede excluir disciplina com notas cadastradas
    
-- garante  que o aluno tenha apenas uma nota por disciplina 
UNIQUE (id_aluno, id_disciplina)

    
    );

    -- ALTER TABLE (Adicao da FK ALUNOS -> turmas)

-- 1. adicionar a coluna id_ turma na tabela alunos
-- Essa coluna irá armazenar a referência da turma do aluno 
ALTER TABLE alunos 
ADD COLUMN id_turma INT;

    -- 2. Torna a coluna obrigatória (NOT NULL)
    -- Garante que todo aluno esteja vinculado a uma turma
ALTER TABLE cliente
    MODIFY COLUMN id_genero INT NOT NULL

    -- 3. Cria chave estrangeira (relacionamento)
    ALTER TABLE alunos
    ADD CONSTRAINT fk_aluno_turma
    FOREIGN KEY (id_genero)
    REFERENCES generos(id_genero)
    ON DELETE RESTRICT;

-- EXPLICAÇÃO 
-- A chave estrangeira garante que:
-- 1: Todo aluno deve estar vinculado a uma turma existente
-- 2: Não é possivel inserir um aluno com uma turma inexistente 
-- 3: Não é possível excluir uma turma que posssua alunos vinculados (RESTRICT)

    



)
