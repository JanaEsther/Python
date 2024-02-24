-- Najdi TOP 100 prodejů podle příjmů a k nim příslušné informace z tabulky Cities.
-- spojení uděláme pomocí celého názvu tabulek
SELECT *
FROM SQL1.Sales
INNER JOIN SQL1.Cities
ON Sales.zip = Cities.zip
WHERE sales.revenue is not null
ORDER BY sales.revenue DESC
FETCH FIRST 100 ROWS ONLY;

select *
FROM SQL1.sales;

-- můžeme použít alias pro tabulky. info: v Oracle není v aliasu u tabulek AS
SELECT c.*, s.*
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON s.zip = c.zip
WHERE s.revenue is not null
ORDER BY s.revenue DESC
FETCH FIRST 100 ROWS ONLY;

-- také můžeme vybrat jen některéí sloupce
SELECT c.zip, c.city, s.calendarid, s.revenue
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON s.zip = c.zip
WHERE s.revenue is not null
ORDER BY s.revenue DESC
FETCH FIRST 100 ROWS ONLY;

-- Jaké jsou tržby přes jednotlivé regiony 
SELECT c.region, sum(s.revenue) as CelkovaTrzba
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON s.zip = c.zip
WHERE s.revenue is not null
GROUP BY c.region
ORDER BY sum(s.revenue) DESC;

-- Najdi 5 nejúspěšnějších měst v počtu prodejů za první kvartál roku 2014. 
SELECT c.city, round(sum(s.revenue),2) as CelkovaTrzba, min(s.calendarid), max(s.calendarid)
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON s.zip = c.zip
WHERE s.calendarid between date'2014-01-01' and date'2014-03-31'
and s.revenue is not null
GROUP BY c.city
ORDER BY sum(s.revenue) DESC
FETCH FIRST 5 ROWS ONLY;

SELECT c.city, round(sum(s.revenue),2) as CelkovaTrzba, min(s.calendarid), max(s.calendarid)
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON s.zip = c.zip
WHERE s.calendarid between date'2014-01-01' and date'2014-03-31'
and s.revenue is not null
GROUP BY c.city
ORDER BY sum(s.revenue) DESC
FETCH FIRST 5 ROWS ONLY;

-- Kolik různorodých produktů se prodalo v každém z měst? Zobraz i města, kde se neprodal žádný výrobek.
SELECT c.city, count(distinct s.productid)
FROM SQL1.Cities c
LEFT JOIN SQL1.Sales s
ON s.zip = c.zip
GROUP BY c.city
ORDER BY c.city;

-- Najdi prodeje pro město se zip 33906 a zjisti o jaké jde mesto
SELECT *
FROM SQL1.Sales s
JOIN SQL1.Cities c
ON c.zip = s.zip
WHERE c.zip = 33906;

SELECT *
FROM SQL1.Sales s
JOIN SQL1.Cities c
ON c.zip = s.zip
AND c.zip = 33906;

SELECT *
FROM SQL1.Sales s
LEFT JOIN SQL1.Cities c
ON c.zip = s.zip
AND c.zip = 33906
ORDER BY c.zip;

-- Kolik různorodých produktů se nikdy neprodalo?
SELECT count(p.productID)
FROM SQL1.products p
LEFT JOIN SQL1.Sales s
ON p.productid = s.productID
WHERE s.productID is null;

/* Samostatná práce */
-- Najděte v jednotlivých kategoriích počty výrobků, které se nikdy nepodařilo prodat.
-- Jaká byla výše příjmů v roce 2015 v rozpadu na měsíce? Zajímají nás všechny měsíce (i ty, kde nenastaly žádné příjmy).

/* Společná práce */
-- Vytvoř tabulku Cities2 jako kopii tabulky Cities
CREATE TABLE Cities2
AS SELECT *
FROM SQL1.Cities;

SELECT *
FROM Cities2;

-- vložení záznamu do tabulky Cities2
insert into Cities2 (Zip, City, State, Region, District, Country)
values (33906,'Klatovy, CZE',null,'Západočeský kraj','Pražská','CZE');

-- Vytvoř tabulku pro prodeje za mesto se zip kódem 33906 (použij tabulku z předchozího příkladu)
CREATE TABLE ProdejeTable AS
SELECT c.*, s.productid, s.calendarid, s.units, s.revenue
FROM Cities2 c
JOIN SQL1.sales s
ON c.zip = s.zip
WHERE c.zip = 33906;

-- Vytvoř tabulku Mesta s touto strukturou
-- Psc : INTEGER
-- Nazev: VARCHAR(100)
-- Kraj: VARCHAR(100)
-- Zeme: VARCHAR(20)
CREATE TABLE Mesta (
  Psc INTEGER
  ,Nazev VARCHAR(100)
  ,Kraj VARCHAR(100)
  ,Zeme VARCHAR(20)
);

-- Vlož do tabulky záznam přímo
INSERT INTO Mesta (Psc, Nazev, Kraj, zeme)
VALUES (33701, 'Rokycany, CZE', 'Západočeský kraj', 'CZE');

select * from mesta;

-- vložení záznamu do tabulky jako select
INSERT INTO Mesta (Psc, Nazev, Kraj, Zeme)
SELECT zip, city, region, country
FROM Cities2
where country = 'CZE';

select *
from Mesta;

/* Samostatná práce */
-- Vytvoř tabulku DistrictRevenueYear jako přehled celkového výdělku po letech pro jednotlivé Districts (spojení 3 tabulek)
-- BONUS: Vytvoř tabulku jednotlivých dnů za třetí kvartál roku 2014, ke každému dni zjisti celkovou tržbu za den, počet prodejů a počet prodaných kusů

/* Společná práce */
-- Vytvoř pohled pro prodeje za mesto se zip kódem 33906
CREATE VIEW ProdejeView AS
SELECT c.*, s.productid, s.calendarid, s.units, s.revenue
FROM Cities2 c
JOIN SQL1.sales s
ON c.zip = s.zip
WHERE c.zip = 33906;

-- Vytvoř tabulku Mesta2 s touto strukturou, IdMesta definuj jako primarni klic a PSC jako jedinečnou hodnotu
-- IdMesta: INTEGER
-- Psc : INTEGER
-- Nazev: VARCHAR(100)
-- Kraj: VARCHAR(100)
-- Zeme: VARCHAR(20)

Create table Mesta2 (
  IdMesta INTEGER PRIMARY KEY
  ,Psc INTEGER NOT NULL
  ,Nazev VARCHAR(100)
  ,Kraj VARCHAR(100)
  ,Zeme VARCHAR(20)
);


-- Vlož do tabulky několik záznamů (ověření chování podmínek)
INSERT INTO Mesta2 (IdMesta, Psc, Nazev, Kraj, zeme)
VALUES (1, 33701, 'Rokycany, CZE', 'Západočeský kraj', 'CZE');

INSERT INTO Mesta2 (IdMesta, Psc, Nazev, Kraj, zeme)
VALUES (2, 33703, 'Rokycany 2, CZE', 'Západočeský kraj', 'CZE');

INSERT INTO Mesta2 (IdMesta, Psc, Nazev, Kraj, zeme)
VALUES (2, 33702, 'Rokycany 3, CZE', 'Západočeský kraj', 'CZE');

INSERT INTO Mesta2 (IdMesta, Nazev, Kraj, zeme)
VALUES (3, 'Rokycany 3, CZE', 'Západočeský kraj', 'CZE');

SELECT *
FROM Mesta2;

-- Vytvoř tabulku NewProdeje s touto strukturou, IdMesta definuj jako cizi klic do tabulky Mesta a ProductID s povinností vyplnění
-- ProductID: INTEGER,
-- Datum: DATETIME,
-- IdMesta: INTEGER,
-- Kusu: Integer,
-- Trzba: NUMERIC (38, 4), 

CREATE TABLE NewProdeje (
  ProductID INTEGER NOT NULL,
  Datum DATE,
  IdMesta INTEGER,
  Kusu Integer DEFAULT 1,
  Trzba NUMERIC (38, 4),
  CONSTRAINT fk_ProdejeMesta
  FOREIGN KEY (IdMesta)
  REFERENCES Mesta2 (IdMesta)
);

-- Vlož do tabulky několik záznamů (ověření chování podmínek)
INSERT INTO NewProdeje (ProductID, Datum, IdMesta, Kusu, Trzba)
VALUES (10,current_date,1,3,3*681.98);

INSERT INTO NewProdeje (ProductID, Datum, IdMesta, Trzba)
VALUES (10,current_date,1,681.98);

INSERT INTO NewProdeje (ProductID, Datum, IdMesta, Kusu, Trzba)
VALUES (15,current_date,2,1,472.45);

INSERT INTO NewProdeje (ProductID, Datum, IdMesta, Kusu, Trzba)
VALUES (20,current_date,3,1,472.45);

select * from NewProdeje;

/* Samostatná práce */
-- Vytvořte tabulku ManufacturerQuarterSales s následující strukturou a omezeními
--	ManufacturerID INTEGER
--	Quarter Varchar(50)
--	PocetKusu INTEGER
--	Trzba NUMERIC (38, 4)
-- Omezení: 
-- ManufacturerID bude definován jako cizí klíč v tabulce manufacturers
-- Quarter musí být vždy vyplněno

-- Do vytvořené tabulky vložte po jednotlivých dodavatelech (manufacturerID) počet prodaných kusů a utržených peněz rozdělené na kvartály (nápověda - spojení 3 nebo 4 tabulek)

-- BONUS: Vytvořte pohled v kterém bude informace o jednotlivých státech a v nich počty jedinečných prodaných výrobků (productid).	

/* Společná práce */
-- priklad na ziskani mesice z datumu
SELECT EXTRACT(month from calendarid), current_date
FROM SQL1.Sales;

-- jaký je ascii kod znaku 'A'
SELECT ASCII('A') FROM dual; 

-- spojeni retezcu
SELECT CONCAT('Ahoj ','Czechitas') FROM dual;

-- Z tabulky Cities vyberte jedinečné záznamy, které vzniknou spojením sloupců Region a State
SELECT distinct CONCAT(CONCAT(Region,' '), STATE) as RegionState
FROM SQL1.Cities;

SELECT distinct Region||' '||STATE as RegionState
FROM SQL1.Cities;

-- delka retezce 'Ahoj Czechitas'
SELECT LENGTH('Ahoj Czechitas') FROM dual;

-- Zjistěte délku nejdelšího názvu města a které to je
SELECT LENGTH(City)
FROM SQL1.Cities
ORDER BY LENGTH(City) DESC
FETCH FIRST 1 ROWS ONLY;

SELECT *
FROM SQL1.Cities
WHERE length(city) = (
SELECT Max(LENGTH(City))
FROM SQL1.Cities);

-- získejte první 4 znaky z řetězce 'Ahoj Czechitas'
SELECT SUBSTR('Ahoj Czechitas',1,4) FROM dual;

-- zjistěte pozici řetězce 'Cze' v řetězci 'Ahoj Czechitas'
SELECT INSTR('Ahoj Czechitas','Cze') FROM dual;

-- Nahraďte Ahoj za Hello v řetězci 'Ahoj Czechitas'
SELECT Replace('Ahoj Czechitas','Ahoj','Hello') FROM dual;

-- Odstranění mezer
SELECT Trim('   Ahoj Czechitas') FROM dual;

-- pomocí regulárního výrazu vybrat jen čísla z 'cislo 120'
SELECT regexp_substr('cislo 120','[0-9]+') FROM dual;

-- pomocí regulárního výrazu vybrat jen pismena z 'cislo 120'
SELECT regexp_substr('cislo 120','[A-Z][a-z]+') FROM dual;

-- globalni promene
SELECT current_date 
    , current_timestamp
    , sysdate
FROM dual;  

-- přidání 3 měsíců k aktualnímu datu
SELECT add_months(current_date,3) from dual;

-- ověření, že funguej správně i při konci měsíce
SELECT add_months(to_date('31.03.2023','DD.MM.YYYY'),1) from dual;

-- jaká bude nejbližší středa
SELECT next_day(current_date,'Středa') from dual;

-- začátek roku pro aktuální datum
SELECT trunc(current_date,'YYYY') from dual;

-- počet měsíců od začátku roku
SELECT round(months_between(current_date,trunc(current_date,'YYYY')),2) from dual;

-- CASE
-- Rozděl tržby do kategorií malá (do 300), střední (300 - 750) a velká (nad 750) a zjisti počty  těchto kategoriích
select CASE WHEN Revenue < 300 THEN 'malá'
            WHEN Revenue > 750 THEN 'velká'
            ELSE 'střední'
       END AS kategorie, count(*) as pocet, min(Revenue), max(Revenue)     
FROM SQL1.Sales
GROUP BY CASE WHEN Revenue < 300 THEN 'malá'
            WHEN Revenue > 750 THEN 'velká'
            ELSE 'střední'
       END;

/* SAMOSTATNÁ PRÁCE */
-- Rozděl produkty podle ceny od 0 do 900 po 300 do kategoií 300(0-300), 600(300-600), 900(600-900), a nad900 a zjisti kolik výrobků je v které kategorii

-- BONUS: Z předchozího příkladu vytvoř pohled ve kterém bude ProductID, výrobce a cenovaHladina

-- BONUS: Spojenim prodeju a vytvořeného pohledu zjisti jak se výrobky v jednotlivých kategoriích prodávaly

