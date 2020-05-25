SELECT id_pracownika, nazwisko FROM pracownicy;

SELECT wynagrodzenia.id_pracownika, pensje.kwota, premie.kwota
FROM wynagrodzenia
INNER JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_wynagrodzenia
INNER JOIN premie ON premie.id_premii = wynagrodzenia.id_premii
WHERE pensje.kwota + premie.kwota > '1000';

SELECT wynagrodzenia.id_pracownika, pensje.kwota
FROM wynagrodzenia
INNER JOIN pensje ON wynagrodzenia.id_pensji=pensje.id_pensji
WHERE pensje.kwota > '2000' AND wynagrodzenia.id_premii IS NULL;

SELECT * FROM pracownicy WHERE imie LIKE 'J%';

SELECT * FROM pracownicy WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

SELECT pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin AS nadgodziny
FROM pracownicy
INNER JOIN godziny ON pracownicy.id_pracownika = godziny.id_pracownika
WHERE godziny.liczba_godzin > 160;

SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota
FROM pracownicy
INNER JOIN wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN pensje ON wynagrodzenia.id_pensji = pensje.id_pensji
WHERE kwota BETWEEN '1500' AND '3000';

SELECT pensje.kwota, pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko
FROM pracownicy
INNER JOIN wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN pensje ON wynagrodzenia.id_pensji = pensje.id_pensji
GROUP BY pensje.kwota, pracownicy.id_pracownika;

SELECT godziny.liczba_godzin, pracownicy.imie, pracownicy.nazwisko
FROM wynagrodzenia
INNER JOIN pracownicy ON pracownicy.id_pracownika = wynagrodzenia.id_wynagrodzenia
INNER JOIN godziny ON godziny.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN premie ON premie.id_premii = wynagrodzenia.id_premii
WHERE godziny.liczba_godzin > 160 AND premie.id_premii IS NULL;


SELECT pensje.kwota AS pensja, pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, premie.kwota AS premia
FROM wynagrodzenia
INNER JOIN pracownicy ON pracownicy.id_pracownika = wynagrodzenia.id_wynagrodzenia
INNER JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_wynagrodzenia
INNER JOIN premie ON premie.id_premii = wynagrodzenia.id_premii
ORDER BY premie.kwota DESC, pensje.kwota DESC;

SELECT COUNT(*) stanowisko FROM pensje AS zliczenie
GROUP BY stanowisko;

SELECT MIN(kwota), MAX(kwota) FROM pensje 
WHERE pensje.stanowisko = 'Konserwator';

SELECT SUM(pensje.kwota)+ SUM(premie.kwota) AS wynagrodznia
FROM pensje
INNER JOIN premie ON pensje.id_premii = premie.id_premii;

SELECT SUM(pensje.kwota)+ SUM(premie.kwota) AS wynagrodznia
FROM pensje
INNER JOIN premie ON pensje.id_premii = premie.id_premii
GROUP BY pensje.stanowisko;

SELECT COUNT(id_premii), stanowisko FROM pensje
GROUP BY stanowisko;

DELETE FROM pensje
WHERE kwota < '1200';




