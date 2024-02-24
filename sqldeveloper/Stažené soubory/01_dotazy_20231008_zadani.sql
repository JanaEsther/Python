-- (prvni select) Vyber v�echny sloupce z tabulky sales
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
AS Datum, ProductID FROM SQL1.Sales; - nastaven� form�tu datumu*/

-- Jake vsechny kategorie produktu jsou v tabulce Product
SELECT DISTINCT Category 
FROM SQL1.products;

-- SAMOSTATNA PRACE (prvni SQL)
-- Vyber sloupce Zip, City a Country z Tabulky Cities a prejmenuj je na PSC, Mesto a Stat
SELECT Zip AS PSC, City AS Mesto, Country AS Stat 
FROM SQL1.Cities;

-- Vyber jedine�n� Regiony z tabulky Cities (aby tam ��dn� region nebyl dvakr�t) a zobraz pouze prvn� z�znam.

SELECT DISTINCT Region 
FROM SQL1.cities;

/* WHERE */
-- Vyber v�echny produkty s productid 1
/* z Tabulky product mam vzdy jen 1 zaznam, ProductID je zde primarni klic */ 
SELECT * 
FROM SQL1.products
WHERE productid = 1;

/* V tabulce sales je Producid cizi klic, tak se tam muze vyskytovat vicekrat */

SELECT * 
FROM SQL1.Sales
WHERE productid = 1;

-- Vyber v�echny produkty s productid men�� nebo rovno 5.
SELECT * FROM SQL1.products
WHERE productid <= 5
ORDER BY productid DESC;
-- Vyber v�echny produkty s productid 1 nebo 3.

SELECT * 
FROM SQL1.products
WHERE productid = 1 
OR productid = 3;

/* jiny zapis, stejny vysledek */
SELECT * 
FROM SQL1.products
WHERE productid 
IN(1,3);

-- (between, ><) Z�skej v�echny prodeje s tr�bou v rozmez� hodnot 
-- 200 a 300
SELECT *
FROM SQL1.sales
WHERE revenue 
BETWEEN 200 AND 300;

SELECT *
FROM SQL1.sales
WHERE revenue >=200 
AND revenue <=300;

-- Z�skej v�echna m�sta obsahuj�c� v n�zvu Bos
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
-- Vyber v�echny sloupce tabulky Sales pro ProductID se rovn� 1 a se�a� v�sledky sestupn� dle v��e Revenue.
SELECT * FROM SQL1.sales 
WHERE productid = 1
ORDER BY revenue DESC;

-- V p�edch�zej�c�m dotazu omez v�sledek na pouze 5 ��dk�.

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

/* Spole�n� pr�ce */
-- (spojovani podminek, zavorky) Nejd�te v�echny prodeje s tr�bou v�t�� ne� 300 a kde prodej se uskute�nil v lednu 2013 nebo lednu 2014
-- nejd��v se vyhodnot� AND a potom OR (uk�zka)

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

/* Kdy� nepou�iji z�vorky vyhodnot� se nejd��ve AND a a� potom OR, v�sledek nen� podle o�ek�v�n� a m�m prodeje i men�� ne� 300 */
/* p�i kombinaci AND a OR proto mus�m v�dy pou��t z�vorky */
-- (<, =) Nejd�te v�echny prodeje s tr�bou men�� ne� 200 a po�et prodan�ch kus� (units) je 3

SELECT *
FROM SQL1.Sales
WHERE revenue < 200
AND units = 2;
-- Vyberte v�echny produkty v kategori�ch Mix a Rural (in a OR)
SELECT * 
FROM SQL1.products
WHERE Category in ( 'Mix','Rural'); 

/* Alternativn� zp�sob z�pisu */

SELECT * 
FROM SQL1.products
WHERE Category = 'Mix'
OR Category = 'Rural';


/* Nemohu cht�t sou�asn� splnit dv� podm�nky na jednom sloupci */
-- V podm�nce nejde pou��t sloupec = null nebo sloupec != null

-- Vyberte v�echny prodeje s nevypln�nou tr�bou
SELECT *
FROM SQL1.sales
WHERE revenue = null;/*�patn�* - chybn� v�sledek*/

SELECT *
FROM SQL1.sales
WHERE revenue is null;


-- SAMOSTATNA PRACE (WHERE podrobneji)

-- Najd�te v�echny v�robce u kter�ch n�zev obsahuje p�smeno "a" na druh� pozici 
SELECT* FROM SQL1.manufacturers
WHERE manufacturer LIKE '_a%';

-- Najd�te v�echny v�robce u kter�ch n�zev obsahuje p�smeno "a" na druh� pozici a d�lka n�zvu je p�esn� 5 znak� /* Je mo�n� tak� pou��t funkci length */

SELECT* FROM SQL1.manufacturers
WHERE manufacturer LIKE '_a___';

SELECT* FROM SQL1.manufacturers
WHERE manufacturer LIKE '_a%'
AND length(manufacturer) = 5;

-- Jak� v�echny kategorie produkt� m�me v datech
SELECT DISTINCT Category
FROM SQL1.products;

/* Spole�n� pr�ce */
-- AGREGA�N� FUNKCE
-- Jak� je celkov� tr�ba za rok 2014?

SELECT SUM(revenue) AS CekovaTrzba 
FROM SQL1.sales
WHERE to_char(CalendarID, 'YYYY') = 2014;


-- Na kter�m produktu jsme vyd�lali nejv�ce (na kter�m ProductID) a kolik kus� (units) tohoto produktu jsme prodali?

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

-- Po�et prodej� z tabulky sales � funkce count (null v agrega�n�ch funkc�ch)
SELECT count (*),count (revenue)
FROM SQL1.sales;

SELECT count (*),count (revenue)
FROM SQL1.sales
WHERE revenue is null;

-- Kolik m�me produkt� (ProductId) v kategorii Rural? V�sledn� sloupec p�ejmenuj na �ProductCount�.

SELECT Category, COUNT(ProductId) AS ProductCount, COUNT(Product)
FROM SQL1.products
GROUP BY Category;

SELECT Category, COUNT( DISTINCT ProductId) AS ProductCount, COUNT( DISTINCT Product)
FROM SQL1.products
GROUP BY Category;



/* kdy� pou�iji ProductID (PK) tak v�sledek count a count(distinct) je stejn� = z�znamy v tabulce se neopakuj� */
/* Pokud to pou�iji na sloupec Product u� dostanu jin� v�sledky = opakuj� se mi stejn� hodnoty ve sloupci Product  */

-- HAVING - PODM�NKA NA AGREGOVAN�M SLOUPCI 
-- Najdi v�echny kategorie produkt�, kter� obsahuj� v�ce ne� 300 produkt�.

SELECT Category, COUNT( DISTINCT ProductId) AS ProductCount, COUNT( DISTINCT Product)
FROM SQL1.products
HAVING COUNT( DISTINCT ProductId)>300
GROUP BY Category;

/*Spo��tat ��dky*/

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


/* CHYBA - v casti WHERE nejde pou��t agregovanou hodnotu */

-- Uveden� dotaz uprav, tak �e bude� zahrnovat jen produkty obsahuj�c� v n�zvu �Ab�.
/* Ale jde pou��t where s kombinac� HAVING, ve WHERE m�me filtrov�n� podle neagregovan�ch sloupc� v tabulce v HAVING potom podm�nku na agregaci */

SELECT Category, COUNT( DISTINCT ProductId) AS ProductCount, COUNT( DISTINCT Product)
FROM SQL1.Products
WHERE lower(product) like '%ab%' 
GROUP BY Category
HAVING COUNT( DISTINCT ProductId)>300;



-- SAMOSTATN� PR�CE (Agregacni funkce)
-- �eho jsme prodali nejv�ce kus� (ProductID)?
SELECT Productid, sum(units) 
FROM SQL1.sales
GROUP BY Productid
order by sum(units) DESC;


-- Kter�ch 10 v�robc� m� nejv�ce jedine�n�ch (r�znorod�ch) kategori� v�robk�?

SELECT ManufacturerID, COUNT( DISTINCT Category)
FROM SQL1.products  
GROUP BY ManufacturerID
ORDER BY count(DISTINCT Category) DESC
FETCH FIRST 10 ROWS ONLY;


-- JOINY
-- Najdi TOP 100 prodej� podle p��jm� a k nim p��slu�n� informace z tabulky Cities.

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

-- (<, =) Nejd�te v�echny prodeje s tr�bou v�t��  ne� 400 a po�et prodan�ch kus� (units) je 3


