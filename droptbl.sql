-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references       < ------ WHY ?
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).


DROP TABLE NurseAssignments;
DROP TABLE VaccSlot;
DROP TABLE VaccDates;
DROP TABLE Nurse;
DROP TABLE Hospital;
DROP TABLE Vial;
DROP TABLE VaccineBatch;
DROP TABLE VaccLocation;
DROP TABLE Vaccine;
DROP TABLE Person;
DROP TABLE Category;

