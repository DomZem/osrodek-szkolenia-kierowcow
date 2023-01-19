------ Tabela Adresy ------

-- Próba wprowadzenia b³êdnego kodu pocztowego
INSERT INTO Adresy(miejscowosc, ulica, kodPocztowy) VALUES('Kraków', 'S³owicza', '31A320');

-- Próba wprowadzenia wartoœæi ujemnej dla numer domu
INSERT INTO Adresy(miejscowosc, ulica, kodPocztowy, numerDomu) VALUES('Kraków', 'Mickiewicza', '31-320', -1);

-- Próba wprowadzenia wartoœæi ujemnej dla numer lokalu
INSERT INTO Adresy(miejscowosc, ulica, kodPocztowy, numerLokalu) VALUES('Myœlenice', 'Curie', '32-230', -1);

------ Tabela Egzaminy ------

-- Próba wprowadzenia innej litery ni¿ T, P dla rodzaju egzaminu
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, idKursanta) VALUES (GETDATE()+1, 'X', 'B', 3);

-- Próba wprowadzenia innej litery ni¿ T, F dla zaliczenia egzaminu
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) VALUES (GETDATE()+1, 'T', 'B', 'X', 4);

-- Próba wprowadzenia daty egzaminu, która jest wczeœniejsza ni¿ aktualna
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, idKursanta) VALUES (GETDATE()-1, 'T', 'B', 5);

-- Próba wprowadzenia innej kategorii prawa jazdy ni¿ AM, A1, A2, A, B1, B, B+E, C, C1, C1+E, D, D1, D1+E, D+E, T
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, idKursanta) VALUES (GETDATE()+1, 'T', 'X', 6);

------ Tabela Instruktorzy ------

-- Próba wprowadzenia numeru PESEL, który zawiera litery zamiast cyfr
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('Szczepan', 'Miko³ajczyk', '42A10500891', '883924234');

-- Próba wprowadzenia numeru telefonu, który zawiera litery zamiast cyfr
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('Szczepan', 'Miko³ajczyk', '42310500891', '88A924234');

-- Próba wprowadzenia daty urodzenia, która jest póŸniejsza ni¿ aktualna
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu, dataUrodzenia) VALUES('Szczepan', 'Miko³ajczyk', '42310500891', '883924234', GETDATE()+1);

-- Próba wprowadzenia zduplikowanego numeru telefonu
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('Szczepan', 'Miko³ajczyk', '42310500891', '609136229');

-- Próba wprowadzenia zduplikowanego numeru PESEL
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('Szczepan', 'Miko³ajczyk', '12282706154', '883924234');

------ Tabela Jazdy ------

-- Próba wprowadzniea instruktora, który odby³ ju¿ jazdê tego samego dnia
INSERT INTO Jazdy (dataJazdy, godzinaRozpoczecia, opis, liczbaGodzin, idInstruktora, idPojazdu, idKursanta1, idKursanta2, idKursanta3) 
VALUES(GETDATE()+32, '14:45', 'Jazda po mieœcie', 2, 3, 4, 2, null, null);

-- Próba wprowadzenia pojazdu, który by³ ju¿ u¿ywany tego samego dnia
INSERT INTO Jazdy (dataJazdy, godzinaRozpoczecia, opis, liczbaGodzin, idInstruktora, idPojazdu, idKursanta1, idKursanta2, idKursanta3) 
VALUES(GETDATE()+32, '14:45', 'Jazda po mieœcie', 2, 1, 3, 3, null, null);

-- Próba wprowadzenia daty jazdy, która jest wczeœniejsza ni¿ aktualna
INSERT INTO Jazdy (dataJazdy, godzinaRozpoczecia, opis, liczbaGodzin, idInstruktora, idPojazdu, idKursanta1, idKursanta2, idKursanta3) 
VALUES(GETDATE()-1, '14:45', 'Jazda po mieœcie', 0, 1, 3, 1, 2, 3);

-- Próba wprowadzenia liczby godzin równej 0
INSERT INTO Jazdy (dataJazdy, godzinaRozpoczecia, opis, liczbaGodzin, idInstruktora, idPojazdu, idKursanta1, idKursanta2, idKursanta3) 
VALUES(GETDATE()+33, '14:45', 'Jazda po mieœcie', 0, 1, 3, 1, 2, 3);

-- Próba wprowadzenia jazdy bez kursantów 
INSERT INTO Jazdy (dataJazdy, godzinaRozpoczecia, opis, liczbaGodzin, idInstruktora, idPojazdu, idKursanta1, idKursanta2, idKursanta3) 
VALUES(GETDATE()+33, '14:45', 'Jazda po mieœcie', 3, 1, 3, null, null, null);

-- Próba wprowadzenia tych samych kursantów
INSERT INTO Jazdy (dataJazdy, godzinaRozpoczecia, opis, liczbaGodzin, idInstruktora, idPojazdu, idKursanta1, idKursanta2, idKursanta3) 
VALUES(GETDATE()+33, '14:45', 'Jazda po mieœcie', 3, 1, 3, 1, 1, null);

INSERT INTO Jazdy (dataJazdy, godzinaRozpoczecia, opis, liczbaGodzin, idInstruktora, idPojazdu, idKursanta1, idKursanta2, idKursanta3) 
VALUES(GETDATE()+33, '14:45', 'Jazda po mieœcie', 3, 1, 3, 1, 2, 1);

INSERT INTO Jazdy (dataJazdy, godzinaRozpoczecia, opis, liczbaGodzin, idInstruktora, idPojazdu, idKursanta1, idKursanta2, idKursanta3) 
VALUES(GETDATE()+33, '14:45', 'Jazda po mieœcie', 3, 1, 3, 1, 2, 2);

------ Tabela Kursanci ------

-- Próba wprowadzenia numeru dowodu osobistego, który zawiera w pierwszych trzech znakach liczby
INSERT INTO Kursanci VALUES('Zofia','Bednarczyk', '1974-04-22', '933861776', 'A1J169663', 1);

-- Próba wprowadzenia numeru dowodu osobistego, który zawiera od czwartego znaku litery
INSERT INTO Kursanci VALUES('Zofia','Bednarczyk', '1974-04-22', '933861776', 'AMJA69663', 1);

-- Próba wprowadzenia numeru telefonu, który zawiera litery zamiast cyfr
INSERT INTO Kursanci VALUES('Zofia','Bednarczyk', '1974-04-22', '93A861776', 'AMJ169663', 1);

-- Próba wprowadzenia daty urodzenia, która jest póŸniejsza ni¿ aktualna
INSERT INTO Kursanci VALUES('Zofia','Bednarczyk', GETDATE()+1, '933861776', 'AMJ169663', 1);

-- Próba wprowadzenia dupliaktu dla numeru telefonu
INSERT INTO Kursanci VALUES('Zofia','Bednarczyk', '1974-04-22', '618205993', 'AMJ310155', 1);

-- Próba wprowadzenia duplikatu dla numeru dowodu osobistego
INSERT INTO Kursanci VALUES('Zofia','Bednarczyk', '1974-04-22', '933861776', 'AMJ355844', 1);

------ Tabela Kursy ------

-- Próba wprowadzenia kategorii która jest inna ni¿ AM, A1, A2, A, B1, B, B+E, C, C1, C1+E, D, D1, D1+E, D+E, T
INSERT INTO Kursy VALUES('X', 30, 17, 9);

-- Próba wprowadznie liczby godzin równej 0
INSERT INTO Kursy VALUES('B1', 0, 17, 9);

-- Próba wprowadzenia minimalnej iloœæ lat równej 0
INSERT INTO Kursy VALUES('B1', 30, 0, 9);

------ Tabela Licencje ------

-- Proba wprowadzenia licencji, któr¹ instruktor ju¿ posiada
INSERT INTO Licencje VALUES(GETDATE()-365, GETDATE()+365, 'AM', 1);

-- Próba wprowadzenia daty wydania, która jest póŸniejsza ni¿ aktualna
INSERT INTO Licencje VALUES(GETDATE()+5, GETDATE()+365, 'AM', 5);

-- Próba wprowadzenia daty wa¿noœci, która jest wczeœniejsza ni¿ aktualna
INSERT INTO Licencje VALUES(GETDATE()-365, GETDATE()-5, 'AM', 5);

-- Próba wprowadzenia kategorii która nie jest AM, A1, A2, A, B1, B, B+E, C, C1, C1+E, D, D1, D1+E, D+E, T
INSERT INTO Licencje VALUES(GETDATE()-365, GETDATE()+365, 'X', 5);

------ Tabela Pojazdy ------

-- Próba wprowadzenia numeru rejestracyjengo, który nie posiada na pocz¹tku 3 du¿ych liter 
INSERT INTO Pojazdy VALUES('samochód osobowy', '0RK7321', GETDATE()+365, 'Toyota', 'Yaris', 2010);

-- Próba wprowadzenia innego rodzaju pojazdu ni¿ samochód osobowy, autobus, motocykl, samochód ciê¿arowy
INSERT INTO Pojazdy VALUES('X', 'KBR9056', GETDATE()+365, 'Toyota', 'Yaris', 2010);

-- Próba wprowadzenia daty przegl¹du, która jest póŸniejsza ni¿ aktualna
INSERT INTO Pojazdy VALUES('samochód osobowy', 'KBR9056', GETDATE()-1, 'Toyota', 'Yaris', 2010);

-- Próba wprowadzenia rocznika który jest liczb¹ ujemn¹
INSERT INTO Pojazdy VALUES('samochód osobowy', 'KBR9056', GETDATE()+365, 'Toyota', 'Yaris', -1);

------ Tabela Szkolenia ------

-- Próba wprowadzenia kursanta, który ma ju¿ rozpoczêty ten sam kurs danej kategorii
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(1, 1);

-- Próba wprowadzenia daty rozpoczêcia szkolenia, która jest wczeœniejsza ni¿ aktualna
INSERT INTO Szkolenia(idKursanta, idKursu, dataRozpoczecia) VALUES(9, 3, GETDATE()-1);

-- Próba wprowadzenia daty zakoñczenia szkolenia, która jest wczeœniejsza ni¿ data rozpoczêcia
INSERT INTO Szkolenia(idKursanta, idKursu, dataRozpoczecia, dataZakonczenia) VALUES(9, 3, GETDATE()+2, GETDATE()+1);
