-- (prvni select) Vyber v�echny sloupce z tabulky sales
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
-- Vyber jedine�n� Regiony z tabulky Cities (aby tam ��dn� region nebyl dvakr�t) a zobraz pouze prvn� z�znam.

-- SPOLECNA PRACE
/* WHERE */
-- Vyber v�echny produkty s productid 1
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
FROM SQL1.Sales -- ProductID je v tabulce Sales ciz� kl��
WHERE ProductID = 1; 

-- Vyber v�echny produkty s productid men�� nebo rovno 5.
SELECT *
FROM SQL1.products
WHERE ProductID <= 5;

-- Vyber v�echny produkty s productid 1 nebo 3.
SELECT *
FROM SQL1.products
WHERE ProductID = 1
OR ProductID = 3;

/* jiny zapis, stejny vysledek */
SELECT *
FROM SQL1.products
WHERE ProductID in (1,3);

-- (between, ><) Z�skej v�echny prodeje s tr�bou v rozmez� hodnot 
-- 200 a 300
SELECT *
FROM SQL1.sales
WHERE Revenue between 200 and 300;

SELECT *
FROM SQL1.sales
WHERE Revenue >= 200 
AND Revenue <= 300;

-- Z�skej v�echna m�sta obsahuj�c� v n�zvu bos
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
-- Vyber v�echny sloupce tabulky Sales pro ProductID se rovn� 1 a se�a� v�sledky sestupn� dle v��e Revenue.
-- V p�edch�zej�c�m dotazu omez v�sledek na pouze 5 ��dk�.
-- A vyberte jen obchody za rok 2014.

-- SPOLECNA PRACE
-- (spojovani podminek, zavorky) Nejd�te v�echny prodeje s tr�bou v�t�� ne� 300 a kde prodej se uskute�nil v lednu 2013 nebo lednu 2014
-- nejd��v se vyhodnot� AND a potom OR (uk�zka)
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

/* Kdy� nepou�iji z�vorky vyhodnot� se nejd��ve AND a a� potom OR, v�sledek nen� podle o�ek�v�n� a m�m prodeje i men�� ne� 300 */
/* p�i kombinaci AND a OR proto mus�m v�dy pou��t z�vorky */
-- (<, =) Nejd�te v�echny prodeje s tr�bou men�� ne� 200 a po�et prodan�ch kus� (units) je 3
-- Vyberte v�echny produkty v kategori�ch Mix a Rural (in a OR)

SELECT *
FROM SQL1.products
WHERE Category = 'Mix' OR Category = 'Rural';

/* Alternativn� zp�sob z�pisu */
/* Nemohu cht�t sou�asn� splnit dv� podm�nky na jednom sloupci */
SELECT *
FROM SQL1.products
WHERE Category = 'Mix' AND Category = 'Rural';

-- V podm�nce nejde pou��t sloupec = null nebo sloupec != null
-- Vyberte v�echny prodeje s nevypln�nou tr�bou
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
-- Najd�te v�echny v�robce u kter�ch n�zev obsahuje p�smeno "a" na druh� pozici 
-- Najd�te v�echny v�robce u kter�ch n�zev obsahuje p�smeno "a" na druh� pozici a d�lka n�zvu je p�esn� 5 znak� /* Je mo�n� tak� pou��t funkci length */
-- Jak� v�echny kategorie produkt� m�me v datech

-- SPOLECNA PRACE
-- AGREGA�N� FUNKCE
-- Jak� je celkov� tr�ba za rok 2014?
SELECT ROUND(SUM(Revenue), 2) AS Trzbacelkem
FROM SQL1.Sales
WHERE to_char(CalendarID, 'YYYY-MM-DD') like '2014%';

-- Na kter�m produktu jsme vyd�lali nejv�ce (na kter�m ProductID) a kolik kus� (units) tohoto produktu jsme prodali?
SELECT ProductID, ROUND(SUM(Revenue), 2) AS "Trzba celkem",  sum(units) PocetKusu
FROM SQL1.Sales
WHERE to_char(CalendarID, 'YYYY-MM-DD') like '2014%'
GROUP BY ProductID
ORDER BY "Trzba celkem" desc;

-- Po�et prodej� z tabulky sales � funkce count (null v agrega�n�ch funkc�ch)
SELECT count(*), count(Revenue)
FROM SQL1.Sales;

SELECT count(*), count(Revenue)
FROM SQL1.Sales
WHERE Revenue is null;

-- Kolik m�me produkt� (ProductId) v kategorii Rural? V�sledn� sloupec p�ejmenuj na �ProductCount�.
SELECT Category, count(productID) as ProductCount
from SQL1.Products
GROUP BY Category;

SELECT Category, count(productID) as ProductCount
from SQL1.Products
WHERE Category = 'Rural'
GROUP BY Category;


/* kdy� pou�iji ProductID (PK) tak v�sledek count a count(distinct) je stejn� = z�znamy v tabulce se neopakuj� */
/* Pokud to pou�iji na sloupec Product u� dostanu jin� v�sledky = opakuj� se mi stejn� hodnoty ve sloupci Product  */
SELECT Category, count(productID) as ProductCount, 
       count(distinct productID), 
       count(distinct Product)
from SQL1.Products
GROUP BY Category;

-- HAVING
-- Najdi v�echny kategorie produkt�, kter� obsahuj� v�ce ne� 300 produkt�.
SELECT Category, count(productID) as ProductCount
from SQL1.Products
GROUP BY Category;

/* CHYBA - v casti WHERE nejde pou��t agregovanou hodnotu */
SELECT Category, count(productID) as ProductCount
from SQL1.Products
WHERE count(productID) > 300
GROUP BY Category;

SELECT Category, count(productID) as ProductCount
from SQL1.Products
GROUP BY Category
HAVING count(productID) > 300;

-- Uveden� dotaz uprav, tak �e bude� zahrnovat jen produkty obsahuj�c� v n�zvu �Ab�.
/* Ale jde pou��t where s kombinac� HAVING, ve WHERE m�me filtrov�n� podle neagregovan�ch sloupc� v tabulce v HAVING potom podm�nku na agregaci */
SELECT Category, count(productID) as ProductCount
from SQL1.Products
WHERE Product like '%Ab%'
GROUP BY Category
HAVING count(productID) < 100;

-- SAMOSTATN� PR�CE (Agregacni funkce)
-- �eho jsme prodali nejv�ce kus� (ProductID)?
-- Kter�ch 10 v�robc� m� nejv�ce jedine�n�ch (r�znorod�ch) kategori� v�robk�?

-- SPOLECNA PRACE
-- JOINY
-- Najdi TOP 100 prodej� podle p��jm� a k nim p��slu�n� informace z tabulky Cities.
SELECT sales.*, cities.*
FROM SQL1.Sales 
INNER JOIN SQL1.Cities 
ON Sales.zip = cities.zip
ORDER BY sales.Revenue DESC
FETCH FIRST 100 ROW ONLY;

/* mohu pouzit cele nazvy tabulek */
/* nebo se na tabulky odkazuji pomoc� aliasu */
SELECT s.*, c.*
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON S.zip = c.zip;

SELECT s.productid, c.Region, District, s.zip
FROM SQL1.Sales s
INNER JOIN SQL1.Cities c
ON S.zip = c.zip
WHERE s.zip = 77328;


