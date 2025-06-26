# Nasz super produkt Rezerwacji Miejsca Kinowego
https://github.com/Man1ek27/MovieReservationSystem

# 
## Instrukcja do Projektu:

### Jak odtworzyć bazę danych lokalnie?

1. Zainstaluj PostgreSQL.
2. Utwórz nową bazę danych:
3. Zaimportuj strukturę i dane:
   psql -U postgres -d moviereservation -f database/moviereservation_dump.sql
4. Skonfiguruj dane dostępowe w aplikacji.
 aby zgadzało sie z konfiguracją projektu:
   private final String DB_URL = "jdbc:postgresql://localhost:5432/moviereservation";
   private final String DB_USER = "postgres";
   private final String DB_PASSWORD = "123qwe";

### Dodanie odpowiednich flag:

Otworzyc: Edit Configurations.. 
W polu VM Options (jezeli nie ma tego pola trzeba zaznaczyc Modify options -> Add VM Options)

Dodać flagi:

    --module-path
    "C:\javafx-sdk-24.0.1\lib"
    --add-modules
    javafx.controls,javafx.fxml
    --enable-native-access=javafx.graphics
    --add-opens=java.base/sun.misc=ALL-UNNAMED
    --enable-native-access=ALL-UNNAMED
    --sun-misc-unsafe-memory-access=allow

