# Übungsblätter

- [Blatt 2](./blatt2.pdf)
- [Blatt 3](./blatt3.pdf)
  - [Grenzwerte](./analysis.pdf)
- [Blatt 4](./blatt4.pdf)
- [Blatt 5](./blatt5.pdf)
- [Blatt 6](./blatt6.pdf)
- [Blatt 7](./blatt7.pdf)
  - [Blatt 7 4a mit Haskell](./enumparens.hs)
- [Blatt 8](./blatt8.pdf)
- [Blatt 10](./blatt10.pdf)
- [Blatt 11](./blatt11.pdf)
- [Blatt 13](./blatt13.pdf)
  - @Aufagbe 10 aus [Klausur G aus SS 2018](http://cl-informatik.uibk.ac.at/teaching/ss18/dm/exam/versionG.pdf) (Zugriff über Uni Netzwerk/VPN) 
  Antwortmöglichkeit `B` ist falsch (also nicht allgemeingültig), weil sich ein Gegenbeispiel finden lässt. Die Menge `M` sei die Menge aller Tripel aus natürlichen Zahlen (z.B. `(0,0,0),(42,0,12)`), also `M={(a,b,c) | a,b,c Element d. nat. Zahlen}`. Die wohlfundierte und partielle Ordnung sei die natürliche Ordnung auf die einzelnen Komponenten mit der Komponentenweisen Ordnung auf die ersten beiden Elemente. Für `A = (a,b,c)` und `B = (d,e,f)` gilt also `A <= B <=> ab <= cc` (`A` ist genau dann kleiner gleich `B`, wenn `ab` mit der Komponentenweisen Ordung kleiner gleich `cd`). Diese Ordnung ist wohlfundiert, da keine absteigende Kette möglich ist, mit unendlich vielen minimalen Elementen der Form `(0, 0, x)` (`x` ist eine beliebige natürliche Zahl). Die Ordnung ist auch partiell, da z.B. `(2,0,3)` und `(1,1,1)` nicht miteinander verglichen ('geordnet') werden können. Dann hat z.B das Element `(1,0,0)` unendlich viele Vorgänger der Form `(0,0,x)` (`x` ist eine beliebige natürliche Zahl). Jedes nicht minimale Element hat also unendlich viele Vorgänger (die Relation ist aber wohlfundiert!).
