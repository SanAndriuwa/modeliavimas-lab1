# Modeliavimas-lab1

## Užduotis: tiesinių lygčių sistemos sprendimas taikant RLSE

Temperatūros priklausomybė:

$$t_C = k_1 t_F + k_2.$$

Raskite koeficientus pagal pateiktus stebėjimo duomenis:

| t_C, °C | 13 | 14 | 17 | 18 | 19 | 15 | 13 | 31 | 32 | 29 | 27 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| t_F, °F | 55 | 58 | 63 | 65 | 66 | 59 | 56 | 87 | 90 | 85 | 81 |

1. Sudarykite MATLAB RLSE algoritmą.
2. Raskite parametrų k1 ir k2 įverčius.
3. Palyginkite juos su rezultatu, gautu naudojant `pinv()`.
4. Nubraižykite parametrų įverčių priklausomybę nuo pradinės stiprinimo matricos reikšmės.

Tikroji priklausomybė: **t_C = (5/9)t_F - 160/9**.

Šaltinis: dėstytojo pateiktas `LTS_RLSE.pdf`. Numeracija atitinka kurso laboratorinių darbų sąrašą.

## Paleidimas

Atidarykite [lab1_main.m](lab1_main.m) MATLAB programoje ir paspauskite **Run**. Duomenys jau įrašyti skripte. Papildomų toolbox nereikia.

Skriptas atspausdina koeficientus, palyginimą su `pinv()` ir braižo konvergencijos, pradinės matricos bei temperatūros priklausomybės grafikus.

Algoritmo paaiškinimas ir patikrinti rezultatai: [SOLUTION.md](SOLUTION.md).
