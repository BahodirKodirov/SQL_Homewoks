Create database HW_Class_16
Use HW_Class_16


CREATE TABLE soccer_venue (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(255),
    city_id INT,
    aud_capacity INT
);

INSERT INTO soccer_venue (venue_id, venue_name, city_id, aud_capacity) VALUES
(20001, 'Stade de Bordeaux', 10003, 42115),
(20002, 'Stade Bollaert-Delelis', 10004, 38223),
(20003, 'Stade Pierre Mauroy', 10005, 49822),
(20004, 'Stade de Lyon', 10006, 58585),
(20005, 'Stade VElodrome', 10007, 64354),
(20006, 'Stade de Nice', 10008, 35624),
(20007, 'Parc des Princes', 10001, 47294),
(20008, 'Stade de France', 10002, 80100),
(20009, 'Stade Geoffroy Guichard', 10009, 42000),
(20010, 'Stadium de Toulouse', 10010, 33150);

CREATE TABLE soccer_city (
    city_id INT PRIMARY KEY,
    city VARCHAR(100),
    country_id INT
);

INSERT INTO soccer_city (city_id, city, country_id) VALUES
(10001, 'Paris', 1207),
(10002, 'Saint-Denis', 1207),
(10003, 'Bordeaux', 1207),
(10004, 'Lens', 1207),
(10005, 'Lille', 1207),
(10006, 'Lyon', 1207),
(10007, 'Marseille', 1207),
(10008, 'Nice', 1207),
(10009, 'Saint-Etienne', 1207),
(10010, 'Toulouse', 1207);

CREATE TABLE match_mast (
    match_no INT PRIMARY KEY,
    play_stage VARCHAR(1),
    play_date DATE,
    results VARCHAR(3),
    decided_by CHAR(1),
    goal_score VARCHAR(5),
    venue_id INT,
    referee_id INT,
    audence INT,
    plr_of_match INT,
    stop1_sec INT,
    stop2_sec INT
);

INSERT INTO match_mast (match_no, play_stage, play_date, results, decided_by, goal_score, venue_id, referee_id, audence, plr_of_match, stop1_sec, stop2_sec) VALUES
(1, 'G', '2016-06-11', 'WIN', 'N', '2-1', 20008, 70007, 75113, 160154, 131, 242),
(2, 'G', '2016-06-11', 'WIN', 'N', '0-1', 20002, 70012, 33805, 160476, 61, 182),
(3, 'G', '2016-06-11', 'WIN', 'N', '2-1', 20001, 70017, 37831, 160540, 64, 268),
(4, 'G', '2016-06-12', 'DRAW', 'N', '1-1', 20005, 70011, 62343, 160128, 0, 185),
(5, 'G', '2016-06-12', 'WIN', 'N', '0-1', 20007, 70006, 43842, 160084, 125, 325),
(6, 'G', '2016-06-12', 'WIN', 'N', '1-0', 20006, 70014, 33742, 160291, 2, 246),
(7, 'G', '2016-06-13', 'WIN', 'N', '2-0', 20003, 70002, 43035, 160176, 89, 188),
(8, 'G', '2016-06-13', 'WIN', 'N', '1-0', 20010, 70009, 29400, 160429, 360, 182),
(9, 'G', '2016-06-13', 'DRAW', 'N', '1-1', 20008, 70010, 73419, 160335, 67, 194),
(10, 'G', '2016-06-14', 'WIN', 'N', '0-2', 20004, 70005, 55408, 160244, 63, 189),
(11, 'G', '2016-06-14', 'WIN', 'N', '0-2', 20001, 70018, 34424, 160197, 61, 305),
(12, 'G', '2016-06-15', 'DRAW', 'N', '1-1', 20009, 70004, 38742, 160320, 15, 284),
(13, 'G', '2016-06-15', 'WIN', 'N', '1-2', 20003, 70001, 38989, 160405, 62, 189),
(14, 'G', '2016-06-15', 'DRAW', 'N', '1-1', 20007, 70015, 43576, 160477, 74, 206),
(15, 'G', '2016-06-16', 'WIN', 'N', '2-0', 20005, 70013, 63670, 160154, 71, 374),
(16, 'G', '2016-06-16', 'WIN', 'N', '2-1', 20002, 70003, 34033, 160540, 62, 212),
(17, 'G', '2016-06-16', 'WIN', 'N', '0-2', 20004, 70016, 51043, 160262, 7, 411),
(18, 'G', '2016-06-17', 'DRAW', 'N', '0-0', 20008, 70008, 73648, 160165, 6, 208),
(19, 'G', '2016-06-17', 'WIN', 'N', '1-0', 20010, 70007, 29600, 160248, 2, 264),
(20, 'G', '2016-06-17', 'DRAW', 'N', '2-2', 20009, 70005, 38376, 160086, 71, 280),
(21, 'G', '2016-06-18', 'WIN', 'N', '3-0', 20006, 70010, 33409, 160429, 84, 120),
(22, 'G', '2016-06-18', 'WIN', 'N', '3-0', 20001, 70004, 39493, 160064, 11, 180),
(23, 'G', '2016-06-18', 'DRAW', 'N', '1-1', 20005, 70015, 60842, 160230, 61, 280),
(24, 'G', '2016-06-19', 'DRAW', 'N', '0-0', 20007, 70011, 44291, 160314, 3, 200),
(25, 'G', '2016-06-20', 'WIN', 'N', '0-1', 20004, 70016, 49752, 160005, 125, 328),
(26, 'G', '2016-06-20', 'DRAW', 'N', '0-0', 20003, 70001, 45616, 160463, 60, 122),
(27, 'G', '2016-06-21', 'WIN', 'N', '0-3', 20010, 70006, 28840, 160544, 62, 119),
(28, 'G', '2016-06-21', 'DRAW', 'N', '0-0', 20009, 70012, 39051, 160392, 62, 301),
(29, 'G', '2016-06-21', 'WIN', 'N', '0-1', 20005, 70017, 58874, 160520, 29, 244),
(30, 'G', '2016-06-21', 'WIN', 'N', '0-1', 20007, 70018, 44125, 160177, 21, 195),
(31, 'G', '2016-06-22', 'WIN', 'N', '0-2', 20002, 70013, 32836, 160504, 60, 300),
(32, 'G', '2016-06-22', 'WIN', 'N', '2-1', 20001, 70008, 37245, 160085, 70, 282),
(33, 'G', '2016-06-22', 'WIN', 'N', '2-1', 20008, 70009, 68714, 160220, 7, 244),
(34, 'G', '2016-06-22', 'DRAW', 'N', '3-3', 20004, 70002, 55514, 160322, 70, 185),
(35, 'G', '2016-06-23', 'WIN', 'N', '0-1', 20003, 70014, 44268, 160333, 79, 221),
(36, 'G', '2016-06-23', 'WIN', 'N', '0-1', 20006, 70003, 34011, 160062, 63, 195),
(37, 'R', '2016-06-25', 'WIN', 'P', '1-1', 20009, 70005, 38842, 160476, 126, 243),
(38, 'R', '2016-06-25', 'WIN', 'N', '1-0', 20007, 70002, 44342, 160547, 5, 245),
(39, 'R', '2016-06-26', 'WIN', 'N', '0-1', 20002, 70012, 33523, 160316, 61, 198),
(40, 'R', '2016-06-26', 'WIN', 'N', '2-1', 20004, 70011, 56279, 160160, 238, 203),
(41, 'R', '2016-06-26', 'WIN', 'N', '3-0', 20003, 70009, 44312, 160173, 62, 124),
(42, 'R', '2016-06-27', 'WIN', 'N', '0-4', 20010, 70010, 28921, 160062, 3, 133),
(43, 'R', '2016-06-27', 'WIN', 'N', '2-0', 20008, 70004, 76165, 160235, 63, 243),
(44, 'R', '2016-06-28', 'WIN', 'N', '1-2', 20006, 70001, 33901, 160217, 5, 199),
(45, 'Q', '2016-07-01', 'WIN', 'P', '1-1', 20005, 70003, 62940, 160316, 58, 181),
(46, 'Q', '2016-07-02', 'WIN', 'N', '3-1', 20003, 70001, 45936, 160550, 14, 182),
(47, 'Q', '2016-07-03', 'WIN', 'P', '1-1', 20001, 70007, 38764, 160163, 63, 181),
(48, 'Q', '2016-07-04', 'WIN', 'N', '5-2', 20008, 70008, 76833, 160159, 16, 125),
(49, 'S', '2016-07-07', 'WIN', 'N', '2-0', 20004, 70006, 55679, 160322, 2, 181),
(50, 'S', '2016-07-08', 'WIN', 'N', '2-0', 20005, 70011, 64078, 160160, 126, 275),
(51, 'F', '2016-07-11', 'WIN', 'N', '1-0', 20008, 70005, 75868, 160307, 161, 181);

--1
SELECT venue_name, city
FROM soccer_venue a
JOIN soccer_city b ON a.city_id=b.city_id
JOIN match_mast d ON d.venue_id=a.venue_id 
AND d.play_stage='F';

--2

SELECT match_no,country_name,goal_score
FROM match_details a
JOIN soccer_country b
ON a.team_id=b.country_id
WHERE decided_by='N'
ORDER BY match_no;

--3

SELECT player_name,count(*),country_name
FROM goal_details a
JOIN player_mast b ON a.player_id=b.player_id
JOIN soccer_country c ON a.team_id=c.country_id
WHERE goal_schedule = 'NT'
GROUP BY player_name,country_name
ORDER BY count(*) DESC;

--4
SELECT player_name,country_name,count(player_name)
FROM goal_details gd
JOIN player_mast pm ON gd.player_id =pm.player_id
JOIN soccer_country sc ON pm.team_id = sc.country_id
GROUP BY country_name,player_name HAVING COUNT(player_name) >= ALL
  (SELECT COUNT(player_name)
   FROM goal_details gd
   JOIN player_mast pm ON gd.player_id =pm.player_id
   JOIN soccer_country sc ON pm.team_id = sc.country_id
   GROUP BY country_name,player_name);

--5

SELECT player_name,jersey_no,country_name
FROM goal_details a
JOIN player_mast b ON a.player_id=b.player_id
JOIN soccer_country c ON a.team_id=c.country_id
WHERE play_stage='F';
--6
SELECT country_name
FROM soccer_country a
JOIN soccer_city b ON a.country_id=b.country_id
JOIN soccer_venue c ON b.city_id=c.city_id
GROUP BY country_name;
--7
SELECT b.referee_name, c.country_name 
FROM match_mast a
NATURAL JOIN referee_mast b 
NATURAL JOIN soccer_country c
WHERE match_no=1;
--8
SELECT b.referee_name, c.country_name 
FROM match_mast a
NATURAL JOIN referee_mast b 
NATURAL JOIN soccer_country c
WHERE match_no=1;
--9
SELECT b.referee_name, c.country_name 
FROM match_mast a
NATURAL JOIN referee_mast b 
NATURAL JOIN soccer_country c
WHERE play_stage='F';
--10
SELECT ass_ref_name, country_name 
FROM asst_referee_mast a
JOIN soccer_country b
ON a.country_id=b.country_id
JOIN match_details c
ON a.ass_ref_id=c.ass_ref
WHERE match_no=1;
--11
SELECT ass_ref_name, country_name 
FROM asst_referee_mast a
JOIN soccer_country b
ON a.country_id=b.country_id
JOIN match_details c
ON a.ass_ref_id=c.ass_ref
WHERE play_stage='F';
--12
SELECT a.venue_name, b.city
FROM soccer_venue a
JOIN soccer_city b ON a.city_id=b.city_id
JOIN match_mast c ON a.venue_id=c.venue_id
WHERE match_no=1;
--13
SELECT a.venue_name, b.city, a.aud_capacity, c.audence
FROM soccer_venue a
JOIN soccer_city b ON a.city_id=b.city_id
JOIN match_mast c ON a.venue_id=c.venue_id
WHERE play_stage='F';
--14
SELECT a.venue_name, b.city, count(c.match_no)
FROM soccer_venue a
JOIN soccer_city b ON a.city_id=b.city_id
JOIN match_mast c ON a.venue_id=c.venue_id
GROUP BY venue_name,city
ORDER BY venue_name;
--15
SELECT match_no, country_name, player_name, 
booking_time as "sent_off_time", play_schedule, jersey_no
FROM player_booked a
JOIN player_mast b
ON a.player_id=b.player_id
JOIN soccer_country c
ON a.team_id=c.country_id
AND  a.sent_off='Y'
AND match_no=(
	SELECT MIN(match_no) 
	from player_booked)
ORDER BY match_no,play_schedule,play_half,booking_time;
--16
SELECT country_name as "Team" ,team_group, goal_for
FROM soccer_team
JOIN soccer_country 
ON soccer_team.team_id=soccer_country.country_id
AND goal_for=1;
--17
SELECT country_name, COUNT(*)
FROM soccer_country 
JOIN player_booked
ON soccer_country.country_id=player_booked.team_id
GROUP BY country_name
ORDER BY COUNT(*) DESC;
--18
SELECT venue_name, count(venue_name)
FROM goal_details
JOIN soccer_country
ON goal_details.team_id=soccer_country.country_id
JOIN match_mast ON goal_details.match_no=match_mast.match_no
JOIN soccer_venue ON match_mast.venue_id=soccer_venue.venue_id
GROUP BY venue_name
ORDER BY COUNT(venue_name) DESC;
--19
SELECT match_details.match_no, soccer_country.country_name 
FROM match_mast
JOIN match_details 
ON match_mast.match_no=match_details.match_no
JOIN soccer_country
ON match_details.team_id=soccer_country.country_id
WHERE stop1_sec=0;
--20

SELECT country_name,team_group,match_played,
won,lost,goal_for,goal_agnst
FROM soccer_team 
JOIN soccer_country 
ON soccer_team.team_id=soccer_country.country_id
WHERE goal_agnst=(
SELECT MAX(goal_agnst) 
FROM soccer_team);
--21
SELECT match_details.match_no, soccer_country.country_name,
match_mast.stop2_sec as "Stoppage Time(sec.)" 
FROM match_mast
JOIN match_details 
ON match_mast.match_no=match_details.match_no
JOIN soccer_country
ON match_details.team_id=soccer_country.country_id
WHERE stop2_sec IN (
SELECT MAX(stop2_sec) 
FROM match_mast);
--22
SELECT a.match_no, c.country_name, a.stop2_sec
FROM match_mast a
JOIN match_details b ON a.match_no=b.match_no
JOIN soccer_country c ON b.team_id=c.country_id
WHERE (2-1) = (
SELECT COUNT(DISTINCT(b.stop2_sec))
FROM match_mast b
WHERE b.stop2_sec > a.stop2_sec);
--23
SELECT a.match_no, c.country_name, a.stop2_sec
FROM match_mast a
JOIN match_details b ON a.match_no=b.match_no
JOIN soccer_country c ON b.team_id=c.country_id
WHERE (2-1) = (
SELECT COUNT(DISTINCT(b.stop2_sec))
FROM match_mast b
WHERE b.stop2_sec > a.stop2_sec);
--24
SELECT b.country_name,c.player_name,COUNT(a.player_gk) count_gk
FROM match_details a
JOIN soccer_country b ON a.team_id=b.country_id
JOIN player_mast c ON a.player_gk=c.player_id
GROUP BY b.country_name,c.player_name
ORDER BY country_name,player_name,count_gk DESC;
--25
SELECT venue_name, count(venue_name)
FROM goal_details
JOIN soccer_country
ON goal_details.team_id=soccer_country.country_id
JOIN match_mast ON goal_details.match_no=match_mast.match_no
JOIN soccer_venue ON match_mast.venue_id=soccer_venue.venue_id
GROUP BY venue_name
HAVING COUNT (venue_name)=( 
SELECT MAX(mycount) 
FROM ( 
SELECT venue_name, COUNT(venue_name) mycount
FROM goal_details
JOIN soccer_country
ON goal_details.team_id=soccer_country.country_id
JOIN match_mast ON goal_details.match_no=match_mast.match_no
JOIN soccer_venue ON match_mast.venue_id=soccer_venue.venue_id
GROUP BY venue_name) gd);
--26
SELECT a.country_name,b.player_name,b.jersey_no,b.age 
FROM soccer_country a
JOIN player_mast b 
ON a.country_id=b.team_id
WHERE b.age IN (
SELECT MAX(age) 
FROM player_mast);
--27
SELECT match_no,country_name
FROM match_details a
JOIN soccer_country b
ON a.team_id=b.country_id
WHERE goal_score=3  AND win_lose='D';
--28
SELECT a.country_name as Team , b.team_group,b.match_played, 
b.goal_agnst, b.group_position 
FROM soccer_country a
JOIN soccer_team b
ON a.country_id=b.team_id
WHERE goal_agnst=4 AND group_position=4
ORDER BY team_group;
--29
SELECT a.player_name, a.jersey_no, a.posi_to_play, a.age, b.country_name
FROM player_mast a 
JOIN soccer_country b
ON a.team_id=b.country_id
WHERE a.playing_club='Lyon'
AND a.team_id IN (
SELECT b.country_id 
FROM soccer_country b
WHERE b.country_id IN (
SELECT c.team_id 
FROM match_details c 
WHERE c.play_stage='F'
));
--30
SELECT country_name
FROM match_details a
JOIN soccer_country b
ON a.team_id=b.country_id
WHERE play_stage='S';
--31
SELECT country_name, player_name, jersey_no, posi_to_play 
FROM match_captain a
JOIN soccer_country b ON a.team_id=b.country_id
JOIN player_mast c ON a.player_captain=c.player_id
WHERE match_no IN(48,49);