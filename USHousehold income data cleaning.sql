SELECT *
FROM ushouseholdincome;


SELECT Id, COUNT(Id)
FROM ushouseholdincome
GROUP BY ID 
HAVING COUNT(Id) > 1;

SELECT * 
FROM
(SELECT Row_id,
Id,
ROW_NUMBER() OVER(PARTITION BY Id ORDER BY Id) Row_Num
FROM ushouseholdincome) AS Duplicates
WHERE Row_Num > 1;

DELETE FROM ushouseholdincome
WHERE Row_id IN(
	SELECT Row_id
	FROM
	(SELECT Row_id,
	Id,
	ROW_NUMBER() OVER(PARTITION BY Id ORDER BY Id) Row_Num
	FROM ushouseholdincome) AS Duplicates
	WHERE Row_Num > 1);


SELECT State_Name, COUNT( State_Name)
FROM ushouseholdincome
GROUP BY  State_Name;

UPDATE ushouseholdincome
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

UPDATE ushouseholdincome
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

SELECT DISTINCT State_ab
FROM ushouseholdincome
ORDER BY 1;


SELECT * 
FROM ushouseholdincome
WHERE Place = '';


SELECT * 
FROM ushouseholdincome
WHERE County = 'Autauga County';

UPDATE ushouseholdincome
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT Type, COUNT(Type)
FROM ushouseholdincome
GROUP BY  Type;


UPDATE ushouseholdincome
SET `Type` = 'CDP'
WHERE `Type` = 'CPD';

UPDATE ushouseholdincome
SET `Type` = 'Borough'
WHERE `Type` = 'Boroughs';

SELECT ALand, AWater
FROM ushouseholdincome
WHERE (ALand = 0 OR ALand = '' OR ALand IS NULL)
AND	(AWater = 0 OR AWater = '' OR AWater IS NULL);