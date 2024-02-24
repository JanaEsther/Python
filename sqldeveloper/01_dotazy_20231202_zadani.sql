SELECT *
FROM SQL1.Sales;

SELECT *
FROM SQL1.Cities;

-- Najdi TOP 100 prodejů podle příjmů a k nim příslušné informace z tabulky Cities.
-- spojení udělejme pomocí celého názvu tabulek
SELECT *
FROM SQL1.Sales
INNER JOIN SQL1.Cities
ON Cities.zip = Sales.zip
WHERE Sales.Revenue is NOT NULL
ORDER BY Sales.Revenue DESC
FETCH FIRST 100 ROWS ONLY;

SELECT c.*, s.*
FROM SQL1.Sales s
JOIN SQL1.Cities c
ON c.Zip = s.Zip
WHERE s.revenue IS NOT null
ORDER BY s.revenue DESC
FETCH FIRST 100 ROWS ONLY;

-- můžeme použít alias pro tabulky. info: v Oracle není v aliasu u tabulek AS

-- takže můžeme vybrat jen některé­ sloupce
SELECT c.city, s.productid, s.revenue
FROM SQL1.Sales s
JOIN SQL1.Cities c
ON c.Zip = s.Zip
WHERE s.revenue IS NOT null
ORDER BY s.revenue DESC
FETCH FIRST 100 ROWS ONLY;

-- Jaké jsou tržby přes jednotlivé regiony 
SELECT c.City, ROUND(SUM(s.revenue),2) as celkovaTrzba,min(s.calendarid), max(s.calendarid)  -- alias sloupce
FROM SQL1.Cities c -- alias tabulky
JOIN SQL1.Sales s
ON c.Zip = s.Zip
WHERE s.calendarid BETWEEN to_date('01.01.2014', 'DD.MM.YYYY') and to_date('31.03.2014', 'DD.MM.YYYY')
GROUP BY c.City
ORDER BY SUM(s.revenue) DESC
FETCH FIRST 5 ROWS ONLY;

-- Najdi 5 nejúspěšnějších měst v počtu prodejů za první kvartál roku 2014. 

SELECT c.city, count(s.productid) as PocetProdeju
FROM SQL1.Cities c
INNER JOIN SQL1.Sales s
ON s.zip = c.zip
WHERE s.calendarid BETWEEN to_date('01.01.2014', 'DD.MM.YYYY') and to_date('31.03.2014', 'DD.MM.YYYY')
GROUP BY c.city
ORDER BY count(s.productid) DESC
FETCH FIRST 5 ROWS ONLY;
-- Kolik různorodých produktů se prodalo v každém z měst? Zobraz i města, kde se neprodal žádný výrobek.
-- levá tabulka vždy před join, pravá je za join
SELECT c.city,c.zip, count(distinct s.productid)
FROM SQL1.Cities c
LEFT JOIN SQL1.Sales s
ON s.zip = c.zip
GROUP BY c.city, c.zip
ORDER BY count(distinct s.productid);

SELECT *
FROM SQL1.Sales
WHERE zip = 26823;
 
-- Najdi prodeje pro město se zip 33906 a zjisti o jaké jde mesto

SELECT *
FROM SQL1.Sales s
LEFT JOIN SQL1.Cities c
ON c.zip = s.zip
WHERE c.zip = 33906
ORDER BY c.zip;


SELECT *
FROM SQL1.Sales s
LEFT JOIN SQL1.Cities c
ON c.zip = s.zip
AND c.zip = 33906
ORDER BY c.zip;



-- Kolik různorodých produktů se nikdy neprodalo?
SELECT *
FROM SQL1.products p
LEFT JOIN SQL1.Sales s
ON s.productid = p.productID
WHERE s.productID is null
ORDER BY s.zip;

SELECT count(*)
FROM SQL1.products p
LEFT JOIN SQL1.Sales s
ON s.productid = p.productID
WHERE s.productID is null;

SELECT count(*)
FROM SQL1.products p
LEFT JOIN SQL1.Sales s
ON s.productid = p.productID
WHERE s.productID is not null;

/* Samostatná práce */
-- Najděte v jednotlivých kategoriích počty výrobků, které se podařilo prodat.
SELECT  category, count(*)
FROM SQL1.Products p
LEFT JOIN SQL1.Sales s
ON p.productid = s.productid
WHERE s.productID is not null
GROUP BY category; 

SELECT  category, count(*)
FROM SQL1.Products p
LEFT JOIN SQL1.Sales s
ON p.productid = s.productid
WHERE s.productID is null
GROUP BY category; 

SELECT category, count(*)
FROM SQL1.Products p
JOIN SQL1.Sales s
ON p.productid = s.productid
GROUP BY category; 

-- Najděte v jednotlivých kategoriích počty výrobků, které se nepodařilo prodat.
SELECT category, count(distinct p.productid)
FROM SQL1.Products p
INNER JOIN SQL1.Sales s
ON s.productid = p.productid
GROUP BY category; 

-- Jaké byla výše příjmů v roce 2015 v rozpadu na měsíce? Zajímají­ nás všechny měsíce (i ty, kde nenastaly žádné příjmy).
SELECT cal.monthname, sum(s.revenue)
FROM SQL1.calendar cal
LEFT JOIN SQL1.sales s
ON s.calendarid = cal.calendarid
Where cal.year = 2015
GROUP BY cal.monthname,cal.monthno
ORDER BY cal.monthno;


/* Společná práce */
-- Vytvoř tabulku Cities2 jako kopii tabulky Cities
CREATE TABLE Cities2 AS
SELECT *
FROM SQL1.Cities;

SELECT * 
FROM Cities2;

-- vložení­ záznamu do tabulky Cities2


INSERT INTO Cities2 (Zip, City, State, Region, District, Country)
VALUES (33906,'Klatovy, CZE',null,'Západočeský˝ kraj','Pražskáˇ','CZE');

SELECT * 
FROM Cities2
WHERE Zip = 33906;
-- Vytvoř tabulku pro prodeje za mesto se zip kódem 33906 (použij tabulku z předchozího příkladu)

CREATE TABLE ProdejeTable AS
SELECT c.*,s.productid, s.calendarid, s.units, s.revenue
FROM SQL1.Sales s
INNER JOIN Cities2 c
ON c.zip = s.zip
WHERE s.zip = 33906;

SELECT*
FROM ProdejeTable;

-- Vytvoř tabulku Mesta s touto strukturou
-- Psc : INTEGER
-- Nazev: VARCHAR(100)
-- Kraj: VARCHAR(100)
-- Zeme: VARCHAR(20)

CREATE TABLE Mesta (
  Psc INTEGER,
  Nazev VARCHAR(100),
  Kraj VARCHAR(100),
  Zeme VARCHAR(20)
);

-- Vlož do tabulky záznam přímo
INSERT INTO Mesta (Psc, Nazev, Kraj, zeme)
VALUES (33701, 'Rokycany, CZE', 'Západočeský˝ kraj', 'CZE');


-- vložení­ záznamu do tabulky jako select
INSERT INTO Mesta (psc, nazev,  kraj, zeme)
SELECT zip, city, region, country
FROM Cities2
WHERE country = 'CZE';

SELECT*
FROM Mesta;

/* Samostatná práce */
-- Vytvoř tabulku DistrictRevenueYear jako přehled celkového výdělku po letech pro jednotlivé Districts (spojení 3 tabulek)
CREATE TABLE DistrictRevenueYear AS
SELECT cal.year, c.district, sum(s.revenue) as Utrata
FROM SQL1.Cities c
JOIN SQL1.sales s ON s.zip = c.zip
JOIN SQL1.Calendar cal ON cal.calendarID = s.calendarID
GROUP BY cal.year, c.district
ORDER BY c.district, cal.year;

SELECT *
FROM DistrictRevenueYear; 


-- BONUS: Vytvoř tabulku jednotlivých dnů za třetí kvartál roku 2014, ke každému dni zjisti celkovou tržbu za den, 
---počet prodejů a počet prodaných kusů

CREATE TABLE 
SELECT cal.day, SUM(s.revenue) as Trzba
FROM SQL1.Sales s
INNER JOIN SQL1.Calendar c
ON s.calendarID = cal.calendar ID
WHERE s.calendarid BETWEEN to_date('01.07.2014', 'DD.MM.YYYY') and to_date('31.10.2014', 'DD.MM.YYYY')
;


/* Společná práce */
-- Vytvoř pohled pro prodeje za mesto se zip kódem 33906
CREATE VIEW ProdejeView AS
SELECT c.*, s.productid, s.calendarid, s.units, s.revenue
FROM Cities2 c
JOIN SQL1.sales s
ON c.zip = s.zip
WHERE c.zip = 33906;

CREATE Table ProdejeTable AS 
SELECT c.*, s.productid, s.calendarid, s.units, s.revenue
FROM SQL1.Sales s
INNER JOIN Cities2 c
ON c.zip = s.zip
WHERE s.zip = 33906;

SELECT *
FROM Cities2
where country = 'CZE';

DELETE FROM Cities2
where country = 'CZE';


-- Vytvoř tabulku Mesta2 s touto strukturou, IdMesta definuj jako primarni klic a PSC jako jedinečnou hodnotu
-- IdMesta: INTEGER
-- Psc : INTEGER
-- Nazev: VARCHAR(100)
-- Kraj: VARCHAR(100)
-- Zeme: VARCHAR(20)

CREATE TABLE Mesta2 (
    IdMesta INTEGER PRIMARY KEY,
    Psc INTEGER UNIQUE,
    Nazev VARCHAR(100),
    Kraj VARCHAR(100),
    Zeme VARCHAR(20)
);

-- Vlož do tabulky několik záznamů (ověření chování podmínek)
INSERT INTO Mesta2 (IdMesta, Psc, Nazev, Kraj, zeme)
VALUES (1, 33701, 'Rokycany, CZE', 'Západočeský kraj', 'CZE');

INSERT INTO Mesta2 (IdMesta, Psc, Nazev, Kraj, zeme)
VALUES (2, 33703, 'Rokycany 2, CZE', 'Západočeský kraj', 'CZE');

SELECT*
FROM Mesta2;

INSERT INTO Mesta2 (IdMesta, Psc, Nazev, Kraj, zeme)
VALUES (2, 33702, 'Rokycany 3, CZE', 'Západočeský kraj', 'CZE');

INSERT INTO Mesta2 (IdMesta, Nazev, Kraj, zeme)
VALUES (3, 'Rokycany 3, CZE', 'Západočeský kraj', 'CZE');

CREATE TABLE Mesta3 (
    IdMesta INTEGER PRIMARY KEY,
    Psc INTEGER UNIQUE NOT NULL,
    Nazev VARCHAR(100),
    Kraj VARCHAR(100),
    Zeme VARCHAR(20)
);


-- Vytvoř tabulku NewProdeje s touto strukturou, IdMesta definuj jako cizi klic do tabulky Mesta a ProductID s povinností­ vyplnění
-- ProductID: INTEGER not null,
-- Datum: DATETIME,
-- IdMesta: INTEGER,
-- Kusu: Integer,
-- Trzba: NUMERIC (38, 4), 
CREATE TABLE NewProdeje (
ProductID: INTEGER [NOT NULL],
Datum: DATETIME,
IdMesta: INTEGER,
PocetKusu: Integer,
Trzba: NUMERIC (38, 4)
);

-- Vlož do tabulky několik záznamů (ověření­ chování podmínek)

/* Samostatná práce */
-- Vytvořte tabulku ManufacturerQuarterSales s následující strukturou a omezeními
--	ManufacturerID INTEGER
--	Quarter Varchar(50)
--	PocetKusu INTEGER
--	Trzba NUMERIC (38, 4)
-- Omezení: 
-- ManufacturerID bude definován jako cizí klíč v tabulce manufacturers
-- Quarter musí být vždy vyplněno

   CREATE TABLE ManufacturerQuarterSales (
   ManufacturerID INTEGER,
   Quarter Varchar(50)[NOT NULL],
   PocetKusu INTEGER,
   Trzba NUMERIC (38, 4)
   );

-- Do vytvořené tabulky vložte po jednotlivých dodavatelech (manufacturerID) 
--počet prodaných kusů a utržených peněz rozdělených na kvartály (nápověda - spojení 3 nebo 4 tabulek)

-- BONUS: Vytvořte pohled v kterém bude informace o jednotlivých státech a v nich počtty jedinečných prodaných výrobků (productid).	

-- priklad na ziskani mesice z datumu

-- jaký je ascii kod znaku 'A'

-- spojeni retezcu

--ÚKOLY FUNKCE:
-- Z tabulky Cities vyberte jedinečné záznamy, které vzniknou spojením sloupců Region a State

 SELECT DISTINCT CONCAT(CONCAT(Region, ' '), State) as RegioState, Region||' '||State as Pokus
FROM SQL1.Cities;
 

-- delka retezce 'Ahoj Czechitas'
SELECT 15*31 FROM dual;


-- Zjistěte délku nejdelšího názvu města a které to je
SELECT length(City)
FROM SQL1.Cities
ORDER BY length(City) DESC
FETCH FIRST 1 ROW ONLY;

SELECT*
FROM SQL1.Cities
WHERE length(City)= (SELECT MAX(length(city)) FROM SQL1.Cities); 

-- získejte první 4 znaky z řetězce 'Ahoj Czechitas'

-- zjistěte pozici řetězce 'Cze' v řetězci 'Ahoj Czechitas'


-- Nahraďte Ahoj za Hello v řetězci 'Ahoj Czechitas'

-- Odstraněni mezer

-- pomocí regulérního výrazu vybrat jen čísla z 'cislo 120'

-- pomocí regulérního výrazu vybrat jen pismena z 'cislo 120'

-- globalni promene

-- přidani­ 3 mesicu k aktualnímu datu

-- ověření, vše funguje správně i při konci měsíce

-- jaká bude nejbližší­ středa

-- začátek roku pro aktuální datum

-- počet měsíců od začátku roku

-- CASE
-- Rozděl tržby do kategorií­ malá (do 300), střední (300 - 750) a velká (nad 750) a zjisti počty  tě›chto kategoriích

    SELECT CASE WHEN Revenue < 300 THEN 'mala'
                WHEN Revenue < 750 THEN 'stredni'
                WHEN Revenue >= 750 THEN 'velka'
                ELSE 'nevim'
        END AS kategorie, s.*
    FROM SQL1.Sales s;
    
    SELECT CASE WHEN Revenue < 300 THEN 'mala'
                WHEN Revenue < 750 THEN 'stredni'
                WHEN Revenue >= 750 THEN 'velka'
                ELSE 'nevim'
        END AS kategorie
        ,COUNT(*) AS pocet
    FROM SQL1.Sales s
    GROUP BY CASE WHEN Revenue < 300 THEN 'mala'
            WHEN Revenue < 750 THEN 'stredni'
            WHEN Revenue >= 750 THEN 'velka'
            ELSE 'nevim'
       END;
                                  

/* SAMOSTATNÁ PRÁCE */
-- Rozděl produkty podle ceny od 0 do 900 po 300 do kategoií 300(0-300), 600(300-600), 900(600-900), a nad 900 a 
--zjisti kolik výrobků je v které kategorii




-- BONUS: Z předchozího příkladu vytvoř pohled ve kterém bude ProductID, výrobce a cenovaHladina

-- BONUS: Spojenim prodeju a vytvořeného pohledu zjisti jak se výrobky v jednotlivých kategoriích prodávaly

INSERT INTO Mesta (Psc, Nazev, Kraj, zeme)
VINSERT INTO Mesta (Psc, Nazev, Kraj, zeme)
VALUES (33701, 'Benešov, CZE', 'Středočeský˝ kraj', 'CZE');INSERT INTO Mesta (Psc, Nazev, Kraj, zeme)
VALUES (33701, 'Rokycany, CZE', 'Západočeský˝ kraj', 'CZE');VALUES (33701, 'Benešov, CZE', 'Středočeský˝ kraj', 'CZE');