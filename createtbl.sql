-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

CREATE TABLE Category
(
    cname       VARCHAR(30) NOT NULL,
    prioritynum INTEGER     NOT NULL,
    PRIMARY KEY (cname)
);

CREATE TABLE Person
(
    hinsurnum  INTEGER     NOT NULL,
    personname VARCHAR(20) NOT NULL,
    gender     VARCHAR(20) NOT NULL,
    dob        DATE        NOT NULL,
    phonenum   BIGINT     NOT NULL,
    city       VARCHAR(20) NOT NULL,
    postalcode VARCHAR(20) NOT NULL,
    streetaddr VARCHAR(20) NOT NULL,
    regdate    DATE        NOT NULL,
    cname      VARCHAR(30) NOT NULL,
    PRIMARY KEY (hinsurnum),
    FOREIGN KEY (cname) REFERENCES Category (cname)
);

CREATE TABLE Vaccine
(
    vname      VARCHAR(20) NOT NULL,
    waitperiod INTEGER,
    numdoses   INTEGER     NOT NULL,
    PRIMARY KEY (vname)
);

CREATE TABLE VaccLocation
(
    locationname VARCHAR(20) NOT NULL,
    lcity        VARCHAR(20) NOT NULL,
    lpostalcode  VARCHAR(20) NOT NULL,
    lstreetaddr  VARCHAR(20) NOT NULL,
    PRIMARY KEY (locationname)
);

CREATE TABLE VaccineBatch
(
    vname        VARCHAR(20) NOT NULL,
    batchnum     INTEGER     NOT NULL,
    mfgdate      DATE        NOT NULL,
    expirydate   DATE        NOT NULL,
    numvial      INTEGER     NOT NULL,
    locationname VARCHAR(20) NOT NULL,
    PRIMARY KEY (vname, batchnum),
    FOREIGN KEY (vname) REFERENCES Vaccine (vname),
    FOREIGN KEY (locationname) REFERENCES VaccLocation (locationname),
    CHECK(mfgdate < expirydate)
);

CREATE TABLE Vial
(
    vname    VARCHAR(20) NOT NULL,
    batchnum INTEGER     NOT NULL,
    vialid   INTEGER     NOT NULL,
    PRIMARY KEY (vname, batchnum, vialid),
    FOREIGN KEY (vname, batchnum) REFERENCES VaccineBatch (vname, batchnum)
);

CREATE TABLE Hospital
(
    locationname VARCHAR(20) NOT NULL,
    PRIMARY KEY (locationname),
    FOREIGN KEY (locationname) REFERENCES VaccLocation (locationname)
);

CREATE TABLE Nurse
(
    cnln         INTEGER     NOT NULL,
    nursename    VARCHAR(20) NOT NULL,
    locationname VARCHAR(20) NOT NULL,
    PRIMARY KEY (cnln),
    FOREIGN KEY (locationname) REFERENCES Hospital (locationname)
);

CREATE TABLE VaccDates
(
    locationname VARCHAR(20) NOT NULL,
    vdate        DATE        NOT NULL,
    PRIMARY KEY (locationname, vdate),
    FOREIGN KEY (locationname) REFERENCES VaccLocation (locationname)
);

CREATE TABLE VaccSlot
(
    locationname VARCHAR(20) NOT NULL,
    vdate        DATE        NOT NULL,
    vtime        TIME        NOT NULL,
    vslot        INTEGER     NOT NULL,
    hinsurnum    INTEGER,
    asgndate     DATE,
    cnln         INTEGER,
    vname        VARCHAR(20),
    batchnum     INTEGER,
    vialid       INTEGER,
    PRIMARY KEY (locationname, vdate, vtime, vslot),
    FOREIGN KEY (locationname, vdate) REFERENCES VaccDates (locationname, vdate),
    FOREIGN KEY (cnln) REFERENCES Nurse (cnln),
    FOREIGN KEY (hinsurnum) REFERENCES Person (hinsurnum),
    FOREIGN KEY (vname, batchnum, vialid) REFERENCES Vial (vname, batchnum, vialid)
)
;

CREATE TABLE NurseAssignments
(
    cnln         INTEGER     NOT NULL,
    locationname VARCHAR(20) NOT NULL,
    vdate        DATE        NOT NULL,
    PRIMARY KEY (cnln, locationname, vdate),
    FOREIGN KEY (cnln) REFERENCES Nurse (cnln),
    FOREIGN KEY (locationname, vdate) REFERENCES VaccDates (locationname, vdate)
)
;

