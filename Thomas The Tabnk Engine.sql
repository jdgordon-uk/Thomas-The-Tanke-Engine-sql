-- SQL Schema and Sample Data for Thomas the Tank Engine Characters

-- Characters Table
CREATE TABLE Characters (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50),
    colour VARCHAR(50),
    number VARCHAR(10),
    first_appearance VARCHAR(255)
);

-- Sample Data for Characters
INSERT INTO Characters (id, name, type, colour, number, first_appearance) VALUES
(1, 'Thomas', 'Engine', 'Blue', '1', 'The Adventure Begins'),
(2, 'Percy', 'Engine', 'Green', '6', 'Thomas and the Guard'),
(3, 'Gordon', 'Engine', 'Blue', '4', 'Thomas and Gordon'),
(4, 'Henry', 'Engine', 'Green', '3', 'The Sad Story of Henry'),
(5, 'Sir Topham Hatt', 'Human', NULL, NULL, 'Thomas and Gordon'),
(6, 'James', 'Engine', 'Red', '5', 'Thomas and the Breakdown Train'),
(7, 'Edward', 'Engine', 'Blue', '2', 'Edward and Gordon'),
(8, 'Toby', 'Engine', 'Brown', '7', 'Toby and the Stout Gentleman'),
(9, 'Emily', 'Engine', 'Green', NULL, 'Emily’s New Coaches'),
(10, 'Diesel', 'Engine', 'Black', NULL, 'Pop Goes the Diesel'),
(11, 'Annie', 'Coach', 'Orange', NULL, 'Thomas and the Guard'),
(12, 'Clarabel', 'Coach', 'Orange', NULL, 'Thomas and the Guard'),
(13, 'Duck', 'Engine', 'Green', '8', 'Duck and the Diesel Engine'),
(14, 'Donald', 'Engine', 'Black', '9', 'Break Van'),
(15, 'Douglas', 'Engine', 'Black', '10', 'Break Van'),
(16, 'Oliver', 'Engine', 'Green', '11', 'Escape'),
(17, 'Bill', 'Engine', 'Yellow', '12', 'Break Van'),
(18, 'Ben', 'Engine', 'Yellow', '13', 'Break Van'),
(19, 'Rosie', 'Engine', 'Pink', '37', 'Rosie is Red'),
(20, 'Harold', 'Helicopter', 'White', NULL, 'Percy and Harold'),
(21, 'Cranky', 'Crane', 'Grey', NULL, 'Cranky Bugs'),
(22, 'Salty', 'Engine', 'Red', NULL, 'Salty’s Secret'),
(23, 'Mavis', 'Engine', 'Black', NULL, 'Mavis'),
(24, 'Spencer', 'Engine', 'Silver', '70', 'Gordon and Spencer'),
(25, 'Daisy', 'Diesel Railcar', 'Green', NULL, 'Daisy');

-- Relations Table
CREATE TABLE Relations (
    character_id INT,
    relation_type VARCHAR(50),
    related_to_id INT,
    FOREIGN KEY (character_id) REFERENCES Characters(id),
    FOREIGN KEY (related_to_id) REFERENCES Characters(id)
);

-- Sample Data for Relations
INSERT INTO Relations (character_id, relation_type, related_to_id) VALUES
(1, 'Friend', 2), -- Thomas and Percy are friends
(1, 'Friend', 3), -- Thomas and Gordon are friends
(3, 'Rival', 4),  -- Gordon and Henry are rivals
(1, 'Manager', 5), -- Sir Topham Hatt manages Thomas
(1, 'Friend', 6), -- Thomas and James are friends
(7, 'Mentor', 1), -- Edward is a mentor to Thomas
(1, 'Pulls', 11), -- Thomas pulls Annie
(1, 'Pulls', 12), -- Thomas pulls Clarabel
(10, 'Rival', 1), -- Diesel and Thomas are rivals
(10, 'Rival', 7), -- Diesel and Edward are rivals
(6, 'Rival', 13), -- James and Duck are rivals
(14, 'Twin', 15), -- Donald and Douglas are twins
(17, 'Twin', 18), -- Bill and Ben are twins
(1, 'Friend', 19), -- Thomas and Rosie are friends
(2, 'Friend', 20), -- Percy and Harold are friends
(21, 'Works_with', 22), -- Cranky works with Salty
(23, 'Rival', 1), -- Mavis and Thomas are rivals
(3, 'Rival', 24), -- Gordon and Spencer are rivals
(1, 'Friend', 25); -- Thomas and Daisy are friends

-- Episodes Table
CREATE TABLE Episodes (
    episode_id INT PRIMARY KEY,
    title VARCHAR(255),
    season INT,
    release_date DATE
);

-- Sample Data for Episodes
INSERT INTO Episodes (episode_id, title, season, release_date) VALUES
(1, 'Thomas and Gordon', 1, '1984-09-09'),
(2, 'Thomas and the Guard', 1, '1984-09-16'),
(3, 'Edward and Gordon', 1, '1984-09-23'),
(4, 'The Sad Story of Henry', 1, '1984-09-30'),
(5, 'Thomas and the Breakdown Train', 1, '1984-10-07'),
(6, 'Toby and the Stout Gentleman', 1, '1984-10-14'),
(7, 'Emily’s New Coaches', 7, '2003-09-08'),
(8, 'Pop Goes the Diesel', 2, '1986-09-28'),
(9, 'Duck and the Diesel Engine', 2, '1986-10-05'),
(10, 'Break Van', 2, '1986-10-12'),
(11, 'Escape', 3, '1986-10-19'),
(12, 'Rosie is Red', 20, '2018-02-14'),
(13, 'Percy and Harold', 2, '1986-10-26'),
(14, 'Cranky Bugs', 5, '1998-09-28'),
(15, 'Salty’s Secret', 6, '2002-10-08'),
(16, 'Mavis', 3, '1986-11-02'),
(17, 'Gordon and Spencer', 7, '2003-10-20'),
(18, 'Daisy', 2, '1986-11-09');

-- Character Episodes Table
CREATE TABLE CharacterEpisodes (
    character_id INT,
    episode_id INT,
    FOREIGN KEY (character_id) REFERENCES Characters(id),
    FOREIGN KEY (episode_id) REFERENCES Episodes(episode_id)
);

-- Sample Data for Character Episodes
INSERT INTO CharacterEpisodes (character_id, episode_id) VALUES
(1, 1), -- Thomas in 'Thomas and Gordon'
(3, 1), -- Gordon in 'Thomas and Gordon'
(1, 2), -- Thomas in 'Thomas and the Guard'
(2, 2), -- Percy in 'Thomas and the Guard'
(7, 3), -- Edward in 'Edward and Gordon'
(4, 4), -- Henry in 'The Sad Story of Henry'
(1, 5), -- Thomas in 'Thomas and the Breakdown Train'
(6, 5), -- James in 'Thomas and the Breakdown Train'
(8, 6), -- Toby in 'Toby and the Stout Gentleman'
(9, 7), -- Emily in 'Emily’s New Coaches'
(10, 8), -- Diesel in 'Pop Goes the Diesel'
(13, 9), -- Duck in 'Duck and the Diesel Engine'
(14, 10), -- Donald in 'Break Van'
(15, 10), -- Douglas in 'Break Van'
(16, 11), -- Oliver in 'Escape'
(19, 12), -- Rosie in 'Rosie is Red'
(2, 13), -- Percy in 'Percy and Harold'
(20, 13), -- Harold in 'Percy and Harold'
(21, 14), -- Cranky in 'Cranky Bugs'
(22, 15), -- Salty in 'Salty’s Secret'
(23, 16), -- Mavis in 'Mavis'
(24, 17), -- Spencer in 'Gordon and Spencer'
(25, 18); -- Daisy in 'Daisy'
