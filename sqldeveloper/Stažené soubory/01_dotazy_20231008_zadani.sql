-- (prvni select) Vyber všechny sloupce z tabulky sales
SELECT * 
FROM SQL1.Sales;

-- (sloupce) Vyber sloupce ProductID, Product a Price z tabulky Product
 
SELECT ProductID, Product, Price 
FROM SQL1.products;

-- (alias) Vyber sloupce Date a ProductID z tabulky Sales a prejmenuj je
SELECT CalendarID AS Datum, ProductID AS ProductCislo
FROM SQL1.sales;

-- (distinct) V predchazejicim dotazu vyber pouze jednecne kombinace

SELECT DISTINCT CalendarID, ProductID
FROM SQL1.sales;

/*SELECT DISTINCT TO char(CalendarID,'DD.MM.YYYY') 
AS Datum, ProductID FROM SQL1.Sales; - nastavení formátu datumu*/

-- Jake vsechny kategorie produktu jsou v tabulce Product
SELECT DISTINCT Category 
FROM SQL1.products;

-- SAMOSTATNA PRACE (prvni SQL)
-- Vyber sloupce Zip, City a Country z Tabulky Cities a prejmenuj je na PSC, Mesto a Stat
SELECT Zip AS PSC, City AS Mesto, Country AS Stat 
FROM SQL1.Cities;

-- Vyber jedineèné Regiony z tabulky Cities (aby tam žádný region nebyl dvakrát) a zobraz pouze první záznam.

SELECT DISTINCT Region 
FROM SQL1.cities;

/* WHERE */
-- Vyber všechny produkty s productid 1
/* z Tabulky product mam vzdy jen 1 zaznam, ProductID je zde primarni klic */ 
SELECT * 
FROM SQL1.products
WHERE productid = 1;

/* V tabulce sales je Producid cizi klic, tak se tam muze vyskytovat vicekrat */

SELECT * 
FROM SQL1.Sales
WHERE productid = 1;

-- Vyber všechny produkty s productid menší nebo rovno 5.
SELECT * FROM SQL1.products
WHERE productid <= 5
ORDER BY productid DESC;
-- Vyber všechny produkty s productid 1 nebo 3.

SELECT * 
FROM SQL1.products
WHERE productid = 1 
OR productid = 3;

/* jiny zapis, stejny vysledek */
SELECT * 
FROM SQL1.products
WHERE productid 
IN(1,3);

-- (between, ><) Získej všechny prodeje s tržbou v rozmezí hodnot 
-- 200 a 300
SELECT *
FROM SQL1.sales
WHERE revenue 
BETWEEN 200 AND 300;

SELECT *
FROM SQL1.sales
WHERE revenue >=200 
AND revenue <=300;

-- Získej všechna mìsta obsahující v názvu Bos
SELECT *
FROM SQL1.cities
WHERE City 
LIKE 'Bos%'; 


SELECT country, region, zip
FROM SQL1.Cities
WHERE lower(City) LIKE '%bos%';



/* Kdyz chci Region s presnou delkou nazvu (7) a na druhe pozici znak e */

SELECT Distinct Region
FROM SQL1.cities
WHERE lower(region) LIKE '_e%_____';

SELECT Distinct Region
FROM SQL1.cities
WHERE lower(region) LIKE '_e%'
AND length(Region)= 7;

-- SAMOSTATNA PRACE (WHERE)
-- Vyber všechny sloupce tabulky Sales pro ProductID se rovná 1 a seøaï výsledky sestupnì dle výše Revenue.
SELECT * FROM SQL1.sales 
WHERE productid = 1
ORDER BY revenue DESC;

-- V pøedcházejícím dotazu omez výsledek na pouze 5 øádkù.

SELECT * FROM SQL1.sales
WHERE productid = 1
ORDER BY revenue DESC
FETCH FIRST 5 ROWS ONLY;

-- A vyberte jen obchody za rok 2014.

SELECT * FROM SQL1.sales
WHERE productid = 1
AND to_char(CalendarID,'YYYY')='2014'
ORDER BY revenue DESC
FETCH FIRST 5 ROWS ONLY;

SELECT * 
FROM SQL1.sales
WHERE productid =1
AND calendarID between date '2014-01-01' AND date '2014-12-31'
ORDER BY revenue DESC
FETCH FIRST 10 ROWS ONLY;

SELECT* 
FROM SQL1.sales
WHERE productid = 1
AND calendarid between date '2013-01-01' AND date '2013-12-31'
ORDER BY revenue DESC
FETCH FIRST 10 ROWS ONLY;

/* Spoleèná práce */
-- (spojovani podminek, zavorky) Nejdìte všechny prodeje s tržbou vìtší než 300 a kde prodej se uskuteènil v lednu 2013 nebo lednu 2014
-- nejdøív se vyhodnotí AND a potom OR (ukázka)

SELECT * 
FROM SQL1.sales
WHERE revenue > 300 
AND to_char(calendarid,'YYYYMM')= '201301'
OR to_char(calendarid,'YYYYMM')= '201401'
ORDER BY revenue DESC;

SELECT * 
FROM SQL1.sales
WHERE revenue > 300 
AND(to_char(calendarid,'YYYYMM')= '201301'
OR to_char(calendarid,'YYYYMM')= '201401')
ORDER BY revenue ASC;

/* Když nepoužiji závorky vyhodnotí se nejdøíve AND a až potom OR, výsledek není podle oèekávání a mám prodeje i menší než 300 */
/* pøi kombinaci AND a OR proto musím vždy použít závorky */
-- (<, =) Nejdìte všechny prodeje s tržbou menší než 200 a poèet prodaných kusù (units) je 3

SELECT *
FROM SQL1.Sales
WHERE revenue < 200
AND units = 2;
-- Vyberte všechny produkty v kategoriích Mix a Rural (in a OR)
SELECT * 
FROM SQL1.products
WHERE Category in ( 'Mix','Rural'); 

/* Alternativní zpùsob zápisu */

SELECT * 
FROM SQL1.products
WHERE Category = 'Mix'
OR Category = 'Rural';


/* Nemohu chtít souèasnì splnit dvì podmínky na jednom sloupci */
-- V podmínce nejde použít sloupec = null nebo sloupec != null

-- Vyberte všechny prodeje s nevyplnìnou tržbou
SELECT *
FROM SQL1.sales
WHERE revenue = null;/*špatnì* - chybný výsledek*/

SELECT *
FROM SQL1.sales
WHERE revenue is null;


-- SAMOSTATNA PRACE (WHERE podrobneji)

-- Najdìte všechny výrobce u kterých název obsahuje písmeno "a" na druhé pozici 
SELECT* FROM SQL1.manufacturers
WHERE manufacturer LIKE '_a%';

-- Najdìte všechny výrobce u kterých název obsahuje písmeno "a" na druhé pozici a délka názvu je pøesnì 5 znakù /* Je možné také použít funkci length */

SELECT* FROM SQL1.manufacturers
WHERE manufacturer LIKE '_a___';

SELECT* FROM SQL1.manufacturers
WHERE manufacturer LIKE '_a%'
AND length(manufacturer) = 5;

-- Jaké všechny kategorie produktù máme v datech
SELECT DISTINCT Category
FROM SQL1.products;

/* Spoleèná práce */
-- AGREGAÈNÍ FUNKCE
-- Jaká je celková tržba za rok 2014?

SELECT SUM(revenue) AS CekovaTrzba 
FROM SQL1.sales
WHERE to_char(CalendarID, 'YYYY') = 2014;


-- Na kterém produktu jsme vydìlali nejvíce (na kterém ProductID) a kolik kusù (units) tohoto produktu jsme prodali?

SELECT productid, SUM(revenue) AS Trzba, SUM(units) as PocetKusu,COUNT(units) as PocetProdeju
FROM SQL1.Sales
WHERE to_char(CalendarID, 'YYYY') = '2014'
GROUP BY productid
ORDER BY SUM(REVENUE)DESC;

SELECT productid, SUM(revenue) AS Trzba, COUNT(units) as PocetProdeju
FROM SQL1.Sales
WHERE to_char(CalendarID, 'YYYY') = '2014'
GROUP BY productid
ORDER BY COALESCE( SUM(REVENUE),0)DESC;

-- Poèet prodejù z tabulky sales – funkce count (null v agregaèních funkcích)
SELECT count (*),count (revenue)
FROM SQL1.sales;

SELECT count (*),count (revenue)
FROM SQL1.sales
WHERE revenue is null;

-- Kolik máme produktù (ProductId) v kategorii Rural? Výsledný sloupec pøejmenuj na ‚ProductCount‘.

SELECT Category, COUNT(ProductId) AS ProductCount, COUNT(Product)
FROM SQL1.products
GROUP BY Category;

SELECT Category, COUNT( DISTINCT ProductId) AS ProductCount, COUNT( DISTINCT Product)
FROM SQL1.products
GROUP BY Category;



/* když použiji ProductID (PK) tak výsledek count a count(distinct) je stejný = záznamy v tabulce se neopakují */
/* Pokud to použiji na sloupec Product už dostanu jiné výsledky = opakují se mi stejné hodnoty ve sloupci Product  */

-- HAVING - PODMÍNKA NA AGREGOVANÉM SLOUPCI 
-- Najdi všechny kategorie produktù, které obsahují více než 300 produktù.

SELECT Category, COUNT( DISTINCT ProductId) AS ProductCount, COUNT( DISTINCT Product)
FROM SQL1.products
HAVING COUNT( DISTINCT ProductId)>300
GROUP BY Category;

/*Spoèítat øádky*/

SELECT count(*)FROM (
SELECT productID, product, price
FROM SQL1.products
WHERE Category = 'Mix'
OR Category = 'Rural');

SELECT product, count(*)
FROM SQL1.products
GROUP BY product
HAVING COUNT (*) >1;

SELECT *
FROM SQL1.products
WHERE product = 'Quibus RP-02';


/* CHYBA - v casti WHERE nejde použít agregovanou hodnotu */

-- Uvedený dotaz uprav, tak že budeš zahrnovat jen produkty obsahující v názvu ‘Ab’.
/* Ale jde použít where s kombinací HAVING, ve WHERE máme filtrování podle neagregovaných sloupcù v tabulce v HAVING potom podmínku na agregaci */

SELECT Category, COUNT( DISTINCT ProductId) AS ProductCount, COUNT( DISTINCT Product)
FROM SQL1.Products
WHERE lower(product) like '%ab%' 
GROUP BY Category
HAVING COUNT( DISTINCT ProductId)>300;



-- SAMOSTATNÁ PRÁCE (Agregacni funkce)
-- Èeho jsme prodali nejvíce kusù (ProductID)?
SELECT Productid, sum(units) 
FROM SQL1.sales
GROUP BY Productid
order by sum(units) DESC;


-- Kterých 10 výrobcù má nejvíce jedineèných (rùznorodých) kategorií výrobkù?

SELECT ManufacturerID, COUNT( DISTINCT Category)
FROM SQL1.products  
GROUP BY ManufacturerID
ORDER BY count(DISTINCT Category) DESC
FETCH FIRST 10 ROWS ONLY;


-- JOINY
-- Najdi TOP 100 prodejù podle pøíjmù a k nim pøíslušné informace z tabulky Cities.

SELECT *
FROM SQL1.Sales
INNER JOIN SQL1.Cities
ON CITIES.Zip = SALES.Zip
WHERE revenue IS NOT null
ORDER BY revenue DESC
FETCH FIRST 100 ROWS ONLY;


SELECT *
FROM SQL1.Sales
INNER JOIN SQL1.Cities
ON CITIES.Zip = SALES.Zip
WHERE revenue IS NOT null
ORDER BY revenue DESC
FETCH FIRST 10 ROWS ONLY;

-- (<, =) Nejdìte všechny prodeje s tržbou vìtší  než 400 a poèet prodaných kusù (units) je 3


