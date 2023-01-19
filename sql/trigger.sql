-- Trigger sprawdzaj¹cy czy kursant posiada wymagany wiek, aby uczetniczyæ w wybranym kursie

CREATE TRIGGER trSprawdzWiek
ON Szkolenia
FOR INSERT
AS
BEGIN
    DECLARE @kursant_id INT, @kurs_id INT, @data_rozpoczecia DATE
    DECLARE @min_wiek INT, @min_mies INT
    DECLARE @data_urodzenia DATE, @wiek INT, @mies INT
    
    SELECT @kursant_id = idKursanta, @kurs_id = idKursu, @data_rozpoczecia = dataRozpoczecia
    FROM inserted
    
    SELECT @min_wiek = minimalnaIloscLat, @min_mies = minimalnaIloscMiesiecy
    FROM Kursy
    WHERE idKursu = @kurs_id
    
    SELECT @data_urodzenia = dataUrodzenia
    FROM Kursanci
    WHERE idKursanta = @kursant_id
    
    SET @wiek = DATEDIFF(YEAR, @data_urodzenia, @data_rozpoczecia)
    SET @mies = DATEDIFF(MONTH, @data_urodzenia, @data_rozpoczecia) % 12
    
    IF (@wiek < @min_wiek OR (@wiek = @min_wiek AND @mies < @min_mies))
    BEGIN
        RAISERROR('Kursant nie spe³nia wymogów wiekowych dla tego kursu', 16, 1)
        ROLLBACK TRANSACTION
    END
END
