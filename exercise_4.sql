
/*
Задание 4 
Сделайте выборку при помощи вложенных запросов для таких заданий:
1) Получите контактные данные сотрудников (номера телефонов, место жительства). 
2) Получите информацию о дате рождения всех холостых сотрудников и их номера.
3) Получите информацию обо всех менеджерах компании: дату рождения и номер телефона. 
*/

USE MyJoinsDB;

SELECT *, (SELECT address FROM personal_data WHERE personal_data.person_id = general.id) AS address
 FROM general;


 SELECT (SELECT id FROM general WHERE personal_data.person_id = general.id) AS id,
 (SELECT name FROM general WHERE personal_data.person_id = general.id) AS name,
 birthday,
 (SELECT phone FROM general WHERE personal_data.person_id = general.id) AS phone
 FROM personal_data
 WHERE personal_data.status = 'free';
 
 
 SELECT (SELECT id FROM general WHERE staff.person_id = general.id) AS id,
		(SELECT name FROM general WHERE staff.person_id = general.id) AS name,
        (SELECT birthday FROM personal_data WHERE personal_data.person_id = staff.person_id) AS birthday,
        (SELECT phone FROM general WHERE staff.person_id = general.id) AS phone
        FROM staff
        WHERE staff.position = 'manager';
 
 
SELECT * FROM general;
SELECT * FROM staff;
SELECT * FROM personal_data;

