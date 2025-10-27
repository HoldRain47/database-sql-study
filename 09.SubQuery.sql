USE world;

-- 서울 인구
SELECT Population FROM city WHERE Name = 'SEOUL';

-- 서울 인구보다 많은 도시
SELECT
	*
FROM city
WHERE Population > (SELECT Population FROM city WHERE Name = 'SEOUL');




SELECT
	Name, Population
FROM country
WHERE Population > (SELECT AVG(Population) FROM country)
ORDER BY Population DESC;





SELECT Code FROM country WHERE Continent = 'Asia';

SELECT
	Name, CountryCode, Population
FROM city
WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia');


SELECT DISTINCT CountryCode FROM city;

SELECT
	*
FROM country
WHERE Code NOT IN (SELECT DISTINCT CountryCode FROM city);





SELECT *
FROM (
	SELECT Continent, COUNT(*) AS co_count
    FROM country 
    GROUP BY Continent
) AS continent_table
WHERE co_count > 40;
