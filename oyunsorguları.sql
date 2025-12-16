-- Database: oyun veritabanı


-- 1. DEVELOPERS TABLOSU

CREATE TABLE developers (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    founded_year INT
);


-- 2. GAMES TABLOSu
CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    price NUMERIC(10,2),
    release_date DATE,
    rating NUMERIC(3,1),
    developer_id INT,
    CONSTRAINT fk_developer
        FOREIGN KEY (developer_id)
        REFERENCES developers(id)
        ON DELETE CASCADE
);


-- 3. GENRES TABLOSU

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);


-- 4. GAMES_GENRES ARA TABLO

CREATE TABLE games_genres (
    id SERIAL PRIMARY KEY,
    game_id INT,
    genre_id INT,
    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES games(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_genre
        FOREIGN KEY (genre_id)
        REFERENCES genres(id)
        ON DELETE CASCADE
);

INSERT INTO developers (company_name, country, founded_year) VALUES
('CD Projekt Red', 'Poland', 2002),
('Rockstar Games', 'USA', 1998),
('Bethesda', 'USA', 1986),
('Ubisoft', 'France', 1986),
('Valve', 'USA', 1996);

INSERT INTO genres (name, description) VALUES
('RPG', 'Role Playing Game'),
('Open World', 'Open world exploration'),
('Horror', 'Scary and suspenseful'),
('FPS', 'First Person Shooter'),
('Sports', 'Sports simulation games');

INSERT INTO games (title, price, release_date, rating, developer_id) VALUES
('The Witcher 3', 899.99, '2015-05-19', 9.5, 1),
('Cyberpunk 2077', 799.99, '2020-12-10', 8.0, 1),
('GTA V', 699.99, '2013-09-17', 9.7, 2),
('Red Dead Redemption 2', 999.99, '2018-10-26', 9.8, 2),
('Skyrim', 599.99, '2011-11-11', 9.4, 3),
('Fallout 4', 499.99, '2015-11-10', 8.7, 3),
('Assassin’s Creed Valhalla', 749.99, '2020-11-10', 8.6, 4),
('Far Cry 6', 649.99, '2021-10-07', 8.1, 4),
('Half-Life 2', 199.99, '2004-11-16', 9.6, 5),
('Counter-Strike 2', 0.00, '2023-09-27', 9.0, 5);

INSERT INTO games_genres (game_id, genre_id) VALUES
(1, 1), (1, 2),      -- Witcher 3: RPG, Open World
(2, 1), (2, 2),      -- Cyberpunk: RPG, Open World
(3, 2),              -- GTA V: Open World
(4, 2),              -- RDR2: Open World
(5, 1),              -- Skyrim: RPG
(6, 1),              -- Fallout 4: RPG
(7, 2),              -- AC Valhalla: Open World
(8, 4),              -- Far Cry 6: FPS
(9, 4),              -- Half-Life 2: FPS
(10, 4);             -- CS2: FPS

-- Tüm oyunlara %10 indirim
UPDATE games
SET price = price * 0.9;

select *from games;

-- Cyberpunk 2077 rating güncelleme
UPDATE games
SET rating = 9.0
WHERE title = 'Cyberpunk 2077';


-- Önce ara tablodan sil FK bağlantıları
DELETE FROM games_genres
WHERE game_id = 6;

-- Sonra oyunu sil
DELETE FROM games
WHERE id = 6;

-- Tüm oyunlar, fiyat ve geliştirici adı
select
g.title,
g.price,
d.company_name

from games g
join developers d on g.developer_id = d.id;

-- RPG türündeki oyunlar
SELECT 
    g.title,
    g.rating
FROM games g
JOIN games_genres gg ON g.id = gg.game_id
JOIN genres gr ON gg.genre_id = gr.id
WHERE gr.name = 'RPG';

-- Fiyatı 500 TL üstü oyunlar (pahalıdan ucuza)
SELECT title, price
FROM games
WHERE price > 500
ORDER BY price DESC;


-- İsmi içinde "War" geçen oyunlar
SELECT title
FROM games
WHERE title LIKE '%War%';

