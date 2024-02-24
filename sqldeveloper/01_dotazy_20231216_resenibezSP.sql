/* Samostatná práce 1 */

-- Vytvořte novou tabulku topsales založenou na tabulce sales, která bude obsahovat:
-- ProductID, ZIP a Revenue (datové typy budou stejné jako v tabulce sales)
-- Vložte do ní takové prodeje, kdy Revenue daného prodeje bylo > 15 000.
-- V řádcích pro Los Angeles (zip = 90013) vynásobte navíc 2.
-- Vše z tabulky smažte. 
-- Smažte tabulku topsales.

/* Samostatná práce 1 */

-- Transakce
-- Pro zip 90012 nastavte revenue na hodnotu 2 
-- prověřte chování v rámci připojení do databáze a transakci potvrďte
select *
from topsales
WHERE zip = 90012;

UPDATE topsales
  set revenue = 2
WHERE zip = 90012; 

commit;

-- Pro zip 90012 nastavte revenue na hodnotu 2000 
-- prověřte chování v rámci připojení do databáze a transakci odvolejte
UPDATE topsales
  set revenue = 2000
WHERE zip = 90012; 

rollback;

-- WINDOW FUNKCE

-- Ocislujte radky v tabulce prodeju, pro očíslování použít řazení podle data prodeje
   select row_number() over (order by calendarid), s.*
   from SQL1.SALES s;
   
-- Chceme cislovat podle productID
   select row_number() over (partition by productid order by calendarid) as cislo_radku, s.*
   from SQL1.SALES s
   ORDER BY productid, cislo_radku desc;
   
-- Pomocí agregační funkce ověříme správnost
   SELECT productid, count(*)
   from SQL1.SALES s
   GROUP BY productid
   ORDER BY productid;
   
-- Vypočítáme celkovou tržbu na den, pomocí window funkce
   select s.*,
          sum(revenue) over (partition by calendarid) as trzba_den
   from SQL1.SALES s;
   

-- Přidáme jaký podíl má tržba v našem řádku na celkové tržbě v daném dni
   select s.*,
          sum(revenue) over (partition by calendarid) as trzba_den,
          round((revenue/sum(revenue) over (partition by calendarid))*100,2) as podil
   from SQL1.SALES s;
   
-- Ověříme na 1.1.2013
   select sum(revenue)
   from SQL1.SALES s
   where calendarid = date'2013-01-01';

-- Pro productID a datum spočtěte číslo radku, celkovy počet prodeju
-- počet prodeju daného produktu a prodej produktu v daném dni
select row_number() over (partition by productid, calendarid order by calendarid) radek,
       count(*) over () celkemProdeju,
       count(*) over (partition by productid) produktProdeju,
       count(*) over (partition by productid, calendarid) produktProdejuDen,
       s.*
FROM SQL1.SALES s;

/* Samostatná práce 2 */
-- Vytvořte pořadí prodeje produktu v daném roce.
/* Samostatná práce 2 */

/* Společná práce */
-- zobrazte prodej, predchozi prodej, rozdil dnu a nasledujici prodej
SELECT productID, calendarID, Revenue
       , LAG(calendarID) over (partition by productID order by calendarID) predchoziProdej 
       , LEAD(calendarID) over (partition by productID order by calendarID) nasledujiciProdej
       , calendarID - LAG(calendarID) over (partition by ProductID order by calendarID) rozdilDnu
FROM SQL1.sales
ORDER BY productID, calendarID;

-- pridejte jeste prvni prodej v mesici prodeje
SELECT productID, s.calendarID, Revenue
       , LAG(s.calendarID) over (partition by productID order by s.calendarID) predchoziProdej 
       , LEAD(s.calendarID) over (partition by productID order by s.calendarID) nasledujiciProdej
       , s.calendarID - LAG(s.calendarID) over (partition by ProductID order by s.calendarID) rozdilDnu
       , first_value(s.calendarID) over (partition by ProductID, MonthName order by s.calendarID) prvniProdej
FROM SQL1.sales s
INNER JOIN SQL1.calendar d ON s.calendarID = d.calendarID
ORDER BY productID, s.calendarID;

-- Průměrné tržby za 4 týdny zpětně
SELECT calc.rok, calc.tyden, round(calc.Celkem),
       round(avg(calc.Celkem) over (partition by calc.rok order by tyden rows 3 preceding)) as prumer_4t
FROM (SELECT extract(year from calendarID) as rok, 
       to_char(calendarID,'WW') as tyden, 
       SUM(Revenue) as Celkem
      FROM SQL1.sales
      GROUP BY extract(year from calendarID), 
               to_char(calendarID,'WW')
      ORDER BY extract(year from calendarID), 
               to_char(calendarID,'WW')) calc
ORDER BY rok, tyden;

/* Promenne */
-- Definujte vlastní proměnnou produkt využitím konstanty a zobrazte jako výsledek dotazu
DEFINE produkt = 3;

SELECT &produkt FROM DUAL;

-- Definujte proměnnou využitím existující proměnné current_date a zobrazte jako výsledek dotazu
DEFINE aktualni_datum = current_date;

SELECT &aktualni_datum FROM DUAL;

-- Definujte proměnné datum začátku, datum konce, produkt a psc a využijte je v dotazu z tabulky sales 
DEFINE datum1 = date'2013-06-01';
DEFINE datum2 = &datum1 + INTERVAL '12' MONTH;
DEFINE produkt = 1;
DEFINE psc = 92014;

SELECT * 
FROM SQL1.sales
WHERE 
  calendarID between &datum1 and &datum2
  AND productID = &produkt
  AND zip = &psc;

/* Samostatná práce 3 */  
-- Vyberte náhodně jeden produkt a pomocí proměnných vypište všechny prodeje, které nastaly během 3 měsíců od vámi zvoleného datumu.
/* Samostatná práce 3 */    
  
-- Vytvořte funkci převodu kilogramů na libry 
-- 1Kg = 2.20462 libry

CREATE OR REPLACE FUNCTION TO_POUNDS(KILOS  NUMBER)
RETURN NUMBER
IS
   POUNDS NUMBER;
BEGIN

    POUNDS := KILOS * 2.20462;
    RETURN POUNDS ;
    
END;
/

-- použijte v selectu
SELECT to_pounds(2) FROM dual;
  
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

-- poižití v selectu
SELECT to_czk('USD',20) FROM dual;
SELECT to_czk('EUR',10) FROM dual;
SELECT to_czk('CZK',200) FROM dual;

/* Samostatná práce 4 */
-- Kolik roků uběhlo od prodeje? Vytvořte funkci, která vrátí rozdíl mezi dnešním dnem a dnem prodeje (sales.date) v letech.
-- použití v selectu
/* Samostatná práce 4 */

-- Vytvořte proceduru která bude nastavovat novou cenu na produkctu podle productid

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



