CREATE TABLE public.pracownicy
(
    id_pracownika integer NOT NULL,
    imie text COLLATE pg_catalog."default" NOT NULL,
    adres text COLLATE pg_catalog."default" NOT NULL,
    telefon integer,
    nazwisko character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika)
)

TABLESPACE pg_default;

ALTER TABLE public.pracownicy
    OWNER to postgres;

CREATE TABLE public.godziny
(
    id_godziny integer NOT NULL,
    date date NOT NULL,
    liczba_godzin integer,
    id_pracownika integer NOT NULL,
    CONSTRAINT godziny_pkey PRIMARY KEY (id_godziny),
    CONSTRAINT "ID_pracownika" FOREIGN KEY (id_pracownika)
        REFERENCES public.pracownicy (id_pracownika) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.godziny
    OWNER to postgres;

CREATE TABLE public.premie
(
    id_premii integer NOT NULL,
    rodzaj character varying(50) COLLATE pg_catalog."default",
    kwota money NOT NULL,
    CONSTRAINT premie_pkey PRIMARY KEY (id_premii)
)

TABLESPACE pg_default;

ALTER TABLE public.premie
    OWNER to postgres;

CREATE TABLE public.pracownicy
(
    id_pracownika integer NOT NULL,
    imie text COLLATE pg_catalog."default" NOT NULL,
    adres text COLLATE pg_catalog."default" NOT NULL,
    telefon integer,
    nazwisko character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika)
)

TABLESPACE pg_default;

ALTER TABLE public.pracownicy
    OWNER to postgres;

INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('1', 'Sebastian', 'Bach', 'Ulica 32', '273472283');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('2', 'Mateusz', 'Piwowarczyk', 'Ulica 23', '574838229');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('3', 'Janina', 'Chmielak', 'Ulica 54', '447838446');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('4', 'Pawel', 'Janas', 'Ulica 342', '858473888');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('5', 'Marta', 'Dobrowa', 'Ulica 343', '443242223');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('6', 'Katarzyna', 'Kubek', 'Ulica 223', '343222434');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('7', 'Cecylia', 'Wilk', 'Ulica 1', '998474333');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('8', 'Piotr', 'Kadluek', 'Ulica 329', '334888343');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('9', 'Ewa', 'Pajak', 'Ulica 66', '222333555');
INSERT INTO pracownicy(ID_pracownika, imie, nazwisko, adres, telefon) VALUES('10', 'Bartosz', 'Filizanka', 'Ulica 9', '999444678');

INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('2', '11/11/11', '155', '2');
INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('3', '11/11/11', '156', '3');
INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('4', '11/11/11', '162', '4');
INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('5', '11/11/11', '165', '5');
INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('6', '11/11/11', '154', '6');
INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('7', '11/11/11', '155', '7');
INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('8', '11/11/11', '158', '8');
INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('9', '11/11/11', '160', '9');
INSERT INTO godziny(ID_godziny, date, liczba_godzin, id_pracownika) VALUES('10', '11/11/11', '159', '10');

INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('1', 'Nadgodziny', '300');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('2', 'Nadgodziny', '250');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('3', 'Nadgodziny', '450');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('4', 'Projekt', '420');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('5', 'Projekt', '400');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('6', 'Kwartalna', '1300');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('7', 'Kwartalna', '1300');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('8', 'Nadgodziny', '400');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('9', 'Nadgodziny', '200');
INSERT INTO premie(ID_premii, rodzaj, kwota) VALUES('10', 'Projekt', '900');

INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('1', 'Konserwator', '3450', '1');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('2', 'Konserwator', '3400', '2');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('3', 'Konserwator', '3300', '3');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('4', 'Pragramista', '5500', '6');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('5', 'Programista', '5200', '8');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('6', 'Programista', '4950', '7');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('7', 'Kierowca', '3700', '4');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('8', 'Rekruter', '4200', '5');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('9', 'Kierownik', '5950', '9');
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES('10', 'Dyrektor', '8450', '10');


