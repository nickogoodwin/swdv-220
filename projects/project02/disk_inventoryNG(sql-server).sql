/*
Nicko Goodwin
Created: 9/16/2022

--MOD LOG---
10/7/2022
	-moved "status_id" to borrowed_disks table instead of disks table
*/

DROP DATABASE disk_inventoryNG;

CREATE DATABASE disk_inventoryNG;

USE disk_inventoryNG;
GO

CREATE TABLE
     genres (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(max),
        PRIMARY KEY(id)
    );
GO

CREATE TABLE
     artists (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(max),
        PRIMARY KEY(id)
    );
GO

CREATE TABLE
	disk_types (
	id INT NOT NULL IDENTITY,
	name VARCHAR(255),
	PRIMARY KEY (id)
	);
GO

CREATE TABLE
     statuses (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        PRIMARY KEY(id)
    );
GO

CREATE TABLE
     borrowers (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        phone VARCHAR(255),
        PRIMARY KEY(id)
    );
GO

CREATE TABLE
     disks (
        id INT NOT NULL IDENTITY,
        name VARCHAR(255) NOT NULL,
        release_date DATE NOT NULL,
        genre_id INT NOT NULL,
        artist_id INT NOT NULL,
		disk_type_id int NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY (genre_id) REFERENCES genres(id),
        FOREIGN KEY (artist_id) REFERENCES artists(id),
		FOREIGN KEY (disk_type_id) REFERENCES disk_types(id)
    );
GO

CREATE TABLE
     borrowed_disks (
        id INT NOT NULL IDENTITY,
        disk_id INT NOT NULL,
		status_id INT NOT NULL,
        borrower_id INT NOT NULL,
        borrowed_date DATE NOT NULL,
        returned_date DATE,
        PRIMARY KEY(id),
        FOREIGN KEY (disk_id) REFERENCES disks(id),
        FOREIGN KEY (borrower_id) REFERENCES borrowers(id),
		FOREIGN KEY (status_id) REFERENCES statuses(id)
    );
GO

DROP LOGIN diskUserNG;
CREATE LOGIN diskUserNG WITH PASSWORD = 'p@55w0rd';

DROP USER IF EXISTS diskUserNG;
CREATE USER diskUserNG FOR LOGIN diskUserNG;

GRANT SELECT TO diskUserNG;
GO

/* PROJECT 3 */


INSERT INTO genres(name, description)
VALUES 
	('Blues', 'Blues is a music genre[3] and musical form which originated in the Deep South of the United States around the 1860s[2] by African-Americans from roots in African-American work songs and spirituals.'),
	('Country','Country (also called country and western) is a genre of popular music that originated with blues, church music such as Southern gospel and spirituals, old-time, and American folk music forms including Appalachian, Cajun, Creole, and the cowboy Western music styles of New Mexico, Red Dirt, Tejano, and Texas country.'),
	('Electronic','Electronic music is a genre of music that employs electronic musical instruments, digital instruments, or circuitry-based music technology in its creation.'),
	('Hip Hop','Hip hop music or hip-hop music, also known as rap music,[5][6] is a genre of popular music that originated in New York City in the 1970s. It consists of stylized rhythmic music (usually built around drum beats) that commonly accompanies rapping, a rhythmic and rhyming speech that is chanted'),
	('Rock','Rock music is a broad genre of popular music that originated as "rock and roll" in the United States in the late 1940s and early 1950s, developing into a range of different styles in the mid-1960s and later, particularly in the United States and United Kingdom');
GO

INSERT INTO artists(name, description)
VALUES 
	('Robert Johnson', 'Robert Leroy Johnson (May 8, 1911 – August 16, 1938) was an American blues musician and songwriter. His landmark recordings in 1936 and 1937 display a combination of singing, guitar skills, and songwriting talent that has influenced later generations of musicians.'),
	('Tim Mcgraw', 'Samuel Timothy McGraw (born May 1, 1967) is an American country music singer, songwriter, record producer, and actor.'),
	('Skrillex', 'Sonny John Moore (born January 15, 1988), known professionally as Skrillex, is an American DJ and music producer.'),
	('Eminem', 'Marshall Bruce Mathers III (born October 17, 1972), known professionally as Eminem (/ˌɛmɪˈnɛm/; stylized as EMINƎM), is an American rapper and record producer.'),
	('The Rolling Stones', 'The Rolling Stones are an English rock band formed in London in 1962. Active for six decades, they are one of the most popular and enduring bands of the rock era.');
GO

INSERT INTO disk_types
VALUES ('CD'), ('Cassette'), ('Vinyl'), ('8-track'), ('Other');
GO

/* 
The requirements say to add 5+ rows into the "Statuses" table, but I firmly believe that we only need 2 
for the purposes of this Disk Borrowing app.
*/
INSERT INTO statuses
VALUES
	('Checked In'),
	('Checked Out');
GO

--Populate 'borrowers' table
INSERT INTO borrowers (name, phone)
VALUES (
        'Dani Jacquest',
        '253-630-7984'
    ), (
        'Kearney Likly',
        '902-288-9397'
    ), (
        'Durante Dewicke',
        '984-660-2149'
    ), (
        'Sharai Mival',
        '113-185-4665'
    ), (
        'Forrester Poyzer',
        '144-688-8956'
    ), (
        'Delphinia Dedmam',
        '662-388-2813'
    ), ('Kirby Dain', '418-439-6263'), (
        'Kristien Fibbit',
        '357-784-9722'
    ), (
        'Arvie Cerith',
        '400-814-6791'
    ), ('Anton Weeds', '553-634-6836'), ('Ted McGrae', '542-697-5128'), (
        'Vittorio Killigrew',
        '193-316-5970'
    ), ('Prudy Roome', '826-462-2281'), (
        'Mackenzie Kindell',
        '156-809-1378'
    ), (
        'Alanna Upcott',
        '820-487-2763'
    ), (
        'Robby Kirdsch',
        '400-625-5577'
    ), ('Debi Mainz', '884-728-4383'), (
        'Flynn Baudon',
        '441-614-7179'
    ), (
        'Jesse Ivshin',
        '470-444-5163'
    ), (
        'Magdalene Hrishanok',
        '929-140-2939'
    ), (
		'Tanny Srawley', 
		'749-767-0750'
	);
GO

DELETE FROM borrowers
WHERE name = 'Tanny Srawley';
GO

--Populate 'disks' table
INSERT INTO
    disks (
        name,
        release_date,
        genre_id,
        artist_id,
        disk_type_id
    )
VALUES (
        'Prosacco, Renner and Marks',
        '3/31/1965',
        5,
        5,
        3
    ), (
		'Hammes', '5/8/1987', 
		5, 
		5, 
		3), (
        'Leuschke, Schuster and Ernser',
        '2/12/2021',
        1,
        3,
        5
    ), (
        'Connelly, McCullough and Parisian',
        '7/25/1979',
        4,
        4,
        4
    ), (
        'Davis-Adams',
        '11/9/1962',
        2,
        5,
        5
    ), (
        'Roob-Lehner',
        '12/5/1990',
        5,
        5,
        3
    ), (
        'Weissnat Inc',
        '8/18/2021',
        1,
        2,
        5
    ), (
        'Swift Group',
        '4/21/1996',
        1,
        3,
        5
    ), (
        'Kris-Reichel',
        '5/17/2022',
        4,
        3,
        4
    ), (
        'Lubowitz, Schaefer and Rutherford',
        '1/16/1992',
        1,
        2,
        1
    ), (
        'Gerlach and Sons',
        '8/30/1961',
        4,
        3,
        4
    ), (
        'Lehner, Wiegand and Prosacco',
        '6/30/1971',
        5,
        2,
        3
    ), (
        'Auer and Sons',
        '7/15/1964',
        3,
        2,
        1
    ), (
        'O''Hara Group',
        '8/22/1997',
        3,
        4,
        2
    ), (
        'Williamson-Quigley',
        '12/22/2003',
        3,
        2,
        4
    ), (
        'Daniel, Windler and Schinner',
        '6/3/1969',
        3,
        1,
        5
    ), (
        'Murazik-Grant',
        '11/4/1971',
        1,
        2,
        4
    ), (
        'Torphy-Bogisich',
        '9/30/1964',
        2,
        3,
        5
    ), (
        'Kilback-Moore',
        '4/28/1965',
        3,
        4,
        4
    ), (
        'Batz Group',
        '9/17/1997',
        3,
        1,
        4
    ), (
        'McGlynn LLC',
        '6/7/2019',
        2,
        3,
        1
    );
GO


DELETE FROM disks
WHERE name = 'McGlynn LLC';
GO

--Populate 'borrowed_disks_ table;
insert into
    borrowed_disks (
        disk_id,
		status_id,
        borrower_id,
        borrowed_date,
        returned_date
    )
values 
	(9, 2, 4, '8/24/2022', null), 
	(12, 1, 7, '8/21/2022', '9/10/2022'), 
	(18, 2, 11, '9/5/2022', null), 
	(15, 1, 7, '8/23/2022', '9/18/2022'), 
	(2, 2, 15, '9/2/2022', null), 
	(18, 2, 11, '8/27/2022', null), 
	(19, 1, 12, '8/24/2022', '9/11/2022'), 
	(10, 1, 13, '8/14/2022', '9/13/2022'), 
	(1, 2, 3, '8/16/2022', null), 
	(8, 1, 18, '9/1/2022', '9/19/2022'), 
	(3, 2, 9, '8/21/2022', null), 
	(13, 2, 20, '8/15/2022', null), 
	(15, 2, 1, '9/5/2022', null), 
	(12, 1, 7, '9/1/2022', '9/13/2022'), 
	(10, 1, 2, '8/27/2022', '10/4/2022'), 
	(19, 1, 19, '8/13/2022', '9/10/2022'), 
	(16, 2, 9, '9/3/2022', null), 
	(16, 1, 14, '8/29/2022','9/13/2022'), 
	(5, 2, 19, '8/22/2022', null), 
	(12, 2, 6, '9/6/2022', null);
GO

SELECT 
	disks.name as 'Disk Name', 
	artists.name as 'Artist', 
	genres.name as 'Genre', 
	disk_types.name AS 'Disk Type', 
	borrowers.name AS 'Borrower', 
	statuses.name as 'Status', 
	borrowed_date, 
	returned_date  
FROM borrowed_disks
	JOIN disks ON borrowed_disks.disk_id = disks.id
	JOIN artists ON disks.artist_id = artists.id
	JOIN genres ON disks.genre_id = genres.id
	JOIN disk_types ON disks.disk_type_id = disk_types.id
	JOIN borrowers ON borrowed_disks.borrower_id = borrowers.id
	JOIN statuses ON borrowed_disks.status_id = statuses.id
WHERE statuses.id = 2; --only show rows with "Checked Out" status
GO