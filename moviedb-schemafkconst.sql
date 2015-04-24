
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
  primary key (maAwardName),
  Constraint fkTitle foreign key (Title) references Movies(Title),
  Constraint maYearlimit check (Yearawarded > 1900 and Yearawarded <= 2015)
);

CREATE TABLE Actors (
  BaconNo      number(6) not null,
  fname    varchar2(25) not null, 
  lname    varchar2(25) not null,
  Networth    number(9),
  Awards  varchar2(42),
  primary key (BaconNo, fname, lname),
  Constraint fkAwards foreign key (Awards) references MovieAwards(maAwardName)
);

CREATE TABLE FilmStudio (
  StudioID  number(9) not null,
  stName      varchar2(25) not null,
  CEO       varchar2(25) not null, 
  YearFounded NUMBER(4),
  sLocation varchar2(25),
  primary key (StudioID),
  Constraint fsYearlimit check(YearFounded > 1900 and YearFounded <= 2015)
);


CREATE TABLE FilmStudioLocation (
  StudioID   number(9),
  sLocation varchar2(15),
  constraint fkstudioid foreign key (StudioID) references FilmStudio(StudioID)
);

CREATE TABLE ProductionCompany (
  CompanyID number(9) not null,
  Name      varchar2(25) not null,
  CEO       varchar2(25) not null, 
  YearFounded number(4),
  Headquarters varchar2(25),
  primary key (CompanyID),
  Constraint pcYearlimit CHECK (YearFounded > 1900 and YearFounded <= 2015)
  
);

CREATE TABLE Produces (
  CompanyID number(9),
  Title varchar2(25),
  constraint pCompanyID foreign key (CompanyID) references ProductionCompany(CompanyID),
  constraint pTitle foreign key (Title) references Movies(Title)
);

CREATE TABLE Pays (
  CompanyID number(9),
  StudioID number(9),
  constraint paysCID foreign key (CompanyID) references ProductionCompany(CompanyID),
  constraint paysSID foreign key (StudioID) references FilmStudio(StudioID)

);

CREATE TABLE ActorAwards (
  Fname   varchar2(25) not null,
  Lname varchar2(25) not null, 
  AwardName varchar2(42),
  YearAwarded number(4),
  primary key (Fname, Lname, AwardName, YearAwarded),
  Constraint Yearlimit check (YearAwarded > 1900 and YearAwarded <= 2015)
);

CREATE TABLE ActsIn (
  Fname   varchar2(25),
  Lname varchar2(25), 
  Title varchar2(25),
  Yearacted integer,
  primary key (Fname, Lname, Title, Yearacted),
  Constraint aiYearlimit check (Yearacted > 1900 and YearActed <= 2015)
);

CREATE TABLE Creates (
  StudioID   number(9),
  YrReleased number(4), 
  Title varchar2(25),
  primary key (Title, YrReleased),
  constraint crStudID foreign key (StudioID) references FilmStudio(StudioID),
  constraint crTitle foreign key (Title) references Movie(Title)
);


CREATE TABLE WorksFor (
  Fname  varchar2(25) not null,
  Lname varchar2(25) not null, 
  StudioID number(9),
  primary key (Fname, Lname, StudioID),
  constraint wfFname foreign key (Fname) references Actor(fname),
  constraint wfLname foreign key (Lname) references Actor(lname),
  constraint wfStudID foreign key (StudioID) references FilmStudio(StudioID)
);

CREATE TABLE MovieWriters (
  Fname varchar2(25),
  Lname varchar2(25), 
  Title varchar2(25),
  Yr number(4),
  primary key (Fname, Lname, Title, Yr),
  Constraint Yearlimit check (Yr <1900 and Yr <2015)


);





