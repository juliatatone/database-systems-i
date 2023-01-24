drop Trigger countArtTrigger;
drop Trigger countRankingTrigger;
drop table Event;
drop table Building;
drop table Artist;
drop table Member;
drop table TwoD;
drop table Pottery;
drop table Artwork;
drop table Gallery;
drop table Participant;
drop sequence artworkID_seq;
drop sequence memberID_seq;

create table Participant(
	pemail varchar2(25),
	firstName varchar2(15),
	lastName varchar2(15),
	phoneNumber number(10),
	city varchar2(15),
	state char(2),
    ranked number(2) not null,
	hasTicket char(1),
    type char(1) null,
	Constraint Participant_PK Primary Key (pemail)
);

create table Gallery(
	galleryName varchar2(15),
	maxCapacity number(3),
	Constraint Gallery_PK Primary Key (galleryName)
);

create table Artwork(
	artworkID number(3),
	galleryName varchar2(15),
	pemail varchar2(25),
	price number(6,2),
	title varchar2(25),
	category varchar2(15),
    medium varchar2(25),
	Constraint Artwork_PK Primary Key (artworkID),
	Constraint Artwork_GN_FK Foreign Key (galleryName) References Gallery (galleryName),
	Constraint Artwork_PM_FK Foreign Key (pemail) References Participant (pemail)
);

create sequence artworkID_seq
start with 1
increment by 2;

create table TwoD (
    	artworkID number(3),
    	medium varchar2(25),
    	category varchar2(15) default 'TwoD' not null,
    	Constraint TwoD_PK Primary Key (artworkID),
    	Constraint TwoD_FK Foreign Key (artworkID) References Artwork (artworkID)

);

create table Pottery (
    	artworkID number(3),
    	claybody varchar2(15),
    	category varchar2(15) default 'Pottery' not null,
    	Constraint Pottery_PK Primary Key (artworkID),
    	Constraint Pottery_FK Foreign Key (artworkID) References Artwork (artworkID)  
);

create table Member(
	memberID number(3),
	pemail varchar2(25),
	yearJoined date,
	expired char(1),
	Constraint Member_PK Primary Key (memberID),
	Constraint Member_FK Foreign Key (pemail) References Participant (pemail)
);

create sequence memberID_seq
start with 100
increment by 5;

create table Artist(
	pemail varchar2(25),
	numEvents number(3),
	Constraint Artist_PK Primary Key (pemail),
	Constraint Artist_FK Foreign Key (pemail) References Participant (pemail)
);
create table Building(
	buildingName varchar2(25),
	galleryName varchar2(15),
	zipCode number(5),
	state char(2),
	city varchar2(15),
	street varchar2(25),
	Constraint Building_PK Primary Key (buildingName),
	Constraint Building_FK Foreign Key (galleryName) References Gallery (galleryName)
);

create table ParticipantList(
pemail varchar2(25),
artworkID number(3),
rank number(2),
Constraint ParticipantList_PK Primary Key (pemail),
Constraint ParticipantList_PEM_FK Foreign Key (pemail) References Participant (pemail),
Constraint ParticipantList_AID_FK Foreign Key (artworkID) References Artwork (artworkID)
);

ALTER TABLE ParticipantList ADD CONSTRAINT UQ_pEmail_aID UNIQUE (pemail,artworkID);

create Trigger countArtTrigger
After Update on Artwork
Declare 
    countArt number;
begin
    select count(artworkID) into countArt
    from Artwork         
    if countArt >= 1000 Then
        RAISE_APPLICATION_ERROR(-20004, 'Cannot insert record.');     
    End IF;
end;
/

create Trigger countRankingTrigger
After Update on Participant
Declare 
    countRanking number;
begin
    select count(ranked) into countRanking
    from Participant;
    
    if countRanking > 20 Then
        RAISE_APPLICATION_ERROR(-20004, 'Cannot insert record.');     
    End IF;
end;
/
