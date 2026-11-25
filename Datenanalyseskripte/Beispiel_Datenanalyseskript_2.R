# Beispiel eines einfachen Datenanalyseskripts
# ------------------------------------------------------------------------------
# Dieses Skript lädt den Datensatz "Beispieldaten.csv",
# berechnet Mittelwerte und Korrelation, speichert die Kennwerte
# und visualisiert die Daten in einem Streu- und einem Balkendiagramm.
#
# Voraussetzung: Der Projektordner (hier der Kursordner
# progr-und-deskr-stat-26-27) ist in VS Code geöffnet und damit das
# Working Directory. Er enthält die Unterordner Daten/roh/ und Ergebnisse/.
# ------------------------------------------------------------------------------
# Seminar "Programmierung und Deskriptive Statistik" WiSe 2026/2027
# Autorin: Belinda Fleischmann
# Datum:   01.12.2026

# Verzeichnis- und Datenmanagement
# ------------------------------------------------------------------------------
projektordner  <- getwd()                                                       # Working Directory = Projektordner
rohdatenordner <- file.path(projektordner,  "Daten", "roh")                     # Ordner mit Rohdaten
ergebnisordner <- file.path(projektordner,  "Ergebnisse")                       # Ordner für Ergebnisse
dateipfad      <- file.path(rohdatenordner, "Beispieldaten.csv")                # Pfad zur Eingabedatei
ausgabepfad    <- file.path(ergebnisordner, "Ergebnisse.csv")                   # Pfad zur Ausgabedatei

# Daten von Festplatte einlesen
# ------------------------------------------------------------------------------
daten          <- read.csv(dateipfad)                                           # Einlesen der Daten

# Daten analysieren
# ------------------------------------------------------------------------------
colnames(daten) <- c("Var_1", "Var_2")                                          # Spaltenbezeichnungen ändern

# Mittelwerte der Variablen berechnen
mittelwert_1 <- mean(daten$Var_1)                                               # Mittelwert der Variable 1
mittelwert_2 <- mean(daten$Var_2)                                               # Mittelwert der Variable 2

# Korrelation der Variablen berechnen
korrelation <- cor(daten$Var_1, daten$Var_2)                                    # Korrelation beider Variablen

# Ausgabe der Ergebnisse
# ------------------------------------------------------------------------------
cat("Mittelwert der ersten Variable: ",                                         # Ausgabe Mittelwert Var_1
    mittelwert_1, "\n")
cat("Mittelwert der zweiten Variable: ",                                        # Ausgabe Mittelwert Var_2
    mittelwert_2, "\n")
cat("Korrelation: ",                                                            # Ausgabe Korrelation
    korrelation, "\n")

# Ergebnisse speichern
# ------------------------------------------------------------------------------
kennwerte <- data.frame(                                                        # Kennwerte als Dataframe
  kennwert = c("Mittelwert Var_1","Mittelwert Var_2", "Korrelation"),
  wert     = c(mittelwert_1, mittelwert_2, korrelation)
)
write.table(kennwerte,                                                          # Kennwerte als .csv speichern
            file      = ausgabepfad,
            sep       = ",",
            row.names = FALSE)

# Visualisierung der Daten
# ------------------------------------------------------------------------------
plot(daten$Var_1, daten$Var_2)                                                  # Streudiagramm
barplot(                                                                        # Balkendiagramm
  c("Var_1" = mittelwert_1,                                                     # Input: Höhe der Balken mit Namen
    "Var_2" = mittelwert_2)
)
