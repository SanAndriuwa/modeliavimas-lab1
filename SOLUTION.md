# Sprendimas: RLSE

Skriptas [lab1_main.m](lab1_main.m) sudaro **A=[F,1]** ir sprendžia **A·k≈C**. Kiekvienas stebėjimas naudojamas vieną kartą.

Pradžia: k=[0;0], P=p·I. Kiekvienam stebėjimui su eilute a:

$$K=\frac{Pa^T}{1+aPa^T},\qquad k\leftarrow k+K(C_i-ak),\qquad P\leftarrow P-KaP.$$

Pradinės reikšmės p: 1, 10, 100, 1000, 10000, 100000, 1000000. P yra rekursinio algoritmo matrica, o K yra kiekviename žingsnyje apskaičiuojamas stiprinimo vektorius.

## MATLAB R2026a rezultatai

| p | k1 | k2 |
|---|---|---|
| 1 | 0.37304 | -4.7815 |
| 10 | 0.50281 | -14.112 |
| 100 | 0.55035 | -17.531 |
| 1000 | 0.55641 | -17.967 |
| 10000 | 0.55703 | -18.011 |
| 100000 | 0.55709 | -18.016 |
| 1000000 | 0.55710 | -18.016 |

`pinv(A)*C` duoda maždaug **k1=0.55710, k2=-18.016**. Kai p=10⁶, RLSE ir `pinv()` koeficientų vektorių skirtumo norma yra **4.9899·10⁻⁵**. Stebėjimų aproksimacijos RMSE yra **0.274809 °C**.

Tikrieji koeficientai yra 5/9≈0.55556 ir -160/9≈-17.77778. Stebėjimai suapvalinti, todėl jų mažiausių kvadratų įvertis nėra tiksliai lygus fizikinei formulei.

Baigtinis P0 suteikia pradinio įverčio svorį. Didinant p, rezultatas artėja prie neapriboto mažiausių kvadratų sprendinio. Patikrinant nustatyta, kad visiems p rekursinis rezultatas sutampa su nepriklausomai apskaičiuotu **(AᵀA+I/p)⁻¹AᵀC** iki mažesnės nei 10⁻⁶ normos paklaidos.

Visas skriptas paleistas MATLAB R2026a. Statinis analizatorius pastabų nerado.
