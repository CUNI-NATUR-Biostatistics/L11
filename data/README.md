# Výuková data L11

Soubor `zabky_nadrze.csv` obsahuje 485 mladých žab (žabek) severoamerického druhu *Lithobates blairi*, které v pokusných nádržích dokončily metamorfózu. Jeden řádek představuje jednu žabku. Žabky pocházejí z 16 nádrží o objemu 1 000 l, do každé z nich bylo na začátku pokusu vysazeno 50 pulců. Osm nádrží před pokusem vyschlo a bylo znovu napuštěno, osm nevyschlo. Úprava se tedy týká celých nádrží, nikoli jednotlivých žabek.

| Sloupec | Obsah |
|---|---|
| `nadrz` | označení nádrže: písmeno N a číslo nádrže v původním pokusu (např. `N27`) |
| `vyschnuti` | `vyschla` = nádrž před pokusem vyschla a byla znovu napuštěna; `nevyschla` = nádrž nevyschla |
| `poradi_zabky` | pořadové číslo žabky v rámci nádrže |
| `datum_metamorfozy` | datum, kdy byla žabka po metamorfóze odlovena a změřena |
| `den_pokusu` | počet dní od začátku pokusu (8. 5. 2021) |
| `delka_tela_mm` | délka těla od špičky čenichu ke kloace (mm, celá čísla) |
| `hmotnost_mokra_g` | hmotnost živé žabky (g) |
| `hmotnost_sucha_g` | hmotnost po vysušení (g) |

Data pocházejí z pokusu K. J. Ward, S. E. M. Burkhead, E. A. Stybr-Burrus a T. M. Luhringa provedeného v roce 2021 na terénní stanici Wichita State University v Kansasu (USA). Výsledky vyšly v článku Ward et al. (2023) v časopise *Freshwater Biology*, [doi:10.1111/fwb.14157](https://doi.org/10.1111/fwb.14157). Původní dataset je zveřejněn v repozitáři Dryad, [doi:10.5061/dryad.hx3ffbgkn](https://doi.org/10.5061/dryad.hx3ffbgkn), pod licencí [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/). Používáme z něj soubor `Frog_Metamorph_Data_Dryad.xlsx`. V původním pokusu měly nádrže i další úpravy (s rybami a bez obratlovců); žabky však dokončily metamorfózu jen v nádržích, kde byli pulci bez ryb, a proto tabulka obsahuje jen tyto nádrže.

Reprodukovatelnou přípravu provádí skript `R/prepare_frog_data.R`. Repozitář Dryad nepovoluje stahování skriptem, proto skript stáhne totožný soubor z jeho zrcadla v repozitáři Zenodo ([záznam 8083635](https://zenodo.org/records/8083635)) a ověří jeho otisk SHA-256 (`cc879383de5a35a7ee57c9e6b446bb9c364bc9fd7007452e55ba39ea06f2fef4`). Skript převede kód úpravy na slovní popis vyschnutí, přejmenuje sloupce do češtiny, vynechá pomocné hmotnosti vážicích kelímků a suchou hmotnost (rozdíl dvou vážení s přesností 0,001 g) zaokrouhlí na tři desetinná místa, aby odstranil šum počítačového zaokrouhlování. Řádky nefiltruje a žádné naměřené hodnoty nemění.

SHA-256 souboru `zabky_nadrze.csv`: `f118373203097f1d40062112c5ee9ee0cfd89c79229a7b1e7f78e732d6d0683e`.

Na tato převzatá data se nevztahuje licence původního výukového obsahu v kořenovém `LICENSE.md`; při dalším použití uveďte původní článek a dataset.

## Krabi z lekce L05

Soubor `pie_crab.csv` je nezměněná kopie tabulky jednotlivých krabů z lekce L05 (392 samců kraba *Minuca pugnax* ze 13 slanisek; zeměpisná šířka a šířka krunýře). V této lekci slouží jen k připomenutí, proč jsme v L05 modelovali průměry slanisek. Data pocházejí z výukového vzorku `pie_crab` v balíčku [`lterdatasampler`](https://lter.github.io/lterdatasampler/) (Plum Island Ecosystems LTER; původní dataset [doi:10.6073/pasta/4c27d2e778d3325d3830a5142e3839bb](https://doi.org/10.6073/pasta/4c27d2e778d3325d3830a5142e3839bb), studie [doi:10.1002/ece3.5883](https://doi.org/10.1002/ece3.5883)); licenční záznam balíčku uvádí pro výukové vzorky [CC0](https://creativecommons.org/publicdomain/zero/1.0/). Reprodukovatelnou přípravu obsahuje skript `R/prepare_crab_data.R` v repozitáři L05.

SHA-256 souboru `pie_crab.csv`: `4ea1b496f05c409602b0657ca95505025c254a2f5595bfb7aa5f9fa4f85fb258`.

## Galapágy z předchozí lekce

Soubor `druhy_galapagy.csv` je nezměněná kopie výukové tabulky z lekce L10 (30 ostrovů Galapág; počet druhů rostlin a endemitů, plocha, nejvyšší bod a vzdálenosti). V této lekci slouží jen k obrázku s koeficienty modelu Mocninný vztah a s diagnostickými grafy v opakovacím kvízu o předchozí lekci. Údaje pocházejí z článku M. P. Johnson a P. H. Raven (1973): Species number and endemism: The Galapagos Archipelago revisited. *Science* 179: 893–895. Tabulka je převzata z datasetu `galamiss` v balíčku [`faraway`](https://cran.r-project.org/package=faraway) (J. Faraway), který je šířen pod licencí GPL. Reprodukovatelnou přípravu obsahuje skript `R/prepare_galapagos_data.R` v repozitáři L10. Obrázek s hmotnostmi savců používá přímo dataset `ggplot2::msleep` z balíčku `ggplot2` (Savage a West 2007; licence MIT), proto pro něj v tomto repozitáři není žádný soubor.

SHA-256 souboru `druhy_galapagy.csv`: `a60499f4070e59dfe729035bdb2d14fb84ca6c2db5fee3694ceca1ce84c98fb2`.
