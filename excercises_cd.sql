--bookings
SELECT * FROM cd.bookings LIMIT 10;
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
	WHERE starttime BETWEEN '2012-09-01' AND '2012-10-1'
	GROUP BY facid
	ORDER BY SUM(slots);
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
	GROUP BY facid
	HAVING SUM(slots) > 1000
	ORDER BY facid;
--facilities
SELECT * FROM cd.facilities LIMIT 10;
SELECT name, membercost FROM cd.facilities;
SELECT name, membercost FROM cd.facilities
	WHERE membercost > 0;
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
	WHERE membercost > 0 AND membercost < (monthlymaintenance/50);
SELECT name FROM cd.facilities
	WHERE name LIKE '%Tennis%';
SELECT * FROM cd.facilities
	WHERE facid IN (1,5);
SELECT COUNT(facid) FROM cd.facilities
	WHERE guestcost >= 10;
--members
SELECT * FROM cd.members LIMIT 10;
SELECT * FROM cd.members
	WHERE joindate > '2012-09-01';
SELECT DISTINCT(surname) FROM cd.members
	ORDER BY surname
	LIMIT 10;
SELECT joindate FROM cd.members
	ORDER BY joindate DESC
	LIMIT 1;
SELECT MAX(joindate) FROM cd.members;
--JOIN
--bookings, facilities
SELECT starttime, book.facid, name FROM cd.bookings AS book
	JOIN cd.facilities AS fac
	ON book.facid = fac.facid
	WHERE DATE (starttime) = '2012-09-21' AND name LIKE '%Tennis Court%'
	ORDER BY starttime;
SELECT starttime, book.facid, name FROM cd.bookings AS book
	JOIN cd.facilities AS fac
	ON book.facid = fac.facid
	WHERE name LIKE '%Tennis Court%'
	AND (starttime >= '2012-09-21' AND starttime < '2012-09-22')
	ORDER BY starttime;
--bookings, members
SELECT starttime FROM cd.bookings AS book
	JOIN cd.members AS mem
	ON book.memid = mem.memid
	WHERE firstname = 'David' AND surname = 'Farrell';