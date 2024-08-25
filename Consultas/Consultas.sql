--1 - Buscar o nome e ano dos filmes
SELECT Nome, 
	   Ano 
FROM Filmes WITH (NOLOCK);

--2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, 
	   Ano 
FROM Filmes WITH (NOLOCK) 
ORDER BY Ano;

--3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, 
	   Ano, 
	   Duracao
FROM Filmes WITH (NOLOCK)
WHERE LOWER(Nome) = 'de volta para o futuro';

--4 - Buscar os filmes lançados em 1997
SELECT Nome, 
	   Ano, 
	   Duracao
FROM Filmes WITH (NOLOCK)
WHERE ano = 1997;

--5 - Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, 
	   Ano, 
	   Duracao
FROM Filmes WITH (NOLOCK)
WHERE ano > 2000;

--6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, 
	   Ano, 
	   Duracao
FROM Filmes WITH (NOLOCK)
WHERE Duracao between 101 and 149
ORDER BY Duracao;

--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, 
	   Count(*) AS 'Quantidade'
FROM Filmes WITH (NOLOCK)
GROUP BY Ano
ORDER BY 'Quantidade' DESC;

--8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT * 
FROM Atores WITH (NOLOCK)
WHERE Genero = 'M';

--9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT * 
FROM Atores WITH (NOLOCK)
WHERE Genero = 'F'
ORDER BY PrimeiroNome;

--10 - Buscar o nome do filme e o gênero
SELECT fi.Nome, ge.Genero
FROM Filmes fi WITH (NOLOCK)
INNER JOIN FilmesGenero fg WITH (NOLOCK) ON fi.Id = fg.IdFilme
INNER JOIN Generos ge WITH (NOLOCK) ON fg.IdGenero = ge.Id;

--11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT fi.Nome, 
	   ge.Genero
FROM Filmes fi WITH (NOLOCK)
INNER JOIN FilmesGenero fg WITH (NOLOCK) ON fi.Id = fg.IdFilme
INNER JOIN Generos ge WITH (NOLOCK) ON fg.IdGenero = ge.Id
WHERE LOWER(ge.Genero) like '%mist_rio%';

--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT fi.Nome, 
	   ato.PrimeiroNome, 
	   ato.UltimoNome, 
	   ef.Papel
FROM Filmes fi WITH (NOLOCK)
INNER JOIN ElencoFilme ef WITH (NOLOCK) ON fi.Id = ef.IdFilme
INNER JOIN Atores ato WITH (NOLOCK) ON ef.IdAtor = ato.Id;