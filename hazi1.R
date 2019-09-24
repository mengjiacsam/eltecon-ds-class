library(data.table)
library(ggplot2)
library(magrittr)

suicide <- fread("data/suiciderate.csv")
cancer <- fread("data/deathscancer.csv")
infant <- fread("data/infantmortality.csv")
spending <- fread("data/healthspending.csv")
lifeexp <- fread("data/lifeexp.csv")
obese <- fread("data/obese.csv")
smokers <- fread("data/smokers.csv")
popg <- fread("data/popgrowth.csv")
#sok adatsorunk van, mert a felev elejen kevesbe tudjuk meg, hogy
#konkretan mivel akarunk foglalkozni


#alapveto adattisztitasunk, hogy az adatsorokbol csak a negy orszag adatait
#hagyjuk meg, valamint ahol kell, ott a totalt, tehat teljes nepesseg, nem ferfi-no bontasban
#adataink forrasa az oecd.data, kiugro ertekeket igy nem talalunk

suicide <-suicide[LOCATION == "CZE"| LOCATION == "HUN" | LOCATION == "POL" |
                    LOCATION == "SVK"]
cancer <-cancer[LOCATION == "CZE"| LOCATION == "HUN" | LOCATION == "POL" |
                  LOCATION == "SVK"]
infant <-infant[LOCATION == "CZE"| LOCATION == "HUN" | LOCATION == "POL" |
                  LOCATION == "SVK"]
lifeexp <-lifeexp[LOCATION == "CZE"| LOCATION == "HUN" | LOCATION == "POL" |
                    LOCATION == "SVK"]
obese <-obese[LOCATION == "CZE"| LOCATION == "HUN" | LOCATION == "POL" |
                LOCATION == "SVK"]
spending <-spending[LOCATION == "CZE"| LOCATION == "HUN" | LOCATION == "POL" |
                      LOCATION == "SVK"]
smokers <-smokers[LOCATION == "CZE"| LOCATION == "HUN" | LOCATION == "POL" |
                    LOCATION == "SVK"]
#ezt az elozo utan, kulon futtasd
suicide <- suicide[SUBJECT == "TOT"]
cancer <- cancer[SUBJECT == "TOT"]
lifeexp <- lifeexp[SUBJECT == "TOT"]
spending <- spending[SUBJECT == "TOT"]
smokers <- smokers[SUBJECT == "TOT"]

popg <-popg[V2 == "CZE"| V2 == "HUN" | V2 == "POL" | V2 == "SVK"]
#a worldbankrol szedett egyetlen adatsor csv formaban
#mashogyan van szerkesztve, mint az eddigi "sima" csv-k, nehezebb belole szurni


#az adatsorokat egyelore kulon abrakon abrazoljuk idosorosan, kesobbi
#elemzes majd a felev soran kesobb tortenik, 2pelda abrara
ggplot(suicide, aes(TIME, Value, colour=LOCATION))+geom_line()
ggplot(cancer, aes(TIME, Value, colour=LOCATION))+geom_line()
