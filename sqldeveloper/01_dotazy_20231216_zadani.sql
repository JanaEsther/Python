/* Samostatná práce 1 */

-- Vytvořte novou tabulku topsales založenou na tabulce sales, která bude obsahovat:
-- ProductID, ZIP a Revenue (datové typy budou stejné jako v tabulce sales)
-- Vložte do ní takové prodeje, kdy Revenue daného prodeje bylo > 15 000.




CREATE TABLE topsales
AS SELECT ProductID, ZIP, Revenue 
FROM sql1.sales;

CREATE TABLE topsales
(ProductID INTEGER,
 ZIP INTEGER,
 Revenue FLOAT);

INSERT INTO topsales(productID, ZIP, Revenue)
SELECT productID, ZIP, Revenue
FROM SQL1.Sales
WHERE revenue > 15000;

DELETE FROM topsales 
where Revenue < 15000;

-- V řádcích pro Los Angeles (zip = 90013) vynásobte navíc 2.
UPDATE topsales
  set revenue = 2* revenue
WHERE zip = 90013; 

SELECT*
FROM topsales
WHERE zip = 90013;

DELETE FROM topsales 
where Revenue is Null;

-- Vše z tabulky smažte. 
DELETE FROM topsales;

DROP TABLE topsales;

  CREATE TABLE topsales AS
  SELECT *
  FROM SQL1.Sales
  WHERE revenue > 15000
  AND revenue is not null;
  
  SELECT *FROM topsales
  ORDER BY CALENDARID DESC;

  --SELECT * 
  ---FROM topsales;
  
  -- Smažte tabulku topsales.
  
  DROP TABLE TOPSALES

--DROP TABLE topsales
---DELETE FROM tabulka WHERE podmínky
--INSERT INTO tabulka(sloupec1, sloupec2)
---Values (hodnota1, hodnota2)
---Update tabulka
---SET sloupec1 = hodnota1, sloupec 2= hodnota 2
---WHERE PODMÍNKA
-- Vložte do ní takové prodeje, kdy Revenue daného prodeje bylo > 15 000.
-- V řádcích pro Los Angeles (zip = 90013) vynásobte navíc 2.
-- Vše z tabulky smažte. 
-- Smažte tabulku topsales.
 DROP TABLE TOPSALES

/* Samostatná práce 1 */


-- Transakce

SELECT *
FROM jmacourek.topsales;
-- Pro zip 90012 nastavte revenue na hodnotu 2 

UPDATE topsales
SET REVENUE = 2
WHERE zip = 90012;

SELECT *
FROM jmacourek.topsales
WHERE zip = 90012;

COMMIT;

SELECT *
FROM topsales
WHERE zip = 90012;


-- prověřte chování v rámci připojení do databáze a transakci potvrďte
-- Pro zip 90012 nastavte revenue na hodnotu 2000 
UPDATE topsales
SET REVENUE = 2000
WHERE zip = 90012;

ROLLBACK;
-- V MYSQL : BEGIN TRANSACTION;POKUD TO neudělám tak je autocomit, nedokážu se vrátit 
-- prověřte chování v rámci připojení do databáze a transakci odvolejte
---nastavení práv pro jiného uživatele
--GRANT SELECT ON topsales TO JMACOUREK;

SELECT*
FROM V$TRANSACTION;

-- WINDOW FUNKCE
-- Ocislujte radky v tabulce prodeju, pro očíslování použít řazení podle data prodeje   
SELECT ROW_NUMBER() OVER (ORDER BY calendarID)
        ,s.*
FROM SQL1.sales s;
-- Chceme cislovat podle productID 
SELECT ROW_NUMBER() OVER (PARTITION BY productID ORDER BY calendarID) cisloRadku
        ,s.*
FROM SQL1.sales s
ORDER BY productID, cisloRadku DESC;

SELECT ROW_NUMBER() OVER (PARTITION BY productID ORDER BY calendarID) cisloRadku,
     COUNT(*) OVER (PARTITION BY productid) pocetHodnot
    ,s.*
FROM SQL1.sales s
ORDER BY productID, cisloRadku DESC;

-- Pomocí agregační funkce ověříme správnost
SELECT COUNT (*), productID
FROM SQL1.Sales
GROUP BY productID
ORDER BY productID;

-- Vypočítáme celkovou tržbu na den, pomocí window funkce
SELECT s.*, SUM(revenue) OVER (partition by calendarid) as trzba_den
FROM SQL1.Sales s;

SELECT s.*, SUM(revenue) OVER (partition by calendarid) as trzba_den
FROM SQL1.Sales s
WHERE calendarid = date'2013-01-02'; 

SELECT s.*, SUM(revenue) OVER (partition by calendarid, productid) as trzba_den
FROM SQL1.Sales s
WHERE calendarid = date'2013-01-02'; 

-- Přidáme jaký podíl má tržba v našem řádku na celkové tržbě v daném dni
SELECT s.*, SUM(revenue) OVER (partition by calendarid) as trzba_den,
   round((revenue/SUM(revenue) OVER (partition by calendarid)) *100, 2) as podil
FROM SQL1.Sales s;


-- Ověříme na 1.1.2013
SELECT SUM (revenue)
FROM SQL1.Sales
WHERE calendarid = date'2013-01-01';

-- Pro productID a datum spočtěte číslo radku, celkovy počet prodeju
-- počet prodeju daného produktu a prodej produktu v daném dni
SELECT s.*,
    ROW_NUMBER() OVER (partition by productID, calendarID ORDER BY calendarid) cisloRadku,
    COUNT(*) OVER ()celkemProdeju
FROM SQL1.Sales s;

SELECT s.*,
    ROW_NUMBER() OVER (partition by productID, calendarID ORDER BY calendarid) cisloRadku,
    COUNT(*) OVER ()celkemProdeju,
    COUNT(*) OVER (partition by productid)prodejuProdukt
FROM SQL1.Sales s;

SELECT s.*,
    ROW_NUMBER() OVER (partition by productID, calendarID ORDER BY calendarid) cisloRadku,
    COUNT(*) OVER ()celkemProdeju,
    COUNT(*) OVER (partition by productid)prodejuProdukt,
    COUNT(*) OVER (partition by productid, calendarid) as prodejuProduktuDen
FROM SQL1.Sales s;


/* Samostatná práce 2 */
-- Vytvořte pořadí prodeje produktu v daném roce.

SELECT s.productid, s.calendarid, c.year,
    ROW_NUMBER() OVER (partition by s.productID, c.year ORDER BY s.calendarid)cisloRadku
FROM SQL1.Sales s
INNER JOIN SQL1.Calendar c
ON s.CalendarID = c.CalendarID;

SELECT s.productid, s.calendarid, c.year,
    ROW_NUMBER() OVER (partition by s.productID, c.year ORDER BY s.calendarid)cisloRadku,
    rank() OVER (partition by s.productID, c.year ORDER BY s.calendarid)as Poradi
FROM SQL1.Sales s
INNER JOIN SQL1.Calendar c
ON s.CalendarID = c.CalendarID;

SELECT *
FROM SQL1.Sales s
INNER JOIN SQL1.Calendar c
ON s.CalendarID = c.CalendarID;

SELECT productid, calendarid, EXTRACT(YEAR FROM calendarid) AS rok,
ROW_NUMBER() OVER (PARTITION BY productid, EXTRACT(YEAR FROM calendarid) ORDER BY calendarid) AS rownumber
    ,RANK() OVER (PARTITION BY productid, EXTRACT(YEAR FROM calendarid) ORDER BY calendarid) AS ranknumber
    FROM sql1.sales;

/* Samostatná práce 2 */

/* Společná práce */
-- zobrazte prodej, predchozi prodej, rozdil dnu a nasledujici prodej
SELECT s.*,
    LAG(calendarid) OVER (partition by productID ORDER BY calendarid) predchoziProdej
FROM SQL1.Sales s
ORDER BY productid, calendarid;


SELECT s.*,
    LAG(calendarid) OVER (partition by productID ORDER BY calendarid) predchoziProdej,
    LEAD(calendarid) OVER (partition by productID ORDER BY calendarid) nasledujiciProdej
FROM SQL1.Sales s
ORDER BY productid, calendarid;

SELECT s.*,
    LAG(calendarid) OVER (partition by productID ORDER BY calendarid) predchoziProdej,
    LEAD(calendarid) OVER (partition by productID ORDER BY calendarid) nasledujiciProdej,
    calendarID - LAG(calendarid) OVER (partition by productID ORDER BY calendarid) rozdilDnu
FROM SQL1.Sales s
ORDER BY productid, calendarid;



-- pridejte jeste prvni prodej v mesici prodeje

SELECT s.*,
    LAG(s.calendarid) OVER (partition by productID ORDER BY s.calendarid) predchoziProdej,
    LEAD(s.calendarid) OVER (partition by productID ORDER BY s.calendarid) nasledujiciProdej,
    s.calendarid - LAG(s.calendarid) OVER (partition by productID ORDER BY s.calendarid) rozdilDnu,
    first_value(s.calendarid) over (partition by productID, MonthName order by  s.calendarid)
FROM SQL1.Sales s
INNER  JOIN SQL1.Calendar c ON c.calendarID = s.calendarID
ORDER BY productid, s.calendarid;

-- Průměrné tržby za 4 týdny zpětně

SELECT calc.rok, calc.tyden, calc.Celkem,
       avg(calc.Celkem) over (partition by calc.rok order by calc.tyden rows 3 preceding) prumer_4t
FROM (SELECT extract(year from calendarID) as rok,
        to_char(calendarID, 'WW') as tyden,
        SUM(Revenue) as Celkem
FROM SQL1.sales group by extract(year from calendarID), to_char(calendarID, 'WW')
GROUP BY extract(year from calendarID),
        to_char(calendarID, 'WW')
ORDER BY extract(year from calendarID),
        to_char(calendarID, 'WW')) calc;


/* Promenne */
-- Definujte vlastní proměnnou produkt využitím konstanty a zobrazte jako výsledek dotazu

DEFINE product = 3;

SELECT &product FROM dual;

DEFINE promenna = hodnota;

SELECT& PROMENNA FROM DUAL;

-- Definujte proměnnou využitím existující proměnné current_date a zobrazte jako výsledek dotazu
DEFINE product = 3;

SELECT &product FROM dual;

-- Definujte proměnnou využitím existující proměnné current_date a zobrazte jako výsledek dotazu

DEFINE aktualni_datum = current_date;

SELECT &aktualni_datum from dual;

SELECT &aktualni_datum, &produkt from dual;

-- Definujte proměnné datum začátku, datum konce, produkt a psc a využijte je v dotazu z tabulky sales 

DEFINE datum1 = date'2013-06-01';
DEFINE datum2 = &datum1 + INTERVAL '12' MONTH;
DEFINE produkt = 1; 
DEFINE psc = 92014;

SELECT *
FROM SQL1.sales
WHERE calendarID between &datum1 AND &datum2
AND produktID = &produkt
AND zip = &psc;


/* Samostatná práce 3 */  
-- Vyberte náhodně jeden produkt a pomocí proměnných vypište všechny prodeje, které nastaly během 3 měsíců od vámi zvoleného datumu.
DEFINE datum1 = date'2013-09-01';
DEFINE datum2 = &datum1 + INTERVAL '3' MONTH;
DEFINE produkt = 3; 

SELECT &produkt FROM dual;

SELECT*
FROM SQL1.Sales
WHERE calendarID between &datum1 AND &datum2
AND productID = &produkt;




/* Samostatná práce 3 */    
  
-- Vytvořte funkci převodu kilogramů na libry 
-- 1Kg = 2.20462 libry

CREATE OR REPLACE FUNCTION to_pounds (kilos NUMBER) 
RETURN NUMBER
IS
    POUNDS NUMBER;
BEGIN
    POUNDS := KILOS * 2.20462;
    RETURN POUNDS;
    
END;
/

SELECT to_pounds(60) as libry FROM DUAL;

-- použijte v selectu 

---begin
---promenna : = parametr1 + parametr2

--CREATE OR REPLACE FUNCTION NÁZEV_FUNKCE( PARAMETR 1 DATATYPE, PARAMETR 2 DATATYPE)
--RETURN - NÁVRATOVÝ-DATOVÝ TYP  -TEXT, ČÍSLO, BOLEAN,

--END
--IS
---BEGIN


-- vytvořte funkci na převod měn

CREATE OR REPLACE FUNCTION TO_CZK (CURRENCY varchar2, VALUE NUMBER)
RETURN NUMBER
IS
   AMOUNT NUMBER;
BEGIN
    IF (CURRENCY = 'USD') THEN AMOUNT := VALUE * 23.18;
    ELSE IF (CURRENCY = 'EUR') THEN AMOUNT := VALUE * 24.63;
         ELSE AMOUNT := null;
         END IF;
    END IF;
    RETURN AMOUNT;
END;
/ 




SELECT TO_CZK ('USD', 20) FROM DUAL;
SELECT TO_CZK ('EUR', 1000) FROM DUAL;

-- použití v selectu

SELECT s.*, to_czk('USD', Revenue) as revenue_CZK
FROM SQL1.Sales s;

/* Samostatná práce 4 */

-- Kolik roků uběhlo od prodeje? Vytvořte funkci, která vrátí rozdíl mezi dnešním dnem a dnem prodeje (sales.date) v letech.

CREATE OR REPLACE FUNCTION YEARS_FROM_SALE ( datum date)
RETURN NUMBER

IS 
    aktualni_rok  number;
    rok number;
    rozdil number;
    
BEGIN 
    rok:= extract (year from datum);
    aktualni_rok := extract (year from current_date);
    rozdil := aktualni_rok - rok;
    
RETURN rozdil;

END;
/

SELECT calendarid, productid, years_from_sale(calendarid)
FROM SQL1.Sales;

SELECT calendarid, productid, years_from_sale(calendarid)
FROM SQL1.Sales
WHERE calendarid >date '2015-01-01';

SELECT years_from_sale(date'2020-09-23) from dual;

-- použití v selectu
---/* Samostatná práce 4 */

CREATE OR REPLACE FUNCTION year_since_date (date1 date)
RETURN int
IS
    date2 DATE;
    rok1 NUMBER(5);
    rok2 NUMBER(5);
    rozdil NUMBER(5);
BEGIN
    date2 := current_date;
    SELECT extract(year from date2) into rok2 from dual;
    rok1 := extract(year from date1);
    rozdil := rok2 - rok1;
    RETURN rozdil;
END;
/


-- Vytvořte proceduru která bude nastavovat novou cenu na produktu podle productid

CREATE OR REPLACE PROCEDURE UpdateProductPrice(
    p_product_id IN NUMBER,
    p_new_price IN NUMBER
)
IS
BEGIN
    UPDATE SQL1.products
    SET priceNew = p_new_price
    WHERE productid = p_product_id;
    
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/


SELECT * FROM SQL1.products WHERE productid = 1;
CALL UpdateProductPrice(1, 100);

SELECT * FROM SQL1.products WHERE productid = 3;
CALL UpdateProductPrice(3, 50000);
CALL UpdateProductPrice(3, 150000);

