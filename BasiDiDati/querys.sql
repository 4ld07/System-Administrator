USE Ospedale;

SELECT nome, cognome
FROM Dottore
WHERE specializzazione="Cardiologia";

SELECT nome_reparto
FROM Reparto
WHERE piano=2;

SELECT nome, cognome, codice_fiscale
FROM Paziente
WHERE data_nascita BETWEEN '2000-01-01' AND '2000-12-31';

SELECT P.nome, P.cognome, R.data_ricovero
FROM Paziente AS P JOIN Ricovero AS R ON P.id_paziente=R.id_paziente
WHERE R.data_dimissione IS NULL;
