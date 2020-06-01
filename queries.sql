ALTER TABLE pracownicy ALTER COLUMN telefon Type varchar(120);
UPDATE pracownicy
SET telefon=SUBSTRING(telefon,1,3)||'-'||SUBSTRING(telefon,4,3)||'-'||SUBSTRING(telefon,7,3);

UPDATE pracownicy
SET telefon='(+48)'||SUBSTRING(telefon, 1, 11);

SELECT UPPER(imie), UPPER(nazwisko) FROM pracownicy 
ORDER BY length(nazwisko) DESC LIMIT 1;

SELECT md5(pensje.kwota) AS kwota FROM pracownicy
INNER JOIN wynagrodzenia ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika
INNER JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_pensji;

SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota AS pensja, premie.kwota AS premia
FROM wynagrodzenia
LEFT JOIN pracownicy ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
LEFT JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_pensji
LEFT JOIN premie ON premie.id_premii = wynagrodzenia.id_premii;

SELECT 'Pracownik ' || pracownicy.imie || ' ' || pracownicy.nazwisko || ' w dniu ' ||
godziny.date|| ' otrzymał pensje całkowitą na kwotę ' || pensje.kwota + premie.kwota ||
' gdzie wynagrodzenie zasadnicze wynosiło: '|| pensje.kwota || ',a premia: ' || premie.kwota ||
', nadgodziny: ' || '0 zł' AS raport FROM wynagrodzenia
INNER JOIN pracownicy ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika 
JOIN pensje ON pensje.id_pensji = wynagrodzenia.id_pensji 
JOIN premie ON premie.id_premii = wynagrodzenia.id_premii 
JOIN godziny ON godziny.id_godziny = wynagrodzenia.id_godziny;



