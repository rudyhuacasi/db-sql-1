
1. Selezionare tutti gli studenti nati nel 1990 (160):

SELECT
    *
FROM
    `students`
WHERE
    YEAR(`date_of_birth`) = 1990;

2. Selezionare tutti i corsi che valgono più di 10 crediti (479):

SELECT
    *
FROM
    `courses`
WHERE
    `cfu` > 10;

3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT
    `name`,
    `date_of_birth`,
    TIMESTAMPDIFF(
        YEAR,
        `date_of_birth`,
        `enrolment_date`
    )AS `age`
FROM
    `students`;

4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286):

SELECT
    courses.degree_id,
    courses.period,
    courses.year
FROM
    `courses`
WHERE
    courses.period = 'I semestre' AND courses.year = 1;

--(284)
-- SELECT
-- 	degrees.department_id
--     degrees.name,
--     courses.period,
--     courses.year
-- FROM
--     `courses`
--     JOIN degrees ON courses.degree_id = degrees.department_id
-- WHERE
--     courses.period = 'I semestre' AND courses.year = 1; 

5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT
    `course_id`,
    `date`,
    `hour`
FROM
    `exams`
WHERE
    `hour` > '14:00:00' AND `date` = '2020/06/20';

6. Selezionare tutti i corsi di laurea magistrale (38):

SELECT
    *
FROM
    `degrees`
WHERE
    `level` = 'magistrale';

7. Da quanti dipartimenti è composta l'università? (12):

SELECT
    *
FROM
    `departments`;

8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50):

SELECT
    *
FROM
    `teachers`
WHERE
    `phone` IS NULL;

9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo
degree_id, inserire un valore casuale):

INSERT INTO students (degree_id, name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email)
VALUES (
    FLOOR(RAND() * 10) + 1,  
    'RUDYX',
    'CHAMBI',
    '2004-01-15',
    'RSSMRA00A01H123B',
    '2024-07-07',
    '2024001',
    'RUDY@GMAIL.COM'
);


10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126:

UPDATE teachers
SET office_number = '126'
WHERE name = 'Pietro';

11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9:

DELETE FROM students WHERE id = 5004;
