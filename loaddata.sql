-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- Category -------------------------------------------------------------
INSERT INTO Category
VALUES ('Health Care Workers', 1);
INSERT INTO Category
VALUES ('Elderly (>=65)', 1);
INSERT INTO Category
VALUES ('Teachers', 2);
INSERT INTO Category
VALUES ('Essential Service Workers', 3);
INSERT INTO Category
VALUES ('Everybody else', 4);

-- Person -------------------------------------------------------------
-- 4b
INSERT INTO Person
VALUES (123, 'Jane Doe', 'F', '1998-02-11', 2, 'Montreal', 'H2X', 'Jeanne-Mance', '2021-01-05', 'Everybody else');
-- 4c
INSERT INTO Person
VALUES (122, 'John Abbott', 'M', '1998-10-12', 5147128888, 'Laval', 'H2Y', 'Wasta', '2021-01-10',
        'Health Care Workers');
-- 4d
INSERT INTO Person
VALUES (421, 'Emily Moon', 'F', '1997-11-02', 5147129999, 'Montreal', 'H2Z', 'Bingo', '2021-01-04', 'Teachers');
-- 4e
INSERT INTO Person
VALUES (754, 'Jackie Chan', 'M', '1980-05-27', 5147126666, 'Montreal', 'H2A', 'Repo', '2021-01-05',
        'Essential Service Workers');
-- 4d2
INSERT INTO Person
VALUES (912, 'Arman Key', 'M', '1997-03-22', 5147124444, 'Montreal', 'H2K', 'Algo', '2021-01-02', 'Teachers');
-- 5
INSERT INTO Person
VALUES (444, 'Omar Noor', 'M', '1998-10-04', 5147121111, 'Montreal', 'H2L', 'Stanley', '2021-01-01',
        'Essential Service Workers');
-- Vaccine -------------------------------------------------------------
-- 4b
INSERT INTO Vaccine
VALUES ('Moderna', NULL, 1);
-- 4c
INSERT INTO Vaccine
VALUES ('AstraZeneca', 7, 2);
--4d/d2
INSERT INTO Vaccine
VALUES ('Pfizer-BioNTech', 10, 2);
-- 4e
INSERT INTO Vaccine
VALUES ('Novavax', 5, 2);
--
INSERT INTO Vaccine
VALUES ('Uno', 14, 2);
-- VaccLocation -------------------------------------------------------------
-- 4a
INSERT INTO VaccLocation
VALUES ('Jewish General', 'Montreal', 'H3T', 'Chemin');
-- 4b
INSERT INTO VaccLocation
VALUES ('McGill', 'Montreal', 'H3U', 'Decarie');
-- 4c
INSERT INTO VaccLocation
VALUES ('Pardon', 'Laval', 'H3V', 'Regard');
--4d/d2
INSERT INTO VaccLocation
VALUES ('Bigtie', 'Montreal', 'H3A', 'Shrap');
-- 4e
INSERT INTO VaccLocation
VALUES ('Hippo', 'Montreal', 'H3B', 'Grono');
-- VaccineBatch -------------------------------------------------------------
-- 4b
INSERT INTO VaccineBatch
VALUES ('Moderna', 1, '2020-01-01', '2020-02-10', 2, 'McGill');
-- 4c
INSERT INTO VaccineBatch
VALUES ('AstraZeneca', 1, '2020-01-02', '2020-02-11', 2, 'Pardon');
-- 4d
INSERT INTO VaccineBatch
VALUES ('Pfizer-BioNTech', 1, '2020-01-03', '2020-02-12', 2, 'Bigtie');
-- 4e
INSERT INTO VaccineBatch
VALUES ('Novavax', 1, '2020-01-15', '2020-03-12', 2, 'Hippo');
-- 4d2
INSERT INTO VaccineBatch
VALUES ('Pfizer-BioNTech', 2, '2020-01-04', '2020-02-13', 2, 'Bigtie');
-- Vial -------------------------------------------------------------
-- 4b
INSERT INTO Vial
VALUES ('Moderna', 1, 1);
-- 4c
INSERT INTO Vial
VALUES ('AstraZeneca', 1, 1);
-- 4d
INSERT INTO Vial
VALUES ('Pfizer-BioNTech', 1, 1);
-- 4d2
INSERT INTO Vial
VALUES ('Pfizer-BioNTech', 2, 1);
-- 4d2
INSERT INTO Vial
VALUES ('Pfizer-BioNTech', 2, 2);
-- 5
INSERT INTO Vial
VALUES ('Novavax', 1, 1);
-- Hospital -------------------------------------------------------------
-- 4a
INSERT INTO Hospital
VALUES ('Jewish General');
-- 4b
INSERT INTO Hospital
VALUES ('McGill');
-- 4c
INSERT INTO Hospital
VALUES ('Pardon');
-- 4d/d2
INSERT INTO Hospital
VALUES ('Bigtie');
-- 4e
INSERT INTO Hospital
VALUES ('Hippo');
-- Nurse -------------------------------------------------------------
-- 4b
INSERT INTO Nurse
VALUES (3415, 'Alexa Watts', 'McGill');
-- 4c
INSERT INTO Nurse
VALUES (7182, 'Samantha Walker', 'Pardon');
-- 4d
INSERT INTO Nurse
VALUES (4321, 'Julia Roberts', 'Bigtie');
-- 4e
INSERT INTO Nurse
VALUES (9631, 'Raj Kumar', 'Hippo');
-- 4d2
INSERT INTO Nurse
VALUES (6666, 'Ramo Harris', 'Bigtie');
-- 4d2
INSERT INTO Nurse
VALUES (7477, 'Kamala Harris', 'Bigtie');
-- 5
INSERT INTO Nurse
VALUES (8492, 'Boogie Bo', 'Jewish General');
-- VaccDates -------------------------------------------------------------
-- 4a
INSERT INTO VaccDates
Values ('Jewish General', '2021-03-20');
-- 4b
INSERT INTO VaccDates
Values ('McGill', '2021-02-06');
-- 4c
INSERT INTO VaccDates
Values ('Pardon', '2021-02-06');
-- 4d
INSERT INTO VaccDates
Values ('Bigtie', '2021-01-25');
-- 4e
INSERT INTO VaccDates
Values ('Hippo', '2021-02-03');
-- 4d2
INSERT INTO VaccDates
Values ('Bigtie', '2021-01-19');
-- 4d2
INSERT INTO VaccDates
Values ('Bigtie', '2021-01-29');
-- 5
INSERT INTO VaccDates
Values ('McGill', '2021-01-30');
-- VaccSlot -------------------------------------------------------------
-- 4a
INSERT INTO VaccSlot
VALUES ('Jewish General', '2021-03-20', '12:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL);
-- 4b
INSERT INTO VaccSlot
VALUES ('McGill', '2021-02-06', '13:00:00', 1, 123, '2021-02-02', 3415, 'Moderna', 1, 1);
-- 4c
INSERT INTO VaccSlot
VALUES ('Pardon', '2021-02-06', '14:00:00', 1, 122, '2021-02-03', 7182, 'AstraZeneca', 1, 1);
-- 4d
INSERT INTO VaccSlot
VALUES ('Bigtie', '2021-01-25', '15:00:00', 1, 421, '2021-01-15', 4321, 'Pfizer-BioNTech', 1, 1);
-- 4e
INSERT INTO VaccSlot
VALUES ('Hippo', '2021-02-03', '16:00:00', 1, 754, '2021-01-26', NULL, NULL, NULL, NULL);
-- 4d2
INSERT INTO VaccSlot
VALUES ('Bigtie', '2021-01-19', '12:00:00', 1, 912, '2021-01-11', 6666, 'Pfizer-BioNTech', 2, 1);
-- 4d2
INSERT INTO VaccSlot
VALUES ('Hippo', '2021-02-03', '13:00:00', 2, 912, '2021-01-11', 7477, 'Pfizer-BioNTech', 2, 2);
-- 5
INSERT INTO VaccSlot
VALUES ('McGill', '2021-01-30', '11:00:00', 3, 444, '2021-01-10', 3415, 'Novavax', 1, 1);

-- Nurse Assignments -------------------------------------------------------------
-- 4b
INSERT INTO NurseAssignments
VALUES (3415, 'McGill', '2021-02-06');
-- 4c
INSERT INTO NurseAssignments
VALUES (7182, 'Pardon', '2021-02-06');
-- 4d
INSERT INTO NurseAssignments
VALUES (4321, 'Bigtie', '2021-01-25');
-- 4e
INSERT INTO NurseAssignments
VALUES (9631, 'Hippo', '2021-02-03');
-- 4d2
INSERT INTO NurseAssignments
VALUES (6666, 'Bigtie', '2021-01-19');
-- 4d2
INSERT INTO NurseAssignments
VALUES (7477, 'Bigtie', '2021-01-29');
-- 5
INSERT INTO NurseAssignments
VALUES (3415, 'McGill', '2021-01-30');

