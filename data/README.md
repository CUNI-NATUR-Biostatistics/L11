# Výuková data L11

Soubor `ochmet_duby.csv` obsahuje údaje o 1 015 kmenech dubu zimního (*Quercus petraea*) na trvalé ploše Nad Šobesem v Národním parku Podyjí. Jeden řádek představuje jeden kmen. U každého kmene je zaznamenáno, zda na něm roste ochmet evropský (*Loranthus europaeus*), poloparazitický keřík, jehož semena roznášejí ptáci, a kolik keříků ochmetu na kmeni roste.

Plocha má rozlohu 2,37 ha. Autoři na ní zaměřili všechny kmeny s průměrem ve výšce prsou alespoň 7 cm. Kmeny do 12 m od okraje plochy a zlomené stromy z analýzy vyřadili, takže zbylo 1 015 kmenů. Porost je bývalá pařezina, a proto má mnoho dubů více kmenů. Tabulka kmenů ale neuvádí, ke kterému stromu kmen patří.

| Proměnná | Význam | Jednotka |
| --- | --- | --- |
| `kmen` | identifikační číslo kmene v původních datech | – |
| `dbh_cm` | průměr kmene ve výšce prsou (1,3 m) | cm |
| `napaden` | 1 = na kmeni roste alespoň jeden ochmet, 0 = neroste žádný | – |
| `pocet_ochmetu` | počet keříků ochmetu na kmeni | počet |
| `vzdalenost_napadeny_m` | vzdálenost k nejbližšímu jinému napadenému kmeni | m |
| `index_konkurence` | Hegyiho index konkurence okolních kmenů do vzdálenosti 12 m; vyšší hodnota znamená silnější konkurenci | – |

Údaje pocházejí z článku R. Matula, M. Svátek, M. Pálková, D. Volařík a T. Vrška (2015): Mistletoe infection in an oak forest is influenced by competition and host size. *PLoS ONE* 10(5): e0127055, <https://doi.org/10.1371/journal.pone.0127055>. Data autoři zveřejnili v repozitáři Dryad (<https://doi.org/10.5061/dryad.vk283>) pod licencí [CC0](https://creativecommons.org/publicdomain/zero/1.0/); používáme kopii souboru se záznamy o jednotlivých kmenech ze zrcadla na Zenodo (záznam [4945816](https://zenodo.org/records/4945816)).

Článek uvádí 131 napadených kmenů z 1 015 (12,9 %). Zveřejněný soubor obsahuje 96 napadených kmenů (9,5 %), přestože počet kmenů souhlasí. Údaj o celých stromech (105 napadených z 710, 14,8 %) se zveřejněnými daty souhlasí. Příčinu rozdílu u kmenů jsme nezjistili. Data používáme tak, jak byla zveřejněna.

Reprodukovatelnou přípravu provádí skript `R/prepare_mistletoe_data.R`. Skript stáhne soubor ze Zenodo, ověří jeho otisk SHA-256 a převede jej z formátu se středníky a kódováním Latin-1 na běžný CSV soubor. Ponechá jen proměnné, se kterými lekce pracuje, převede jejich názvy do češtiny a řádky seřadí podle čísla kmene. Řádky ani hodnoty nefiltruje a nemění. Sloupec `Min distance to mistletoe (m)` je v původním souboru totožný se sloupcem `Distance from infected stem (m)`, a proto ho skript nepřebírá.

SHA-256 původního souboru `Data on tree size, competition and mistletoe occurence on individual stems.csv`: `32439687be0a2b2410a05629e60ce0f40486b416adb186184a4ea03ae7aef5f6`.

SHA-256 souboru `ochmet_duby.csv`: `a930455340957c4d91644df3cf0945a2536374518dc958a22e6e69af997dc7f1`.

Na tato převzatá data se nevztahuje licence původního výukového obsahu v kořenovém `LICENSE.md`. Data jsou volná (CC0); při dalším použití přesto prosím citujte původní článek a datový záznam.
