# Analýza dostupnosti potravin a mezd v ČR a Evropě / Food Prices and Wages Analysis in CR and Europe

## Úvod / Introduction

Tento projekt vznikl na základě potřeby analytického oddělení poskytnout robustní datové podklady pro analýzu dostupnosti základních potravin široké veřejnosti. Cílem je porovnat vývoj cen potravin a průměrných příjmů obyvatel za období 2006-2018 a zjistit, jak se mění reálná kupní síla.

*This project was created to provide analytical department with robust data background for analysis of basic food availability to general public. The goal is to compare development of food prices and average incomes during 2006-2018 period and identify changes in real purchasing power.*

Výstupy projektu budou prezentovány na odborné konferenci zaměřené na životní úroveň občanů.

*Project outputs will be presented at professional conference focused on citizen living standards.*

## Vytvořené datové tabulky / Created Database Tables

### Primární tabulka: `t_emil_grokhotov_project_SQL_primary_final`
- Data o mzdách a cenách potravin v České republice
- Časové období: 2006-2018 (sjednocené roky)
- Obsah: Průměrné hrubé mzdy podle odvětví + ceny potravin
- Zdroj dat: Portál otevřených dat ČR
- Optimalizace: Agregovaná data pro rychlejší analýzu

*Primary table: `t_emil_grokhotov_project_SQL_primary_final`*
- *Wage and food price data for Czech Republic*
- *Time period: 2006-2018 (unified years)*
- *Content: Average gross wages by industry + food prices*
- *Data source: Czech Open Data Portal*
- *Optimization: Aggregated data for faster analysis*

### Sekundární tabulka: `t_emil_grokhotov_project_SQL_secondary_final` 
- Ekonomické ukazatele evropských států
- Hlavní metriky: HDP, GINI koeficient, populace
- Časové období: 2006-2018 (shodné s primární tabulkou)
- Země: Všechny evropské státy s dostupnými daty

*Secondary table: `t_emil_grokhotov_project_SQL_secondary_final`*
- *Economic indicators of European countries*
- *Key metrics: GDP, GINI coefficient, population*
- *Time period: 2006-2018 (matching primary table)*
- *Countries: All European countries with available data*

## Výzkumné otázky a zjištění / Research Questions and Findings

### 1. Rostou mzdy ve všech odvětvích? / Do wages grow in all industries?
**Zjištění:** Analýza mezd odhaluje značné odvětvové rozdíly, přičemž těžební průmysl vykazuje nejvyšší volatilitu a zažívá 4 roky poklesu i přes průměrný růst 3,54 %. Finanční služby utrpěly nejprudší roční pokles o -8,91 %, zatímco zdravotnictví vykázalo pozoruhodnou stabilitu s konzistentním růstem a nulovými roky poklesu. Celkově 85 % odvětví zaznamenalo alespoň jeden rok poklesu mezd, ačkoli většina si udržela pozitivní dlouhodobé trajektorie růstu nad 3 % ročně.

*Wage analysis reveals significant sectoral disparities, with Mining showing the highest volatility experiencing 4 decline years despite a 3.54% average growth. Financial services suffered the sharpest single-year decline at -8.91%, while Healthcare demonstrated remarkable stability with consistent growth and zero decline years. Overall, 85% of industries experienced at least one year of wage contraction, though most maintained positive long-term growth trajectories above 3% annually.*

### 2. Kupní síla pro mléko a chléb / Purchasing power for milk and bread
**Zjištění:**
Chléb 2006: 20 677,04 / 16,12 = 1 282 kg
Chléb 2018: 32 485,09 / 24,24 = 1 340 kg (+58 kg, +4,5 %)
Mléko 2006: 20 677,04 / 14,44 = 1 432 litrů
Mléko 2018: 32 485,09 / 19,82 = 1 639 litrů (+207 litrů, +14,5 %)

Analýza kupní síly ukazuje výrazné zlepšení v oblasti základních potravin mezi lety 2006 a 2018, kdy průměrné mzdy umožňují nákup 1 340 kg chleba ve srovnání s předchozími 1 282 kg, což představuje nárůst o 4,5 %. Ještě výraznější je, že kupní síla mléka se podstatně zvýšila z 1 432 na 1 639 litrů, což odráží zlepšení cenové dostupnosti o 14,5 %. To ukazuje, že růst mezd trvale převyšoval inflaci cen potravin, přičemž mléko se v tomto období stalo relativně dostupnějším než chléb.

*Bread 2006: 20,677.04 / 16.12 = 1,282 kg*
*Bread 2018: 32,485.09 / 24.24 = 1,340 kg (+58 kg, +4.5%)*
*Milk 2006: 20,677.04 / 14.44 = 1,432 liters*
*Milk 2018: 32,485.09 / 19.82 = 1,639 liters (+207 liters, +14.5%)*

*Purchasing power analysis shows significant improvements for basic food items between 2006-2018, with average wages enabling the purchase of 1,340 kg of bread compared to 1,282 kg previously, representing a 4.5% increase. More notably, milk purchasing power grew substantially from 1,432 to 1,639 liters, reflecting a 14.5% improvement in affordability. This demonstrates that wage growth consistently outpaced food price inflation, with milk becoming relatively more affordable than bread over this period.*


### 3. Nejpomaleji zdražující potravina / Slowest increasing food category
**Zjištění:** Analýza cenové stability odhaluje překvapivé trendy, kdy cukr a rajčata vykazují průměrný roční pokles cen o -1,92 %, respektive -0,74 % za 12leté období. Banány vykazují pozoruhodnou cenovou stabilitu s nejnižším nárůstem mezi rostoucími kategoriemi, a to pouhých 0,81 % ročně, zatímco vepřové maso těsně následuje s 0,99 %. Tato zjištění jsou v rozporu s běžným vnímáním inflace, které ukazuje, že několik základních kategorií potravin si udrželo stabilní nebo dokonce klesající ceny navzdory celkovému hospodářskému růstu.

*Price stability analysis reveals surprising trends, with sugar and tomatoes actually showing average annual price decreases of -1.92% and -0.74% respectively over the 12-year period. Bananas demonstrated remarkable price stability with the lowest increase among rising categories at just 0.81% annually, while pork followed closely at 0.99%. These findings contrast with common inflation perceptions, showing several basic food categories maintained stable or even declining prices despite overall economic growth.*

### 4. Meziroční rozdíly v růstu cen a mezd / Yearly differences in price and wage growth
**Zjištění:** Data ukazují, že mzdy v celém období 2007–2018 trvale převyšovaly ceny potravin, přičemž žádný rok nepřekročil hranici 10 %. Nejmenší rozdíl nastal v roce 2013, kdy ceny potravin rostly o 6,59 % rychleji než mzdy, ale stále to nedosáhlo kritické hranice 10 %.

*The data reveals that wages consistently outpaced food prices throughout the entire 2007-2018 period, with no year exceeding the 10% threshold. The closest gap occurred in 2013 when food prices grew 6.59% faster than wages, but this still fell short of the critical 10% margin.*

### 5. Vliv HDP na mzdy a ceny / GDP impact on wages and prices
**Zjištění:** Růst HDP vykazuje jasnou, ale selektivní korelaci s ekonomickými ukazateli, silně ovlivňuje mzdy během období vysokého růstu, jako byly roky 2007 a 2017, kdy oba překročily 5 %, ale vykazuje slabý vztah během let mírného růstu. Ceny potravin překvapivě vykazovaly minimální korelaci s fluktuacemi HDP a zůstaly inflační pouze během dvou specifických let vysokého růstu, zatímco jinak vykazovaly normální vzorce. Období recese v roce 2013 jasně ovlivnilo mzdy negativním růstem, což potvrzuje silnější vliv HDP na trhy práce než spotřebitelské ceny potravin během ekonomických kontrakcí.

*GDP growth shows a clear but selective correlation with economic indicators, strongly influencing wages during high-growth periods like 2007 and 2017 when both exceeded 5%, yet showing weak relationships during moderate growth years. Surprisingly, food prices demonstrated minimal correlation with GDP fluctuations, remaining inflationary only during two specific high-growth years while showing normal patterns otherwise. The 2013 recession period clearly impacted wages with negative growth, confirming GDP's stronger influence on labor markets than consumer food pricing during economic contractions.*

## Struktura projektu / Project Structure

 create_tables.sql             # Vytvoření primární a sekundární tabulky / Main table and secondary table generation.
 q1_wage_trends.sql            # Analýza vývoje mezd v odvětvích / Wage trends analysis.
 q2_purchasing_power.sql       # Kupní síla pro mléko a chléb / Purchasing power analysis.
 q3_slowest_food_growth.sql    # Nejpomaleji zdražující potraviny / Slowest-growing food categories.
 q4_price_wage_gap.sql         # Rozdíly v růstu cen a mezd / Gap in wages and price.
 q5_gdp_impact.sql             # Vliv HDP na mzdy a ceny / GDP impact on wages and price.
 README.md                     # Dokumentace projektu / Project documentation.
 data_quality_notes.md         # Informace o kvalitě dat / Data quality information.

## Použité datové sady / Used Datasets

Data pocházejí z Portálu otevřených dat ČR a mezinárodních ekonomických databází.

*Data comes from Czech Open Data Portal and international economic databases.*

---

*Projekt připraven pro tiskové oddělení a prezentaci na odborné konferenci.*  
*Project prepared for press department and presentation at professional conference.*