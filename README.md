# Dostupnost základních potravin široké veřejnosti ČR v letech 2006 - 2018
## SQL Projekt - Datová akademie Engeto, Online, 6/2023

### Úvod
Tyto datové podklady slouží k porovnání dostupnosti základních potravin na základě průměrných příjmů za určité časové období. Jsou vypracovány na základě dat z [*Portálu otevřených dat ČR*](https://data.gov.cz) tak, aby odpovídaly na pět výzkumných otázek uvedených níže.

Odpovědi na tyto otázky jsou zpracovány v následujícím textu tohoto dokumentu, který je dále doplněn dvěma tabulkami - a to primární tabulkou pro data mezd a cen potravin za Českou republiku sjednocených pro totožné porovnatelné období, jímž jsou roky 2006 - 2018, a doplňující tabulkou obsahující dodatečná data o ostatních evropských státech ve stejném období, a k nim také pěti SQL skripty s kódem pro získání dat relevantních k  jednotlivým otázkám stanovených k výzkumu.

Tyto datové podklady vznikly jako samostatná práce pro vypracování projektu SQL v rámci absolvování [Datové akademie Engeto](https://engeto.cz/datova-akademie) probíhající online v termínu 20. 6. 2023 - 12. 9. 2023. Celé zadání projektu je k dispozici na konci dokumentu.
<br>

<br>

### Výzkumné otázky

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
   
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
   
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
  
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
<br>

### Výsledky

***1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?***
<br>

**Během měřeného období mzdy průběžně rostou ve všech odvětvích, a to v průměru o 3,9 %.**

Nejvyšší průměrný nárůst mezd v daném období zaznamenaly obory *Zdravotní a sociální péče* (4,9 %), *Zemědelství, lesnictví, rybářství* (4,7 %) a *Zpracovatelský průmysl* (4,7 %), nejnižší nárůst naopak obory *Peněžnictví a pojišťovnictví* (2,1 %), *Ostatní činnosti* (3,0 %) a *Administrativa a podpůrné činnosti* (3,3 %).

K poklesu ve mzdách docházelo v průběhu měřených let jen ojediněle. Nejčastěji se tak dělo v letech 2012/2013, kdy se pokles týkal mírné nadpoloviční většiny kategorií odvětví, u nichž mzdy klesaly průměrně o -0,4 % až o -4,4 %. Jedinou výjimku v tomto období (2012/2013) tvořil obor *Peněžnictví a pojišťovnictví*, kde došlo k výraznému propadu -8,9 %. Tato hodnota zároveň vytváří vůbec nejvyšší meziroční pokles mezd v celém měřeném období napříč všemi odvětvími.

K dalšímu poklesu mezd dále docházelo především v období let 2009 - 2011, propady byly ale velmi mírné, naprostá většina z nich se pohybovala kolem -1 %.

Naopak v některých kategoriích oborů mzdy konstantně rostly po celou dobu měřeného období, jedná se o *Zpracovatelský průmysl*, *Dopravu a skladování*, *Zdravotní a sociální péči* a *Ostatní činnosti*.
<br>

<br>

***2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?***

**V roce 2006 bylo možné koupit si v průměru *1.287,5 kg chleba*, zatímco v roce 2018 to bylo již *1.342,2 kg chleba*.
Co se týče druhé položky, bylo v roce 2006 možné koupit si *1.437,2 l mléka* a v roce 2018 pak 
*1.641,6 l mléka*.**
<br>

<br>

***3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?***

**V průběhu měřeného období nejpomaleji zdražoval cukr krystal, jehož průměrný růst cen dosáhl dokonce záporných hodnot (-1,9 %).** Dále v pořadí jsou pak *rajčata* (-0,7 %), *banány* (0,8 %), *vepřová pečeně s kostí* (1,0 %) a *přírodní minerálka* (1,0 %).
<br>

<br>

***4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?***

**Ne, v žádném roce během měřeného období nebyl meziroční nárůst cen potravin vyšší než 10 %.** Nicméně v roce 2017 cena potravin meziročně vzrostla o 9,6 %, a hranici 10 % se tedy velmi výrazně přiblížila. Meziroční růst mezd v roce 2017 činil 6,3 %.
<br>

<br>

***5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?***

**Podle dat z vybraného období se zdá, že růst/pokles HDP v daném roce se odráží ve zvyšování růstu/poklesu mezd a cen v následujícím roce či následujících letech, neplatí to ale vždy.**

Po zvyšujícícím se růstu HDP v roce 2007 můžeme pozorovat také nárůst cen v letech 2009 - 2011 a nárůst mezd v roce 2008 a pak v letech 2011 - 2012. Podobně pak na růst HDP v období let 2013 - 2015 reaguje trh zvýšením cen v letech 2014 - 2018 (se stagnací v roce 2015) a zvýšením růstu platů v roce 2017. Co se týče poklesu HDP, lze vidět patrnou provázanost v letech 2008 - 2009, kdy klesal růst HDP, snižoval se růst cen a zároveň v letech 2009 - 2010 také růst mezd. Poté klesající HDP v roce 2011 - 2012 mělo patrně vliv také na pokles cen v letech 2013 - 2016 a pokles mezd v roce 2013.

Nestandardní hodnoty se objevují v roce 2009, kdy se vůči okolním letům výrazně propadl růst HDP (-4,7 % oproti 2,7 % v roce 2008 a 2,4 % v roce 2010) i růst cen (-6,4 % oproti 6,2 % v roce 2008 a 2,0 % v roce 2010). Růst mezd klesl v roce 2009 také, ale ne tak významně jako v případě růstu HDP a cen (3,2 % v roce 2009 oproti 7,9 % v roce 2008 a 2,0 % v roce 2010). Další extrémní výkyv pak můžeme vidět v roce 2017, kdy ceny náhle vzrostly na 9,6 % (oproti -1,2 % v roce 2016 a 2,2 % v roce 2018), zatímco hodnoty HDP ani mezd, se nijak mimořádně nevychýlily. V takových případech hrají roli pravděpodobně jiné faktory.
<br>

<br>

### Kompletní zadání k vypracování projektu

**Úvod do projektu**

Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují **dostupnost základních potravin široké veřejnosti**. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu **od vás připravit robustní datové podklady**, ve kterých bude možné vidět **porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období**.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací **dalších evropských států** ve stejném období, jako primární přehled pro ČR.


**Datové sady, které je možné použít pro získání vhodného datového podkladu**

**Primární tabulky:**

czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.
Číselníky sdílených informací o ČR:

czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
czechia_district – Číselník okresů České republiky dle normy LAU.

**Dodatečné tabulky:**

countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.
<br>
<br>
**Výzkumné otázky**

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
<br>

**Výstup projektu**

Pomozte kolegům s daným úkolem. Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Tabulky pojmenujte t_{jmeno}_{prijmeni}_project_SQL_primary_final (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) a t_{jmeno}_{prijmeni}_project_SQL_secondary_final (pro dodatečná data o dalších evropských státech).

Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

Na svém GitHub účtu vytvořte repozitář (může být soukromý), kam uložíte všechny informace k projektu – hlavně SQL skript generující výslednou tabulku, popis mezivýsledků (průvodní listinu) a informace o výstupních datech (například kde chybí hodnoty apod.).

**Neupravujte data v primárních tabulkách! Pokud bude potřeba transformovat hodnoty, dělejte tak až v tabulkách nebo pohledech, které si nově vytváříte.**




