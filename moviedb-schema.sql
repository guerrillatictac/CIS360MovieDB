--DROP TABLE employee CASCADE CONSTRAINTS;
--DROP TABLE department CASCADE CONSTRAINTS;
--DROP TABLE dept_locations CASCADE CONSTRAINTS;
--DROP TABLE project CASCADE CONSTRAINTS;
--DROP TABLE works_on CASCADE CONSTRAINTS;
--Taylor Wilcox, Kyle Williams, Jordan Sumner;
CREATE TABLE Actors (
  fname    varchar2(15) not null, 
  lname    varchar2(15) not null,
  BaconNo      char(6) not null,
  Networth    number(9),
  Awards  varchar2(42),
  primary key (BaconNo),
  foreign key (Awards) references Awards(award)
  
);

CREATE TABLE Movies (
  Title        varchar2(25) not null,
  Director      number(4) not null,
  YearReleased char(9) not null, 
  Runtime number(4),
  Rating varchar2(5),
  Budget number(10),
  Revenue number (15),
  Writer varchar(25),
  Awards varchar2(100),
  
  primary key (Title,Director,YearReleased)

);

CREATE TABLE FilmStudio (
  StudioID  char(25) not null,
  Name      number(4) not null,
  CEO       varchar2(15) not null, 
  YearFounded date(YYYY),
  Location varchar(25),
  primary key (StudioID,Location)

);

CREATE TABLE ProductionCompany (
  CompanyID varchar2(25) not null,
  Name      number(4) not null,
  CEO       char(9) not null, 
  YearFounded date(YYYY),
  Headquarters char(),
  primary key (CompanyID,Headquarters)

);


CREATE TABLE FilmStudioLocation (
  StudioID   number(4),
  sLocation varchar2(15), 
  primary key (StudioID,sLocation),
  foreign key (StudioID) references FilmStudio(StudioID),
  foreign key (Location) references FilmStudio(Locationof)

);

CREATE TABLE ActorAwards (
  Fname   number(4) not null,
  Lname varchar2(15) not null, 
  AwardName varchar2(42),
  YearAwarded date(YYYY),
  primary key (Fname, Lname, AwardName, YearAwarded),
  foreign key (Fname) references Actor(Fname),
  foreign key (Lname) references Actor(Lname)

);

CREATE TABLE ActsIn (
  Fname   number(4) not null,
  Lname varchar2(15) not null, 
  Title not null,
  Yearacted date(YYYY),
  primary key (Fname, Lname, Title, Yearacted),
  foreign key (Fname) references Actor(Fname),
  foreign key (Lname) references Actor(Lname)

);

CREATE TABLE Creates (
  StudioID   number(4) not null,
  YrReleased date(YYYY) not null, 
  Title not null,
  primary key (Title, YrReleased, Title),
  foreign key (StudioID) references FilmStudio(StudioID),
  foreign key (Title) references Movie(Title)

);

CREATE TABLE project (
  pname      varchar2(25) not null,
  pnumber    number(4) not null,
  plocation  varchar2(15) not null,
  dnum       number(4) not null,
  primary key (pnumber),
  unique (pname),
  foreign key (dnum) references department(dnumber)

);

CREATE TABLE MovieAwards (
  Title   char(9) not null,
  AwardName    number(4),
  Yearawarded  date(YYYY),
  primary key (Title,AwardName,Yearawarded),
  foreign key (Title) references Movies(Title),

);

CREATE TABLE WorksFor (
  Fname   number(4) not null,
  Lname varchar2(15) not null, 
  StudioID not null,
  primary key (Fname, Lname, StudioID),
  foreign key (Fname) references Actor(Fname),
  foreign key (Lname) references Actor(Lname),
  foreign key (StudioID) references FilmStudio(StudioID)

);

CREATE TABLE MovieWriters (
  Fname   number(4) not null,
  Lname varchar2(15) not null, 
  Title not null,
  Yr date(YYYY),
  primary key (Fname, Lname, Title, Yr),
  foreign key (Title) references Movies(Title)

);

CREATE TABLE Produces (
  CompanyID   number(4) not null,
  Title varchar2(15) not null, 
  primary key (CompanyID, Title),
  foreign key (CompanyID) references Company(CompanyID),
  foreign key (Title) references Movies(Title)

);  

CREATE TABLE Pays (
  CompanyID   number(4) not null,
  StudioID varchar2(15) not null, 
  primary key (CompanyID, StudioID),
  foreign key (CompanyID) references Company(CompanyID),
  foreign key (StudioID) references FilmStudio(StudioID)

);