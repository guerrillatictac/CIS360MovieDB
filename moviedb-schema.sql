
--Taylor Wilcox, Kyle Williams, Jordan Sumner;
CREATE TABLE Movies(
  Title varchar2(42) not null,
  Director number(4) not null,
  YearReleased number(4) not null, 
  Runtime number(4),
  Rating varchar2(5),
  Budget number(10),
  Revenue number (15),
  Writer varchar(25),
  Awards varchar2(100),
  
  primary key (Title)
  
);

CREATE TABLE MovieAwards(
  Title   varchar2(42) not null,
  maAwardName    varchar2(42),
  Yearawarded  number(4),
  primary key (maAwardName)

);

CREATE TABLE Actors (
  BaconNo      number(6) not null,
  fname    varchar2(25) not null, 
  lname    varchar2(25) not null,
  Networth    number(9),
  Awards  varchar2(42),
  primary key (BaconNo, fname, lname)

);

CREATE TABLE FilmStudio (
  StudioID  number(9) not null,
  stName      varchar2(25) not null,
  CEO       varchar2(25) not null, 
  YearFounded NUMBER(4),
  sLocation varchar2(25),
  primary key (StudioID)
);


CREATE TABLE FilmStudioLocation (
  StudioID   number(9),
  sLocation varchar2(15)
  
);

CREATE TABLE ProductionCompany (
  CompanyID number(9) not null,
  Name      varchar2(25) not null,
  CEO       varchar2(25) not null, 
  YearFounded number(4),
  Headquarters varchar2(25),
  primary key (CompanyID)
  
);

CREATE TABLE Produces (
  CompanyID number(9),
  Title varchar2(25)

);

CREATE TABLE Pays (
  CompanyID number(9),
  StudioID number(9)  
);

CREATE TABLE ActorAwards (
  Fname   varchar2(25) not null,
  Lname varchar2(25) not null, 
  AwardName varchar2(42),
  YearAwarded number(4),
  primary key (Fname, Lname, AwardName, YearAwarded)
);

CREATE TABLE ActsIn (
  Fname   varchar2(25),
  Lname varchar2(25), 
  Title varchar2(25),
  Yearacted integer,
  primary key (Fname, Lname, Title, Yearacted)

);

CREATE TABLE Creates (
  StudioID   number(9),
  YrReleased number(4), 
  Title varchar2(25),
  primary key (Title, YrReleased)

);


CREATE TABLE WorksFor (
  Fname  varchar2(25) not null,
  Lname varchar2(25) not null, 
  StudioID number(9),
  primary key (Fname, Lname, StudioID)

);

CREATE TABLE MovieWriters (
  Fname varchar2(25),
  Lname varchar2(25), 
  Title varchar2(25),
  Yr number(4),
  primary key (Fname, Lname, Title, Yr)


);





