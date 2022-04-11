CREATE DATABASE if not exists ONE_PIECE;
USE ONE_PIECE;

create table if not exists categorys (
	ID_CATEGORY INT auto_increment PRIMARY KEY,
    NAME VARCHAR(255)
);

create table if not exists weapons (
	ID_WEAPON INT auto_increment PRIMARY KEY,
    NAME VARCHAR(255),
    STRENGTH INT,
    SPEED INT,
    TWO_HAND BOOLEAN
);

create table if not exists characters (
	ID_CHARACTER INT auto_increment PRIMARY KEY,
    NAME VARCHAR(255) UNIQUE,
    CATEGORY INT,
    WEAPONS INT,
    STRENGTH INT,
    SPEED INT,
    EXPERIENCE INT DEFAULT '0',
    
    CONSTRAINT FK_CharacterCategory FOREIGN KEY (CATEGORY)
    REFERENCES categorys(ID_CATEGORY),
    
    CONSTRAINT FK_CharacterWeapon FOREIGN KEY (WEAPONS)
    REFERENCES weapons(ID_WEAPON)
);



create table if not exists crews (
	ID_CREW INT auto_increment PRIMARY KEY,
    NAME VARCHAR(255),
    MEMBERS INT,
    
    CONSTRAINT FK_CrewCharacter FOREIGN KEY (MEMBERS)
    REFERENCES characters(ID_CHARACTER)
);

create table if not exists ranks (
	ID_RANK INT auto_increment PRIMARY KEY,
    NAME VARCHAR(255),
    MEMBERS INT,
    
    CONSTRAINT FK_RankCharacter FOREIGN KEY (MEMBERS)
    REFERENCES characters(ID_CHARACTER)
);


select * from characters;
