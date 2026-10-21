# L11 — Hierarchická data a náhodné efekty

**Kolik nezávislých odpovědí dává 485 žabek z 16 pokusných nádrží?**

Tento repozitář obsahuje jedenáctou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Vylézají z tůní, které vyschly a znovu se naplnily, menší žabky? A kolik nezávislých odpovědí na tuto otázku nám vlastně dává tabulka se stovkami změřených žabek? Lekce navazuje na lineární modely z předchozích lekcí a ukazuje, co se stane, když řádky tabulky nejsou navzájem nezávislé.

Výuková data pocházejí z pokusu, ve kterém pulci skokana *Lithobates blairi* vyrůstali v 16 venkovních nádržích: osm z nich před pokusem vyschlo a bylo znovu napuštěno, osm nevyschlo. U 485 žabek byla po metamorfóze změřena délka těla a hmotnost. Vyschnutí se ale týkalo celých nádrží, takže žabky z jedné nádrže nejsou nezávislá opakování. Studenti určují hierarchii dat a jednotku nezávislé replikace, porovnávají jednoduchý lineární model se všemi řádky s modelem průměrů nádrží a vysvětlují, proč pseudoreplikace podhodnocuje nejistotu odhadu. Potom rozšíří lineární model o náhodný intercept, který dává každé nádrži vlastní výchozí úroveň, a rozlišují pevné a náhodné faktory podle otázky, kterou si klademe.

Důraz je na interpretaci: jak velký je rozdíl mezi žabkami z vyschlých a nevyschlých nádrží, jak přesně ho data určují a co ze závěru vyplývá pro tůně v krajině.

Opakovaná měření, lokality a bloky jsou v biologických datech běžné. Rozpoznat je a zohlednit v modelu je nutné pro poctivý odhad nejistoty a připravuje půdu pro zobecněné modely s hierarchickou strukturou.

## Výsledky učení

Po prostudování této lekce dokážete:

- pojmenovat hierarchii v datech (opakovaná měření, lokality, bloky) a určit, na které úrovni se mění zkoumaný prediktor;
- určit jednotku nezávislé replikace a vysvětlit, jak pseudoreplikace zkresluje standardní chybu, intervaly spolehlivosti a p-hodnoty;
- rozhodnout, zda má být skupinová proměnná pevným, nebo náhodným faktorem, a zdůvodnit volbu biologickou otázkou;
- fitovat lineární model s náhodným interceptem, interpretovat jeho pevný efekt a porovnat variabilitu mezi skupinami a uvnitř skupin;
- popsat, kdy je potřeba model s náhodnými efekty místo jednoduchého `lm`, a kdy stačí jednodušší řešení.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L11. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L11/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L11/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L11/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L11/current/presentation/presentation.pdf) |

Pro navazující praktické cvičení je připraven [R skript ke stažení](https://cuni-natur-biostatistics.github.io/L11/current/code/cviceni.R). Skript obsahuje úlohy a kód, se kterými budete pracovat během praktika.

- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `Exercises/cviceni.R` je studentský R skript pro praktické cvičení.
- `data/` obsahuje datové soubory specifické pro tuto lekci a popis jejich původu; `R/prepare_frog_data.R` je reprodukovatelně připravuje ze zveřejněného zdroje.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.
- `pollslive/` obsahuje neaktivní šablonu pro pozdější zapojení schváleného opakovacího kvízu; bez souborů `pollslive/config.json` a `pollslive/quiz.json` nijak nemění render lekce.
- `Workflow/` obsahuje záznamy rozhodnutí, kontrol a schválení během přípravy lekce; není součástí veřejného release balíčku.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L11.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L11-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L11/current/`.

Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md). Postup tvorby a kontroly lekce je v [`Workflow/README.md`](Workflow/README.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md). Výuková data o žabkách z pokusných nádrží mají vlastní původ a podmínky popsané v [`data/README.md`](data/README.md).
