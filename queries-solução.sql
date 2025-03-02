-- 1 - Buscar o nome e ano dos filmes
SELECT Nome, Ano 
FROM dbo.Filmes;


-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano 
FROM dbo.Filmes
ORDER BY Ano ASC;


-- 3 - Buscar pelo filme "De Volta para o Futuro", trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao 
FROM dbo.Filmes
WHERE Nome = 'De Volta para o Futuro';


-- 4 - Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao
FROM dbo.Filmes
WHERE Ano = 1997;


-- 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao
FROM dbo.Filmes
WHERE Ano > 2000;


-- 6 - Buscar os filmes com a duração maior que 100 e menor que 150, ordenando pela duração em ordem crescente
SELECT Nome, Duracao
FROM dbo.Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao ASC;


-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duração em ordem decrescente
SELECT Ano, 
       COUNT(*) AS QuantidadeFilmes, 
       AVG(Duracao) AS MediaDuracao
FROM dbo.Filmes
GROUP BY Ano
ORDER BY Duracao DESC;


-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome e o UltimoNome
SELECT PrimeiroNome, UltimoNome
FROM dbo.Atores
WHERE Genero = 'M';


-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome, UltimoNome
FROM dbo.Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome ASC;


-- 10 - Buscar o nome do filme e o gênero
SELECT f.Nome, g.Genero
FROM dbo.Filmes f
INNER JOIN dbo.FilmesGenero fg ON f.Id = fg.IdFilme
INNER JOIN dbo.Generos g ON fg.IdGenero = g.Id;


-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT f.Nome, g.Genero
FROM dbo.Filmes f
INNER JOIN dbo.FilmesGenero fg ON f.Id = fg.IdFilme
INNER JOIN dbo.Generos g ON fg.IdGenero = g.Id
WHERE g.Genero = 'Mistério';


-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT f.Nome AS Filme, 
       a.PrimeiroNome, 
       a.UltimoNome, 
       ef.Papel
FROM dbo.Filmes f
INNER JOIN dbo.ElencoFilme ef ON f.Id = ef.IdFilme
INNER JOIN dbo.Atores a ON ef.IdAtor = a.Id;