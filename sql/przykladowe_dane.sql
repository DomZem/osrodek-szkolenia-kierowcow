-- Wprowadzenie przyk³adowych rekordów

-- Tabela Adresy
INSERT INTO Adresy (miejscowosc, ulica, kodPocztowy) VALUES('Kraków', 'S³owicza', '31-320');
INSERT INTO Adresy (miejscowosc, ulica, kodPocztowy) VALUES('Kraków', 'W¹wozowa', '31-752');
INSERT INTO Adresy (miejscowosc, ulica, kodPocztowy) VALUES('Kraków', 'Czarnolaska', '31-619');
INSERT INTO Adresy (miejscowosc, ulica, kodPocztowy) VALUES('Kraków', 'Lande Jerzego', '30-694');
INSERT INTO Adresy (miejscowosc, ulica, kodPocztowy) VALUES('Kraków', '3 Maja Al.', '30-063');

-- Tabela Kursanci
INSERT INTO Kursanci VALUES('Maksymilian','Kurowski', '2002-11-16', '899873588', 'AMJ302325', 1);
INSERT INTO Kursanci VALUES('Andrii','Stêpieñ', '2003-12-29', '365298577', 'AMJ335831', 2);
INSERT INTO Kursanci VALUES('Klara','Krupa', '1995-09-18', '618205993', 'AMJ355844', 3);
INSERT INTO Kursanci VALUES('Ilona', 'Paw³owska', '1983-10-25', '643869518', 'AMJ913660', 3);
INSERT INTO Kursanci VALUES('Pelagia', 'Zaj¹c', '2011-08-19', '813401255', 'AMJ099326', 5);

INSERT INTO Kursanci VALUES('Seweryn','Kucharski', '1992-07-21', '920721791', 'AMJ512249', 2);
INSERT INTO Kursanci VALUES('Igor','Kozio³', '2001-07-12', '680318546', 'AMJ640894', 2);
INSERT INTO Kursanci VALUES('Boles³aw','Krupa', '2000-09-21', '721220810', 'AMJ710360', 3);
INSERT INTO Kursanci VALUES('Maciej', 'Majchrzak', '1998-03-21', '980321413', 'AMJ222973', 3);
INSERT INTO Kursanci VALUES('Marceli', 'Walczak', '2001-07-07', '680707507', 'AMJ501054', 1);

-- Tabela Pojazdy
INSERT INTO Pojazdy VALUES('samochód osobowy', 'KRK7321', '2023-10-10', 'Toyota', 'Yaris', 2010);
INSERT INTO Pojazdy VALUES('samochód osobowy', 'KRK0928', '2023-05-05', 'Toyota', 'Yaris', 2011);
INSERT INTO Pojazdy VALUES('samochód osobowy', 'KRK2342', '2023-03-21', 'Toyota', 'Yaris', 2014);
INSERT INTO Pojazdy VALUES('samochód osobowy', 'KRK5331', '2023-04-29', 'Hyundai', 'i20', 2020);
INSERT INTO Pojazdy VALUES('samochód osobowy', 'KRK3242', '2023-03-23', 'Hyundai', 'i20', 2014);
INSERT INTO Pojazdy VALUES('samochód osobowy', 'KRK5243', '2023-03-22', 'Hyundai', 'i20', 2014);
INSERT INTO Pojazdy VALUES('motocykl', 'KRK2211', '2025-11-21', 'Honda', 'cbf 500', 2017);

-- Tabela Kursy
INSERT INTO Kursy VALUES('B', 30, 17, 9);
INSERT INTO Kursy VALUES('A', 20, 23, 9);
INSERT INTO Kursy VALUES('A2', 20, 17, 9);
INSERT INTO Kursy VALUES('A1', 20, 15, 9);
INSERT INTO Kursy VALUES('AM', 26, 13, 9);

-- Tabela Instruktorzy
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('Cezary', 'Ko³odziejczyk', '12282706154', '609136229')
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('W³odzimierz', 'Czarnecki', '03221741833', '520609335')
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('Damian', 'Wasilewski', '52060933574', '600818714')
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('Mariola', 'Szymañska', '11290642106', '430366277')
INSERT INTO Instruktorzy(imie, nazwisko, PESEL, numerTelefonu) VALUES('Artur', 'Barañski', '20050910290', '402359780')

-- Tabela Licencje
INSERT INTO Licencje VALUES(GETDATE()-362, GETDATE()+362, 'AM', 1);
INSERT INTO Licencje VALUES(GETDATE()-264, GETDATE()+264, 'A1', 1);
INSERT INTO Licencje VALUES(GETDATE()-280, GETDATE()+280, 'B', 1);
INSERT INTO Licencje VALUES(GETDATE()-180, GETDATE()+180, 'D+E', 1);
INSERT INTO Licencje VALUES(GETDATE()-210, GETDATE()+210, 'B', 2);

INSERT INTO Licencje VALUES(GETDATE()-201, GETDATE()+201, 'B+E', 2);
INSERT INTO Licencje VALUES(GETDATE()-182, GETDATE()+182, 'D+E', 2);
INSERT INTO Licencje VALUES(GETDATE()-284, GETDATE()+284, 'B', 3);
INSERT INTO Licencje VALUES(GETDATE()-194, GETDATE()+194, 'B', 4);
INSERT INTO Licencje VALUES(GETDATE()-102, GETDATE()+102, 'B', 5);

-- Tabela Szkolenia 
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(1, 1);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(1, 3);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(2, 1);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(3, 1);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(4, 1);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(5, 5);

INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(6, 3);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(7, 3);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(8, 1);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(9, 2);
INSERT INTO Szkolenia(idKursanta, idKursu) VALUES(10, 1);

-- Tabela Egzaminy 
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+3, 'T', 'B', 'T', 1);
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+4, 'P', 'B', 'T', 1);
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+6, 'T', 'B', 'T', 10);
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+9, 'P', 'B', 'T', 10);
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+10, 'T', 'B', 'T', 2);
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+12, 'P', 'B', 'F', 2);
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+16, 'P', 'B', 'F', 2);
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+18, 'P', 'B', 'F', 2);
INSERT INTO Egzaminy(dataEgzaminu, rodzaj, kategoria, zaliczony, idKursanta) 
VALUES (GETDATE()+19, 'P', 'B', 'T', 2);

-- Tabela Jazdy 
INSERT INTO Jazdy VALUES(GETDATE()+1, '8:00', 'Jazda na placu manewrowym', 2, 3, 3, 1, 2, null);
INSERT INTO Jazdy VALUES(GETDATE()+2, '14:00', 'Jazda po mieœcie', 3, 2, 3, 1, 2, 3);
INSERT INTO Jazdy VALUES(GETDATE()+3, '14:00', 'Jazda na placu manewrowym, ob³uga stanu technicznego pojazdu', 3, 1, 3, 4, 7, 2);
INSERT INTO Jazdy VALUES(GETDATE()+4, '8:00', 'Jazda po mieœcie', 3, 4, 2, 4, 6, 2);
INSERT INTO Jazdy VALUES(GETDATE()+5, '14:00', 'Jazda po mieœcie', 3, 1, 4, 5, 3, null);

INSERT INTO Jazdy VALUES(GETDATE()+10, '14:00', 'Jazda po mieœcie', 3, 4, 2, 9, 3, null);
INSERT INTO Jazdy VALUES(GETDATE()+11, '16:00', 'Jazda po mieœcie', 3, 1, 1, 2, 1, null);
INSERT INTO Jazdy VALUES(GETDATE()+12, '18:00', 'Jazda na placu manewrowym, ob³uga stanu technicznego pojazdu', 2, 1, 1, 3, 4, null);
INSERT INTO Jazdy VALUES(GETDATE()+13, '9:00', 'Jazda po mieœcie', 3, 2, 3, 1, 2, 3);
INSERT INTO Jazdy VALUES(GETDATE()+14, '10:00', 'Jazda na placu manewrowym', 3, 1, 3, 2, 4, 5);

INSERT INTO Jazdy VALUES(GETDATE()+20, '12:00', 'Jazda po mieœcie', 3, 3, 4, 2, 4, 5);
INSERT INTO Jazdy VALUES(GETDATE()+25, '11:00', 'Jazda na placu manewrowym, ob³uga stanu technicznego pojazdu', 3, 1, 3, 1, 3, 2);
INSERT INTO Jazdy VALUES(GETDATE()+30, '12:30', 'Jazda po mieœcie', 2, 4, 2, 2, 3, 1);
INSERT INTO Jazdy VALUES(GETDATE()+31, '14:45', 'Jazda po mieœcie', 3, 4, 4, 7, 2, null);
INSERT INTO Jazdy VALUES(GETDATE()+32, '14:45', 'Jazda po mieœcie', 2, 3, 3, 1, 2, null);


