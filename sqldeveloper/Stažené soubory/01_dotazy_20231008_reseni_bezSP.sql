-- (prvni select) Vyber všechny sloupce z tabulky sales
SELECT * 
from SQL1.Sales;

-- (sloupce) Vyber sloupce ProductID, Product a Price z tabulky Product
SELECT ProductID, Product, Price
FROM SQL1.products;

-- (alias) Vyber sloupce Date a ProductID z tabulky Sales a prejmenuj je
SELECT CalendarID as Datum, ProductID CisloProduktu
FROM SQL1.Sales;

-- (distinct) V predchazejicim dotazu vyber pouze jednecne kombinace
SELECT DISTINCT CalendarID as Datum, ProductID as CisloProduktu
FROM SQL1.Sales; 

-- Jake vsechny kategorie produktu jsou v tabulce Product
SELECT DISTINCT Category
FROM SQL1.products;

-- SAMOSTATNA PRACE (prvni SQL)
-- Vyber sloupce Zip, City a Country z Tabulky Cities a prejmenuj je na PSC, Mesto a Stat
-- Vyber jedineèné Regiony z tabulky Cities (aby tam žádný region nebyl dvakrát) a zobraz pouze první záznam.

-- SPOLECNA PRACE
/* WHERE */
-- Vyber všechny produkty s productid 1
SELECT *
FROM SQL1.products 
WHERE ProductID = 1;

/* z Tabulky product mam vzdy jen 1 zaznam, ProductID je zde primarni klic */ 
/* V tabulce sales je Producid cizi klic, tak se tam muze vyskytovat vicekrat */
SELECT ProductID, 
  CalendarID, 
  /* Zip, 
  Units,*/ 
  Revenue 
FROM SQL1.Sales -- ProductID je v tabulce Sales cizí klíè
WHERE ProductID = 1; 

-- Vyber všechny produkty s productid menší nebo rovno 5.
SELECT *
FROM SQL1.products
WHERE ProductID <= 5;

-- Vyber všechny produkty s productid 1 nebo 3.
SELECT *
FROM SQL1.products
WHERE ProductID = 1
OR ProductID = 3;

/* jiny zapis, stejny vysledek */
SELECT *
FROM SQL1.products
WHERE ProductID in (1,3);

-- (between, ><) Získej všechny prodeje s tržbou v rozmezí hodnot 
-- 200 a 300
SELECT *
FROM SQL1.sales
WHERE Revenue between 200 and 300;

SELECT *
FROM SQL1.sales
WHERE Revenue >= 200 
AND Revenue <= 300;

-- Získej všechna mìsta obsahující v názvu bos
SELECT *
FROM SQL1.Cities
WHERE City like '%Bos%';

SELECT *
FROM SQL1.Cities
WHERE City like '%Bos%';

SELECT *
FROM SQL1.Cities
WHERE City = 'boston, VA, USA';

SELECT *
FROM SQL1.Cities
WHERE lower(City) = 'boston, va, usa';

/* Kdyz chci Region s presnou delkou nazvu (7) a na druhe pozici znak e */
SELECT DISTINCT Region
FROM SQL1.Cities
WHERE Region like '_e%';

SELECT DISTINCT Region
FROM SQL1.Cities
WHERE Region like '_e_____';

SELECT DISTINCT Region
FROM SQL1.Cities
WHERE Region like '_e%'
AND length(Region) = 7;

-- SAMOSTATNA PRACE (WHERE)
-- Vyber všechny sloupce tabulky Sales pro ProductID se rovná 1 a seøaï výsledky sestupnì dle výše Revenue.
-- V pøedcházejícím dotazu omez výsledek na pouze 5 øádkù.
-- A vyberte jen obchody za rok 2014.

-- SPOLECNA PRACE
-- (spojovani podminek, zavorky) Nejdìte všechny prodeje s tržbou vìtší než 300 a kde prodej se uskuteènil v lednu 2013 nebo lednu 2014
-- nejdøív se vyhodnotí AND a potom OR (ukázka)
SELECT *
FROM SQL1.Sales 
WHERE Revenue > 300
AND to_char(CalendarID, 'YYYY-MM-DD') like '2013-01%'
OR to_char(CalendarID, 'YYYY-MM-DD') like '2014-01%'
ORDER BY Revenue;

SELECT *
FROM SQL1.Sales 
WHERE Revenue > 300
AND (to_char(CalendarID, 'YYYY-MM-DD') like '2013-01%'
OR to_char(CalendarID, 'YYYY-MM-DD') like '2014-01%')
ORDER BY Revenue;

-- 5*5+5 = 30
-- 5*(5+5) = 50

/* Když nepoužiji závorky vyhodnotí se nejdøíve AND a až potom OR, výsledek není podle oèekávání a mám prodeje i menší než 300 */
/* pøi kombinaci AND a OR proto musím vždy použít závorky */
-- (<, =) Nejdìte všechny prodeje s tržbou menší než 200 a poèet prodaných kusù (units) je 3
-- Vyberte všechny produkty v kategoriích Mix a Rural (in a OR)

SELECT *
FROM SQL1.products
WHERE Category = 'Mix' OR Category = 'Rural';

/* Alternativní zpùsob zápisu */
/* Nemohu chtít souèasnì splnit dvì podmínky na jednom sloupci */
SELECT *
FROM SQL1.products
WHERE Category = 'Mix' AND Category = 'Rural';

-- V podmínce nejde použít sloupec = null nebo sloupec != null
-- Vyberte všechny prodeje s nevyplnìnou tržbou
SELECT *
FROM SQL1.Sales
WHERE Revenue is null;

/* TOHLE NEJDE */
SELECT *
FROM SQL1.Sales
WHERE Revenue = null;

select *
from SQL1.sales 
where productID = 1835 
or revenue is null;

SELECT *
FROM SQL1.Sales
WHERE Coalesce(Revenue, -1) = -1;

-- SAMOSTATNA PRACE (WHERE podrobneji)
-- Najdìte všechny výrobce u kterých název obsahuje písmeno "a" na druhé pozici 
-- Najdìte všechny výrobce u kterých název obsahuje písmeno "a" na druhé pozici a délka názvu je pøesnì 5 znakù /* Je možné také použít funkci length */
-- Jaké všechny kategorie produktù máme v datech

-- SPOLECNA PRACE
-- AGREGAÈNÍ FUNKCE
-- Jaká je celková tržba za rok 2014?
SELECT ROUND(SUM(Revenue), 2) AS Trzbacelkem
FROM SQL1.Sales
WHERE to_char(CalendarID, 'YYYY-MM-DD') like '2014%';

-- Na kterém produktu jsme vydìlali nejvíce (na kterém ProductID) a kolik kusù (units) tohoto produktu jsme prodali?
SELECT ProductID, ROUND(SUM(Revenue), 2) AS "Trzba celkem",  sum(units) PocetKusu
FROM SQL1.Sales
WHERE to_char(CalendarID, 'YYYY-MM-DD') like '2014%'
GROUP BY ProductID
ORDER BY "Trzba celkem" desc;

-- Poèet prodejù z tabulky sales – funkce count (null v agregaèních funkcích)
SELECT count(*), count(Revenue)
FROM SQL1.Sales;

SELECT count(*), count(Revenue)
FROM SQL1.Sales
WHERE Revenue is null;

-- Kolik máme produktù (ProductId) v kategorii Rural? Výsledný sloupec pøejmenuj na ‚ProductCount‘.
SELECT Category, count(productID) as ProductCount
from SQL1.Products
GROUP BY Category;

SELECT Category, count(productID) as ProductCount
from SQL1.Products
WHERE Category = 'Rural'
GROUP BY Category;


/* když použiji ProductID (PK) tak výsledek count a count(distinct) je stejný = záznamy v tabulce se neopakují */
/* Pokud to použiji na sloupec Product už dostanu jiné výsledky = opakují se mi stejné hodnoty ve sloupci Product  */
SELECT Category, count(productID) as ProductCount, 
       count(distinct productID), 
       count(distinct Product)
from SQL1.Products
GROUP BY Category;

-- HAVING
-- Najdi všechny kategorie produktù, které obsahují více než 300 produktù.
SELECT Category, count(productID) as ProductCount
from SQL1.Products
GROUP BY Category;

/* CHYBA - v casti WHERE nejde použít agregovanou hodnotu */
SELECT Category, count(productID) as ProductCount
from SQL1.Products
WHERE count(productID) > 300
GROUP BY Category;

SELECT Category, count(productID) as ProductCount
from SQL1.Products
GROUP BY Category
HAVING count(productID) > 300;

-- Uvedený dotaz uprav, tak že budeš zahrnovat jen produkty obsahující v názvu ‘Ab’.
/* Ale jde použít where s kombinací HAVING, ve WHERE máme filtrování podle neagregovaných sloupcù v tabulce v HAVING potom podmínku na agregaci */
SELECT Category, count(productID) as ProductCount
from SQL1.Products
WHERE Product like '%Ab%'
GROUP BY Category
HAVING count(productID) < 100;

-- SAMOSTATNÁ PRÁCE (Agregacni funkce)
-- Èeho jsme prodali nejvíce kusù (ProductID)?
-- Kterých 10 výrobcù má nejvíce jedineèných (rùznorodých) kategorií výrobkù?

-- SPOLECNA PRACE
-- JOINY
-- Najdi TOP 100 prodejù podle pøíjmù a k nim pøíslušné informace z tabulky Cities.
SELECT sales.*, cities.*
FROM SQL1.Sales 
INNER JOIN SQL1.Cities 
ON Sales.zip = cities.zip
ORDER BY sales.Revenue DESC
FETCH FIRST 100 ROW ONLY;

/* mohu pouzit cele nazvy tabulek */
/* nebo se na tabulky odkazuji pomocí aliasu */
SELECT s.*, c.*
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON S.zip = c.zip;

SELECT s.productid, c.Region, District, s.zip
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON S.zip = c.zip
WHERE s.zip = 77328;


