-- Kreiranje sheme
CREATE SCHEMA IF NOT EXISTS formula1;

-- Uporaba sheme
USE formula1;

-- Tabela drzava
CREATE TABLE drzava (
    drzava_id CHAR(2) PRIMARY KEY,
    iso_koda CHAR(3) NOT NULL,
    ime VARCHAR(255) NOT NULL
);

-- Tabela dirkalisce
CREATE TABLE dirkalisce (
    dirkalisce_id INT PRIMARY KEY,
    ime VARCHAR(255) NOT NULL,
    drzava_id CHAR(2),
    FOREIGN KEY (drzava_id) REFERENCES drzava(drzava_id)
);

-- Tabela dirka
CREATE TABLE dirka (
    dirka_id INT PRIMARY KEY,
    datum DATE NOT NULL,
    dirkalisce_id INT,
    FOREIGN KEY (dirkalisce_id) REFERENCES dirkalisce(dirkalisce_id)
);

-- Tabela ekipa
CREATE TABLE ekipa (
    ekipa_id INT PRIMARY KEY,
    ime VARCHAR(255) NOT NULL,
    drzava_id CHAR(2),
    FOREIGN KEY (drzava_id) REFERENCES drzava(drzava_id)
);

-- Tabela dirkac
CREATE TABLE dirkac (
    dirkac_id INT PRIMARY KEY,
    ime VARCHAR(255) NOT NULL,
    drzava_id CHAR(2),
    datum_rojstva DATE NOT NULL,
    FOREIGN KEY (drzava_id) REFERENCES drzava(drzava_id)
);

-- Tabela rezultat
CREATE TABLE rezultat (
    dirka_id INT,
    ekipa_id INT,
    dirkac_id INT,
    uvrstitev INT,
    PRIMARY KEY (dirka_id, ekipa_id, dirkac_id),
    FOREIGN KEY (dirka_id) REFERENCES dirka(dirka_id),
    FOREIGN KEY (ekipa_id) REFERENCES ekipa(ekipa_id),
    FOREIGN KEY (dirkac_id) REFERENCES dirkac(dirkac_id)
);

-- Podatki za polnenje tabel
-- Vstavljanje podatkov v tabelo drzava
INSERT INTO formula1.drzava (drzava_id, iso_koda, ime) VALUES
('AU', 'AUS', 'Avstralija'),
('AT', 'AVT', 'Avstrija'),
('BR', 'BRA', 'Brazilija'),
('DE', 'DEU', 'Nemčija'),
('GB', 'GBR', 'Velika Britanija'),
('IT', 'ITA', 'Italija'),
('FR', 'FRA', 'Francija'),
('CH', 'CHE', 'Švica'),
('US', 'USA', 'Združene države Amerike'),
('IN', 'IND', 'Indija');
-- Dodajte več držav po potrebi...

INSERT INTO formula1.drzava (drzava_id, iso_koda, ime) VALUES
('FI', 'FIN', 'Finska'),
('CO', 'COL', 'Kolumbija'),
('MX', 'MEX', 'Mehika'),
('CA', 'CAN', 'Kanada'),
('ES', 'ESP', 'Španija');

-- Vstavljanje podatkov v tabelo drzava
INSERT INTO formula1.drzava (drzava_id, iso_koda, ime) VALUES
('TR', 'TUR', 'Turčija'),
('HU', 'HUN', 'Madžarska'),
('JP', 'JPN', 'Japonska'),
('BE', 'BEL', 'Belgija'),
('MC', 'MCO', 'Monako'),
('BH', 'BHR', 'Bahrain'),
('CN', 'CHN', 'Kitajska'),
('MY', 'MYS', 'Malezija'),
('RU', 'RUS', 'Rusija'),
('PT', 'PRT', 'Portugalska'),
('SI', 'SVN', 'Slovenija'),
('HR', 'HRV', 'Hrvaška'),
('DK', 'DNK', 'Danska'),
('NL', 'NLD', 'Nizozemska'),
('SE', 'SWE', 'Švedska'),
('NO', 'NOR', 'Norveška');
-- Dodajte več držav po potrebi...


-- Vstavljanje podatkov v tabelo ekipa
INSERT INTO formula1.ekipa (ekipa_id, ime, drzava_id) VALUES
(1, 'Ferrari', 'IT'),
(2, 'Mercedes', 'DE'),
(3, 'Red Bull Racing', 'AT'),
(4, 'McLaren', 'GB'),
(5, 'Renault', 'FR'),
(6, 'Williams', 'GB'),
(7, 'Alfa Romeo Racing', 'CH'),
(8, 'Aston Martin', 'GB'),
(9, 'AlphaTauri', 'AT'),
(10, 'Haas', 'US'),
(11, 'Sauber', 'CH'),
(12, 'Lotus', 'GB'),
(13, 'Force India', 'IN'),
(14, 'Toro Rosso', 'IT'),
(15, 'Brabham', 'GB');
-- Dodajte več ekip po potrebi...

-- Vstavljanje podatkov v tabelo dirkac
INSERT INTO formula1.dirkac (dirkac_id, ime, drzava_id, datum_rojstva) VALUES
(1, 'Luca Schumacher', 'DE', '2020-05-15'),
(2, 'Gerhard Berger Jr.', 'AT', '2019-08-25'),
(3, 'Diego Senna', 'BR', '2022-03-10'),
(4, 'Lewis Hill', 'GB', '2021-11-02'),
(5, 'Jack Hamilton', 'CA', '2018-09-18'),
(6, 'Edie Lauda', 'AT', '2023-07-12'),
(7, 'Nelson Piquet Jr.', 'BR', '2024-01-30'),
(8, 'Carlos Andretti', 'US', '2025-06-20'),
(9, 'Valentino Fittipaldi', 'IT', '2026-04-05'),
(10, 'Sebastian Hulkenberg', 'DE', '2020-12-15'),
(11, 'Kimi Rosberg', 'FI', '2019-10-08'),
(12, 'Ricardo Mansell', 'GB', '2022-02-28'),
(13, 'Jack Brabham Jr.', 'GB', '2021-09-14'),
(14, 'Gabriel Hamilton', 'FR', '2018-11-07'),
(15, 'Jules Villeneuve Jr.', 'CA', '2023-08-23'),
(16, 'Nik Leclerc', 'FR', '2024-05-17'),
(17, 'Carlos Sainz Jr.', 'ES', '2025-02-03'),
(18, 'Fernando Hill', 'GB', '2026-07-28'),
(19, 'Max Gutierrez', 'MX', '2020-04-11'),
(20, 'Sebastian Montoya', 'CO', '2019-07-19'),
(21, 'Charles Lefevre', 'FR', '2022-01-14'),
(22, 'Jenson Norris', 'GB', '2021-10-30'),
(23, 'Liam Alonso', 'ES', '2018-06-08'),
(24, 'Emilio Piquet', 'BR', '2023-04-25'),
(25, 'Nico Andretti', 'US', '2024-02-12'),
(26, 'Hiroshi Nakajima', 'JP', '2025-09-06'),
(27, 'Romain Gasly', 'FR', '2020-11-22'),
(28, 'Nico Rosberg Jr.', 'FI', '2019-09-04'),
(29, 'Max Mansell Jr.', 'GB', '2022-05-20'),
(30, 'David Brabham', 'GB', '2021-12-06');
-- Dodajte več dirkačev po potrebi...

-- Vstavljanje podatkov v tabelo dirkalisce
INSERT INTO formula1.dirkalisce (dirkalisce_id, ime, drzava_id) VALUES
(1, 'Silverstone Circuit', 'GB'),
(2, 'Circuit de Spa-Francorchamps', 'BE'),
(3, 'Autódromo Hermanos Rodríguez', 'MX'),
(4, 'Circuit de Monaco', 'MC'),
(5, 'Suzuka International Racing Course', 'JP'),
(6, 'Autódromo José Carlos Pace', 'BR'),
(7, 'Circuit Gilles Villeneuve', 'CA'),
(8, 'Hockenheimring', 'DE'),
(9, 'Hungaroring', 'HU'),
(10, 'Melbourne Grand Prix Circuit', 'AU'),
(11, 'Circuit de Barcelona-Catalunya', 'ES'),
(12, 'Bahrain International Circuit', 'BH'),
(13, 'Shanghai International Circuit', 'CN'),
(14, 'Sochi Autodrom', 'RU'),
(15, 'Sepang International Circuit', 'MY'),
(16, 'Autódromo do Estoril', 'PT'),
(17, 'Mugello Circuit', 'IT'),
(18, 'Istanbul Park Circuit', 'TR'),
(19, 'Circuit of the Americas', 'US'),
(20, 'Red Bull Ring', 'AT');
-- Dodajte več dirkališč po potrebi...

-- Vstavljanje podatkov v tabelo dirka
INSERT INTO formula1.dirka (dirka_id, dirkalisce_id, datum) VALUES
(1, 1, '2045-03-10'),
(2, 2, '2045-03-24'),
(3, 3, '2045-04-07'),
(4, 4, '2045-04-21'),
(5, 5, '2045-05-05'),
(6, 6, '2045-05-19'),
(7, 7, '2045-06-02'),
(8, 8, '2045-06-16'),
(9, 9, '2045-06-30'),
(10, 10, '2045-07-14'),
(11, 11, '2045-07-28'),
(12, 12, '2045-08-11'),
(13, 13, '2045-08-25'),
(14, 14, '2045-09-08'),
(15, 15, '2045-09-22'),
(16, 16, '2045-10-06'),
(17, 17, '2045-10-20'),
(18, 18, '2045-11-03'),
(19, 19, '2045-11-17'),
(20, 20, '2045-12-01'),
(21, 1, '2046-03-09'),
(22, 2, '2046-03-23'),
(23, 3, '2046-04-06'),
(24, 4, '2046-04-20'),
(25, 5, '2046-05-04'),
(26, 6, '2046-05-18'),
(27, 7, '2046-06-01'),
(28, 8, '2046-06-15'),
(29, 9, '2046-06-29'),
(30, 10, '2046-07-13'),
(31, 11, '2046-07-27'),
(32, 12, '2046-08-10'),
(33, 13, '2046-08-24'),
(34, 14, '2046-09-07'),
(35, 15, '2046-09-21'),
(36, 16, '2046-10-05'),
(37, 17, '2046-10-19'),
(38, 18, '2046-11-02'),
(39, 19, '2046-11-16'),
(40, 20, '2046-11-30'),
(41, 1, '2047-03-08'),
(42, 2, '2047-03-22'),
(43, 3, '2047-04-05'),
(44, 4, '2047-04-19'),
(45, 5, '2047-05-03'),
(46, 6, '2047-05-17'),
(47, 7, '2047-05-31'),
(48, 8, '2047-06-14'),
(49, 9, '2047-06-28'),
(50, 10, '2047-07-12'),
(51, 11, '2047-07-26'),
(52, 12, '2047-08-09'),
(53, 13, '2047-08-23'),
(54, 14, '2047-09-06'),
(55, 15, '2047-09-20'),
(56, 16, '2047-10-04'),
(57, 17, '2047-10-18'),
(58, 18, '2047-11-01'),
(59, 19, '2047-11-15'),
(60, 20, '2047-11-29'),
(61, 1, '2048-03-06'),
(62, 2, '2048-03-20'),
(63, 3, '2048-04-03'),
(64, 4, '2048-04-17'),
(65, 5, '2048-04-30'),
(66, 6, '2048-05-14'),
(67, 7, '2048-05-28'),
(68, 8, '2048-06-11'),
(69, 9, '2048-06-25'),
(70, 10, '2048-07-09'),
(71, 11, '2048-07-23'),
(72, 12, '2048-08-06'),
(73, 13, '2048-08-20'),
(74, 14, '2048-09-03'),
(75, 15, '2048-09-17'),
(76, 16, '2048-10-01'),
(77, 17, '2048-10-15'),
(78, 18, '2048-10-29'),
(79, 19, '2048-11-12'),
(80, 20, '2048-11-26'),
(81, 1, '2049-03-05'),
(82, 2, '2049-03-19'),
(83, 3, '2049-04-02'),
(84, 4, '2049-04-16'),
(85, 5, '2049-04-29'),
(86, 6, '2049-05-13'),
(87, 7, '2049-05-27'),
(88, 8, '2049-06-10'),
(89, 9, '2049-06-24'),
(90, 10, '2049-07-08'),
(91, 11, '2049-07-22'),
(92, 12, '2049-08-05'),
(93, 13, '2049-08-19'),
(94, 14, '2049-09-02'),
(95, 15, '2049-09-16'),
(96, 16, '2049-09-30'),
(97, 17, '2049-10-14'),
(98, 18, '2049-10-28'),
(99, 19, '2049-11-11'),
(100, 20, '2049-11-25'),
(101, 1, '2050-03-04'),
(102, 2, '2050-03-18'),
(103, 3, '2050-04-01'),
(104, 4, '2050-04-15'),
(105, 5, '2050-04-28'),
(106, 6, '2050-05-12'),
(107, 7, '2050-05-26'),
(108, 8, '2050-06-09'),
(109, 9, '2050-06-23'),
(110, 10, '2050-07-07'),
(111, 11, '2050-07-21'),
(112, 12, '2050-08-04'),
(113, 13, '2050-08-18'),
(114, 14, '2050-09-01'),
(115, 15, '2050-09-15'),
(116, 16, '2050-09-29'),
(117, 17, '2050-10-13'),
(118, 18, '2050-10-27'),
(119, 19, '2050-11-10'),
(120, 20, '2050-11-24');
;-- Dodajte več dirk po potrebi...

-- Rezultati tekem
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 1, 1, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 2, 2, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 3, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 5, 5, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 6, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 7, 7, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 8, 8, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 11, 15, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 10, 13, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 26, 1, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 13, 3, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 14, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 27, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 9, 7, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 29, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 21, 15, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (1, 16, 13, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 2, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 16, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 5, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 6, 6, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 9, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 10, 14, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 11, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 14, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 15, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 25, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 4, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 28, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 27, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (2, 30, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 1, 1, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 2, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 3, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 4, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 5, 5, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 7, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 6, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 23, 9, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 10, 14, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 11, 1, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 12, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 13, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 27, 6, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 9, 7, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 28, 8, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 21, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (3, 16, 14, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 30, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 2, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 4, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 11, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 6, 6, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 7, 7, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 9, 14, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 10, 12, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 5, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 13, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 15, 5, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 1, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 18, 7, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 25, 8, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 19, 14, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (4, 22, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 1, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 2, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 29, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 7, 7, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 28, 8, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 9, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 10, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 12, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 30, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 3, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 19, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 8, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (5, 21, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 1, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 8, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 5, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 7, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 4, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 9, 11, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 10, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 11, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 29, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 28, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 30, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 26, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (6, 18, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 1, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 3, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 4, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 2, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 8, 8, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 9, 11, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 10, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 6, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 14, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 30, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 26, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 21, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 29, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (7, 24, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 1, 1, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 3, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 4, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 29, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 6, 6, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 8, 8, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 9, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 10, 14, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 11, 1, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 20, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 22, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 21, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 27, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 14, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (8, 5, 14, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 1, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 3, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 2, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 4, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 8, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 7, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 6, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 9, 11, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 10, 10, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 20, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 28, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 27, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 26, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (9, 19, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 3, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 11, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 7, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 9, 14, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 18, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 6, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 19, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 29, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 23, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 24, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (10, 10, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 1, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 2, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 4, 4, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 10, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 9, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 8, 12, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 5, 11, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 12, 2, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 14, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 16, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 23, 7, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 20, 8, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 18, 12, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (11, 17, 11, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 5, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 2, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 3, 3, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 1, 5, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 6, 6, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 7, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 8, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 9, 15, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 10, 12, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 11, 1, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 13, 3, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 24, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 14, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 30, 7, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 27, 8, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 19, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (12, 29, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 1, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 11, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 3, 3, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 4, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 6, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 8, 8, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 22, 10, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 10, 14, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 2, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 12, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 13, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 14, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 9, 6, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 27, 7, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 21, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 25, 10, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (13, 20, 14, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 2, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 19, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 4, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 10, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 7, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 9, 12, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 6, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 14, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 15, 5, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 17, 6, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 29, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 3, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 18, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (14, 22, 10, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 1, 1, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 17, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 4, 4, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 5, 5, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 9, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 20, 15, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 11, 1, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 12, 2, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 13, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 14, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 15, 5, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 10, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 3, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 19, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 22, 11, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (15, 21, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 1, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 21, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 20, 9, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 10, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 11, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 23, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 25, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 3, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (16, 17, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 2, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 6, 6, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 7, 7, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 8, 8, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 9, 13, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 10, 14, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 11, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 30, 2, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 14, 4, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 12, 6, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 23, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 28, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 29, 13, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (17, 26, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 2, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 5, 5, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 14, 9, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 10, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 11, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 16, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 28, 6, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 24, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 30, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (18, 22, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 1, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 18, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 7, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 3, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 9, 9, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 10, 10, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 14, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 2, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 19, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 30, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 21, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (19, 28, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 2, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 5, 5, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 6, 6, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 12, 8, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 9, 13, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 10, 14, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 1, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 8, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 28, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 22, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 30, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 21, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (20, 25, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 1, 1, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 2, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 3, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 7, 7, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 9, 12, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 10, 15, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 15, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 11, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 19, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 16, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 27, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 26, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (21, 23, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 2, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 1, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 3, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 9, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 7, 7, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 8, 8, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 5, 10, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 10, 15, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 16, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 28, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 19, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 22, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (22, 27, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 4, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 2, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 5, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 7, 7, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 9, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 8, 9, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 10, 11, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 11, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 14, 4, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 15, 5, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 21, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 29, 7, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 25, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 22, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (23, 17, 11, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 1, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 2, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 5, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 25, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 9, 15, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 10, 11, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 11, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 12, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 8, 5, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 29, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 15, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 23, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 21, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (24, 27, 11, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 3, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 4, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 6, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 11, 8, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 9, 12, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 8, 9, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 10, 1, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 12, 2, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 14, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 15, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 29, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 17, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 26, 8, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 19, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (25, 27, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 2, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 3, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 15, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 6, 6, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 9, 10, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 10, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 11, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 12, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 13, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 27, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 5, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 14, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 16, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 25, 8, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 17, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (26, 24, 14, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 4, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 9, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 27, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 6, 14, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 10, 11, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 14, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 8, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 28, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 20, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 26, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (27, 16, 11, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 1, 1, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 2, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 3, 3, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 6, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 5, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 7, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 9, 11, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 10, 13, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 14, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 13, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 22, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 18, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 24, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 17, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (28, 21, 13, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 5, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 10, 8, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 9, 13, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 14, 10, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 13, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 8, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 21, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 29, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 30, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 26, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (29, 18, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 5, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 4, 5, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 7, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 8, 8, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 14, 14, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 10, 12, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 13, 3, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 9, 4, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 16, 6, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 23, 7, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 21, 8, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 22, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (30, 29, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 2, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 3, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 4, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 25, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 6, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 8, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 7, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 9, 9, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 10, 15, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 11, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 14, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 5, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 30, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 16, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 28, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (31, 17, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 20, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 2, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 3, 3, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 4, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 7, 7, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 8, 8, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 9, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 24, 10, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 11, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 14, 4, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 15, 5, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 1, 6, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 27, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 18, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 10, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (32, 16, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 26, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 2, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 4, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 11, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 8, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 9, 9, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 10, 15, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 5, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 13, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 1, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 20, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 21, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 17, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (33, 28, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 4, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 19, 7, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 21, 13, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 10, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 28, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 26, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 22, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 7, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (34, 9, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 7, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 2, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 3, 3, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 4, 4, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 9, 5, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 6, 6, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 1, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 5, 14, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 10, 10, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 11, 1, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 12, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 13, 3, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 14, 4, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 16, 6, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 28, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 30, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 20, 14, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (35, 22, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 4, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 1, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 9, 13, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 10, 15, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 11, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 15, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 25, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 16, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 27, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 24, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (36, 17, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 1, 1, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 5, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 4, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 3, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 29, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 7, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 8, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 9, 13, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 10, 9, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 14, 4, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 15, 5, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 25, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 17, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 20, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 26, 13, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (37, 6, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 11, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 9, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 10, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 7, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 28, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 15, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 23, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 19, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 17, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 18, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (38, 13, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 1, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 5, 5, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 6, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 11, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 9, 11, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 10, 12, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 13, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 12, 2, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 8, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 15, 5, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 24, 6, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 20, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 23, 8, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 21, 11, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (39, 26, 12, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 2, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 3, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 6, 6, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 9, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 13, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 10, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 12, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 11, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 18, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 16, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 19, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 26, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (40, 22, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 30, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 2, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 3, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 25, 4, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 7, 7, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 9, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 10, 10, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 11, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 13, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 20, 6, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 24, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 4, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 19, 13, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (41, 1, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 1, 1, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 12, 2, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 3, 3, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 4, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 6, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 7, 7, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 8, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 9, 14, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 10, 13, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 2, 2, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 18, 5, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 21, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 27, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 19, 8, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 16, 14, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (42, 15, 13, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 14, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 4, 4, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 11, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 9, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 10, 10, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 8, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 13, 3, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 3, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 25, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 26, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 23, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 29, 12, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (43, 17, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 1, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 3, 3, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 22, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 7, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 9, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 10, 9, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 18, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 30, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 26, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 6, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (44, 27, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 24, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 3, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 4, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 13, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 7, 7, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 9, 12, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 10, 11, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 11, 1, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 5, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 15, 5, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 2, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 29, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 19, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 25, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (45, 16, 11, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 5, 1, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 14, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 1, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 6, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 7, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 9, 10, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 10, 11, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 2, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 17, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 16, 7, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 22, 8, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 30, 10, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (46, 19, 11, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 1, 1, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 2, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 3, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 8, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 21, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 7, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 4, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 9, 10, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 10, 9, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 13, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 15, 5, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 27, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 26, 7, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 18, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 6, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (47, 23, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 19, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 2, 2, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 4, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 5, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 7, 7, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 8, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 10, 10, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 12, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 13, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 27, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 1, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 23, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 25, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (48, 26, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 1, 1, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 2, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 3, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 6, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 5, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 25, 7, 20);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 8, 8, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 9, 9, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 10, 15, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 11, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 12, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 13, 3, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 14, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 15, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 27, 6, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 17, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 24, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 22, 9, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (49, 7, 15, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 1, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 24, 3, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 4, 4, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 5, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 6, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 7, 7, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 9, 9, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 10, 10, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 11, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 15, 3, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 13, 5, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 3, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 26, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 30, 8, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 22, 9, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (50, 16, 10, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 4, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 2, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 3, 3, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 1, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 8, 8, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 9, 11, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 10, 12, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 23, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 12, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 13, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 14, 4, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 11, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 30, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 28, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 25, 11, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (51, 19, 12, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 1, 1, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 4, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 5, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 7, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 29, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 17, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 10, 14, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 13, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 15, 5, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 24, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 18, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 9, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 25, 12, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (52, 8, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 1, 1, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 3, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 4, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 25, 6, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 9, 10, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 11, 9, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 10, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 12, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 13, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 24, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 19, 7, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 23, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 28, 10, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (53, 6, 9, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 4, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 6, 6, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 13, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 8, 8, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 21, 13, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 10, 15, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 12, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 7, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 14, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 9, 6, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 25, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 19, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 26, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (54, 27, 15, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 1, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 8, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 10, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 4, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 7, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 2, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 9, 10, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 3, 14, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 14, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 21, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 27, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 16, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 24, 10, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (55, 17, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 16, 5, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 6, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 7, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 8, 8, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 24, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 10, 11, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 12, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 9, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 5, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 18, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 21, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (56, 25, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 7, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 2, 2, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 1, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 9, 11, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 10, 15, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 24, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 15, 5, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 27, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 25, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 13, 8, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 20, 11, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (57, 28, 15, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 1, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 28, 2, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 3, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 4, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 5, 5, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 7, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 15, 8, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 9, 10, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 10, 15, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 11, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 12, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 8, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 23, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 2, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 29, 8, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 24, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (58, 17, 15, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 10, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 2, 2, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 1, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 6, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 7, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 9, 10, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 3, 11, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 11, 1, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 12, 2, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 19, 6, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 27, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 24, 8, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 28, 10, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (59, 20, 11, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 1, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 3, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 5, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 6, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 9, 14, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 10, 9, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 15, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 14, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 21, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 27, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 19, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 20, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (60, 18, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 2, 2, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 3, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 4, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 29, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 13, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 9, 13, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 10, 11, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 7, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 15, 5, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 27, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 6, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 26, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 20, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (61, 28, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 1, 1, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 2, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 3, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 4, 4, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 5, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 7, 7, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 9, 9, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 15, 14, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 10, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 12, 2, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 13, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 11, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 30, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 26, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 16, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 25, 9, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (62, 23, 14, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 1, 1, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 2, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 10, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 4, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 5, 5, 20);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 6, 6, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 7, 7, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 8, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 9, 11, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 3, 14, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 12, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 16, 6, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 27, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 30, 8, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 18, 11, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (63, 22, 14, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 1, 1, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 2, 2, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 3, 3, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 4, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 6, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 8, 8, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 9, 11, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 10, 10, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 11, 1, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 12, 2, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 26, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 20, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 27, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 14, 8, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 28, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (64, 19, 10, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 8, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 5, 8, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 9, 13, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 10, 10, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 20, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 17, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 25, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 13, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 19, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (65, 16, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 3, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 4, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 6, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 8, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 9, 11, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 10, 12, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 27, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 13, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 15, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 20, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 11, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 25, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 17, 11, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (66, 26, 12, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 13, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 3, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 4, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 6, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 8, 8, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 10, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 12, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 1, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 14, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 15, 5, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 30, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 27, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 22, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 24, 9, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (67, 28, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 29, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 2, 2, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 3, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 5, 5, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 7, 7, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 8, 8, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 9, 14, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 10, 13, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 11, 1, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 12, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 13, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 14, 4, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 15, 5, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 24, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 18, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 16, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 1, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (68, 23, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 4, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 19, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 15, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 8, 8, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 9, 14, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 10, 12, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 12, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 14, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 7, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 28, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 22, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 29, 8, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 18, 14, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (69, 5, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 1, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 2, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 6, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 4, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 3, 6, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 7, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 8, 8, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 9, 9, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 10, 12, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 13, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 11, 3, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 14, 4, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 15, 5, 20);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 27, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 25, 7, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 20, 8, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 17, 9, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (70, 30, 12, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 1, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 2, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 3, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 4, 4, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 5, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 15, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 9, 12, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 10, 13, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 11, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 13, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 14, 4, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 8, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 19, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 24, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 21, 8, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 16, 12, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (71, 25, 13, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 1, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 2, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 13, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 7, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 10, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 15, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 12, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 6, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 11, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 24, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 23, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 29, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 18, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (72, 16, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 1, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 4, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 3, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 6, 6, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 8, 8, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 9, 13, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 10, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 14, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 12, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 21, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 30, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 28, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 19, 13, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (73, 16, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 1, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 8, 8, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 9, 13, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 10, 12, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 11, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 15, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 13, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 12, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 27, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 30, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 26, 8, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 21, 13, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (74, 18, 12, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 9, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 3, 3, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 7, 7, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 28, 8, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 2, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 10, 10, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 11, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 13, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 14, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 15, 5, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 30, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 8, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 25, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 23, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (75, 29, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 7, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 4, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 6, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 1, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 8, 8, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 29, 15, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 10, 9, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 13, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 27, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 22, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 16, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 18, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (76, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 2, 2, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 3, 3, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 24, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 8, 8, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 9, 9, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 10, 13, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 11, 1, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 13, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 16, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 19, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 7, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 17, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (77, 26, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 1, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 30, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 5, 5, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 8, 8, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 27, 10, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 10, 12, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 12, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 14, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 15, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 2, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 26, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 25, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 9, 10, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (78, 22, 12, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 14, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 26, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 4, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 6, 6, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 9, 11, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 10, 13, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 12, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 13, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 1, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 20, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 18, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 24, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 29, 11, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (79, 3, 13, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 1, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 2, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 14, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 4, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 7, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 8, 8, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 9, 12, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 10, 13, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 11, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 15, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 3, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 13, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 28, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 22, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 18, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 19, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (80, 27, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 1, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 2, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 11, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 12, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 9, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 10, 13, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 7, 1, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 8, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 13, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 30, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 23, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 16, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 24, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (81, 22, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 1, 1, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 23, 2, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 14, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 9, 11, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 10, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 4, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 26, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 18, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 2, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 19, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (82, 17, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 1, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 2, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 3, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 4, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 7, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 8, 8, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 18, 12, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 10, 13, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 12, 2, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 13, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 14, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 21, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 16, 6, 20);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 9, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 15, 8, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 23, 12, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (83, 30, 13, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 2, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 7, 5, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 5, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 9, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 10, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 11, 1, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 21, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 25, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 15, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 30, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 22, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (84, 27, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 7, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 5, 5, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 8, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 2, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 6, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 10, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 13, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 27, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 19, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 25, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 30, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (85, 28, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 18, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 2, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 3, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 4, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 5, 5, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 9, 8, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 8, 11, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 10, 10, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 11, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 12, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 13, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 15, 5, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 23, 6, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 25, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 24, 8, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 1, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (86, 19, 10, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 1, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 2, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 3, 3, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 11, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 6, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 13, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 8, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 9, 15, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 10, 12, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 5, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 7, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 28, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 18, 7, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 23, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 17, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (87, 16, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 1, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 3, 3, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 4, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 5, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 6, 6, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 7, 7, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 8, 8, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 9, 9, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 10, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 14, 4, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 28, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 20, 6, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 19, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 15, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 24, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (88, 23, 15, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 4, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 3, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 5, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 9, 14, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 10, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 11, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 13, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 29, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 22, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 21, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 14, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 20, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (89, 17, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 1, 1, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 2, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 3, 3, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 4, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 5, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 7, 7, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 9, 10, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 10, 12, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 11, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 18, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 14, 4, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 15, 5, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 13, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 23, 7, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 19, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 27, 10, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (90, 26, 12, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 1, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 17, 2, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 3, 3, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 9, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 6, 6, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 7, 7, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 8, 8, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 5, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 10, 10, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 13, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 14, 4, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 15, 5, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 26, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 21, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 16, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 2, 14, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (91, 24, 10, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 1, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 3, 2, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 14, 3, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 4, 4, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 6, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 9, 9, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 10, 15, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 12, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 2, 4, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 15, 5, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 23, 6, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 24, 7, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 29, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 28, 9, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (92, 18, 15, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 1, 1, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 3, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 17, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 18, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 7, 7, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 8, 8, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 10, 10, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 11, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 13, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 16, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 5, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 4, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 29, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (93, 26, 10, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 6, 6, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 9, 10, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 10, 15, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 20, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 29, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 28, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 26, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (94, 23, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 1, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 3, 3, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 4, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 30, 6, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 14, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 8, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 9, 10, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 10, 13, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 7, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 27, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 23, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 25, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 6, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (95, 16, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 23, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 3, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 5, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 18, 6, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 7, 7, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 8, 8, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 9, 14, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 10, 13, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 12, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 28, 6, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 1, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 26, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 6, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (96, 21, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 4, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 17, 2, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 1, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 5, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 7, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 8, 8, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 9, 15, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 10, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 11, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 12, 2, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 13, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 14, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 15, 5, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 22, 6, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 29, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 25, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 2, 15, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (97, 24, 14, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 2, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 3, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 14, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 9, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 10, 10, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 28, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 7, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 18, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 21, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 29, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 13, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (98, 30, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 4, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 7, 7, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 8, 8, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 20, 11, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 10, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 11, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 9, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 30, 6, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 27, 7, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 15, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 17, 11, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (99, 16, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 1, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 2, 2, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 6, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 10, 7, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 8, 8, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 9, 10, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 7, 13, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 23, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 13, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 11, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 19, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 22, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 28, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (100, 24, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 1, 1, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 2, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 4, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 6, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 7, 7, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 8, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 9, 14, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 10, 12, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 12, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 15, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 25, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 29, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 21, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 26, 14, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (101, 19, 12, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 3, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 4, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 2, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 5, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 7, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 8, 8, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 9, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 10, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 13, 3, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 28, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 22, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 30, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 17, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (102, 23, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 12, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 16, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 9, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 10, 15, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 11, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 5, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 14, 4, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 29, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 24, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 21, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 22, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (103, 7, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 1, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 20, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 3, 3, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 4, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 5, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 6, 6, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 7, 7, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 8, 8, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 9, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 10, 15, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 2, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 13, 3, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 14, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 15, 5, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 16, 6, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 23, 7, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 11, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 30, 10, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (104, 18, 15, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 2, 2, 20);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 16, 4, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 9, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 6, 6, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 7, 7, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 8, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 5, 9, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 10, 12, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 11, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 13, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 14, 4, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 15, 5, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 28, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 26, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 23, 8, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 29, 9, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (105, 4, 12, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 1, 1, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 2, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 3, 3, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 6, 6, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 8, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 7, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 9, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 10, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 28, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 13, 3, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 14, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 27, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 25, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 11, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 17, 10, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (106, 23, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 1, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 17, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 3, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 5, 5, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 6, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 7, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 22, 8, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 9, 11, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 10, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 11, 1, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 2, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 25, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 29, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 21, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (107, 8, 9, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 1, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 5, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 13, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 7, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 10, 10, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 11, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 2, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 28, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 17, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 25, 8, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 26, 9, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (108, 24, 10, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 1, 1, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 11, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 18, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 7, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 9, 11, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 10, 12, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 2, 1, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 12, 2, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 15, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 17, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 6, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 25, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 22, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (109, 21, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 1, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 2, 2, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 3, 3, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 14, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 8, 8, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 9, 15, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 10, 14, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 12, 2, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 15, 3, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 5, 4, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 13, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 20, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 17, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 16, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 22, 15, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (110, 27, 14, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 1, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 3, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 2, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 13, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 5, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 6, 6, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 7, 7, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 8, 8, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 9, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 10, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 11, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 4, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 14, 4, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 15, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 23, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 18, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 27, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 20, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (111, 16, 9, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 21, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 2, 2, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 5, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 9, 11, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 20, 15, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 11, 1, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 12, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 13, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 29, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 30, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 26, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 10, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (112, 1, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 1, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 2, 2, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 5, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 7, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 8, 8, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 9, 14, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 10, 9, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 11, 1, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 13, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 14, 4, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 18, 5, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 20, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 30, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 24, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 15, 14, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (113, 21, 9, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 2, 2, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 3, 3, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 4, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 5, 5, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 6, 6, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 11, 7, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 8, 8, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 9, 12, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 10, 15, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 7, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 12, 2, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 16, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 14, 4, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 30, 6, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 13, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 23, 8, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 28, 12, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (114, 26, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 1, 1, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 2, 2, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 3, 3, 18);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 4, 4, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 5, 5, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 6, 6, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 7, 7, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 8, 8, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 9, 12, 16);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 11, 9, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 10, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 13, 3, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 14, 4, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 30, 5, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 23, 6, 17);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 16, 7, 15);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 21, 8, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 15, 12, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (115, 27, 9, 19);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 1, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 7, 2, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 3, 3, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 4, 4, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 5, 5, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 8, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 2, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 6, 8, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 9, 14, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 10, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 11, 1, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 12, 2, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 13, 3, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 20, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 23, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 22, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 27, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (116, 25, 11, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 1, 1, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 2, 2, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 14, 3, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 4, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 5, 5, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 6, 6, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 7, 7, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 8, 8, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 9, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 10, 15, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 11, 1, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 12, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 13, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 3, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 15, 5, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 21, 6, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 26, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 19, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 27, 9, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (117, 23, 15, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 1, 1, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 2, 2, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 3, 3, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 4, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 5, 5, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 7, 7, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 8, 8, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 9, 14, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 28, 13, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 11, 1, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 13, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 14, 4, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 10, 6, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 23, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 19, 8, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 20, 14, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (118, 29, 13, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 1, 1, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 3, 3, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 18, 4, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 5, 5, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 7, 7, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 8, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 9, 12, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 15, 13, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 11, 1, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 12, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 13, 3, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 14, 4, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 10, 5, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 4, 6, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 22, 7, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 27, 8, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 26, 12, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (119, 28, 13, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 1, 1, 12);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 12, 2, 5);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 3, 3, 6);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 4, 4, 3);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 5, 5, 7);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 6, 6, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 7, 7, 1);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 8, 8, 10);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 9, 13, 4);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 10, 12, 2);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 11, 1, 14);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 2, 2, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 13, 3, 13);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 14, 4, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 15, 5, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 24, 6, 8);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 29, 7, 9);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 22, 8, 0);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 25, 13, 11);
INSERT INTO formula1.rezultat (dirka_id, dirkac_id, ekipa_id, uvrstitev) VALUES (120, 26, 12, 0);

