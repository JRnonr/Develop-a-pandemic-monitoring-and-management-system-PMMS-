--         table creation script

CREATE TABLE `citizen`(
    `citizen_phone` VARCHAR(6) PRIMARY KEY,
    `name` VARCHAR(30),
    `sex` VARCHAR(6),
    `age` INT
); 

CREATE TABLE `district`(
    `district_name` VARCHAR(30) PRIMARY KEY,
    `region_name` VARCHAR(30),
    `risk_level` VARCHAR(4)
);

CREATE TABLE `hospital`(
    `name` VARCHAR(30),
    `doctor_name` VARCHAR(30) PRIMARY KEY,
    `district_name` VARCHAR(30),
    CONSTRAINT `have` FOREIGN KEY(`district_name`) REFERENCES `district`(`district_name`) ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE TABLE `sample`(
    `type_name` VARCHAR(255) PRIMARY KEY,
    `description` VARCHAR(255)
); 

CREATE TABLE `report`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `citizen_phone` VARCHAR(6),
    `sample_collect_time` DATETIME,
    `sample_test_time` DATETIME,
    `report_time` DATETIME,
    `sample_result` VARCHAR(8),
    `doctor_name` VARCHAR(30),
    `sample_type` VARCHAR(255),
    CONSTRAINT `conclude` FOREIGN KEY(`sample_type`) REFERENCES `sample`(`type_name`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `get` FOREIGN KEY(`citizen_phone`) REFERENCES `citizen`(`citizen_phone`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `give` FOREIGN KEY(`doctor_name`) REFERENCES `hospital`(`doctor_name`) ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE TABLE `GPS`(
    `gps` VARCHAR(15) PRIMARY KEY,
   `latitude` varchar(6),
  `longitude` varchar(7),
  `district_name` varchar(30),
  CONSTRAINT `store` FOREIGN KEY (`district_name`) REFERENCES `district` (`district_name`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `tracking_information`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `citizen_phone` VARCHAR(6),
    `time_enter` DATETIME,
    `time_leave` DATETIME,
    `district_name` VARCHAR(30),
    CONSTRAINT `provide` FOREIGN KEY(`citizen_phone`) REFERENCES `citizen`(`citizen_phone`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `collect` FOREIGN KEY(`district_name`) REFERENCES `district`(`district_name`) ON DELETE CASCADE ON UPDATE CASCADE
);


--         Important use cases
--  !!! both test data and SELECT statements are needed
-- use case 1

INSERT INTO `citizen` (citizen_phone, name, sex, age)
VALUES ('137928', 'Amorn', 'female', 33),
('233636', 'Mark', 'male', 22),
('264639', 'Harry', 'male', 22),
('362849', 'Dobby', 'female', 44),
('362946', 'Albus', 'male', 57),
('363846', 'Lily', 'female', 35),
('372937', 'Dean', 'male', 29),
('374529', 'Heimione', 'female', 28),
('384027', 'Snape', 'male', 38),
('472072', 'Ron', 'male', 17),
('492720', 'Luna', 'female', 20),
('846292', 'Emily', 'female', 30),
('856436', 'Jseph', 'female', 62),
('976590', 'Antony', 'male', 15),
('986754', 'Patton', 'male', 52);

INSERT INTO `tracking_information` (id, citizen_phone, time_enter, time_leave, district_name)
VALUES 
(1, '137928', '2021-10-02 20:56:32', '2021-10-19 18:00:10', 'Centre Lukewarm Hillside'),
(2, '233636', '2021-10-05 19:07:22', '2021-10-07 21:08:35', 'Massa '),
(3, '233636', '2021-10-07 22:16:38', '2021-11-22 21:26:08', 'Lenny town'),
(4, '264639', '2021-10-02 17:17:51', '2021-12-22 15:18:18', 'Johns'),
(5, '362849', '2021-10-02 21:25:15', '2021-10-27 21:25:21', 'Cleveland '),
(6, '362946', '2021-10-03 09:28:17', '2021-10-27 14:15:38', 'Toronto'),
(7, '363846', '2021-10-01 21:31:23', '2021-12-02 21:31:28', 'Bunny Tail district'),
(8, '372937', '2021-09-29 19:32:07', '2021-10-21 21:32:16', 'Singapore'),
(9, '374529', '2021-10-02 21:33:11', '2021-10-27 09:33:29', 'Lenny town'),
(10, '384027', '2021-10-04 21:34:17', '2022-10-20 07:24:27', 'Singapore'),
(11, '472072', '2021-09-27 08:44:12', '2021-10-07 09:00:26', 'Massa '),
(12, '472072', '2021-10-07 11:36:52', '2021-12-05 16:37:07', 'Bunny Tail district'),
(13, '492720', '2021-09-20 21:37:42', '2021-12-01 17:55:56', 'Lenny town'),
(14, '846292', '2021-10-01 09:38:44', '2021-10-20 13:11:52', 'Centre Lukewarm Hillside'),
(15, '856436', '2021-10-01 05:37:16', '2021-10-24 18:41:34', 'King'),
(16, '976590', '2021-09-29 21:42:05', '2021-10-10 08:42:07', 'Raspberry town'),
(17, '986754', '2021-10-06 21:42:49', '2021-12-13 21:43:12', 'Glow Sand district');

INSERT INTO `GPS` (gps, longitude, latitude, district_name)
VALUES 
('112:33E 37:51N', '37:51N', '112:33E', 'Bunny Tail district'),
('112:55E 28:12N', '28:12N', '112:55E', 'Centre Lukewarm Hillside'),
('113:13E 40:07N', '40:07N', '113:13E', 'Cleveland '),
('113:18E 23:10N', '23:10N', '113:18E', 'Glow Sand district'),
('114:26E 38:03N', '38:03N', '114:26E', 'Johns'),
('114:55E 40:51N', '40:51N', '114:55E', 'King'),
('115:28E 38:53N', '38:53N', '115:28E', 'Lausa'),
('116:28E 39:54N', '39:54N', '116:28E', 'Lenny town'),
('117:10E 39:10N', '39:10N', '117:10E', 'Massa '),
('117:52E 40:59N', '40:59N', '117:52E', 'Raspberry town'),
('118:09E 39:37N', '39:37N', '118:09E', 'Singapore'),
('119:37E 39:54N', '39:54N', '119:37E', 'Toronto');

SELECT DISTINCT
    citizen.citizen_phone
FROM
    citizen
JOIN tracking_information ON citizen.citizen_phone = tracking_information.citizen_phone
JOIN GPS ON tracking_information.district_name = GPS.district_name
WHERE
    tracking_information.time_enter >= '2021-10-07 19:30:00' OR tracking_information.time_leave <= '2021-10-09 19:30:00' AND GPS.district_name IN(
    SELECT
        district_name
    FROM
        tracking_information
    WHERE
        citizen_phone = '233636' AND time_enter >= '2021-10-07 19:30:00' OR time_leave <= '2021-10-09 19:30:00'
);

-- use case 2

INSERT INTO `GPS` (gps, longitude, latitude, district_name)
VALUES 
('112:33E 37:51N', '37:51N', '112:33E', 'Bunny Tail district'),
('112:55E 28:12N', '28:12N', '112:55E', 'Centre Lukewarm Hillside'),
('113:13E 40:07N', '40:07N', '113:13E', 'Cleveland '),
('113:18E 23:10N', '23:10N', '113:18E', 'Glow Sand district'),
('114:26E 38:03N', '38:03N', '114:26E', 'Johns'),
('114:55E 40:51N', '40:51N', '114:55E', 'King'),
('115:28E 38:53N', '38:53N', '115:28E', 'Lausa'),
('116:28E 39:54N', '39:54N', '116:28E', 'Lenny town'),
('117:10E 39:10N', '39:10N', '117:10E', 'Massa '),
('117:52E 40:59N', '40:59N', '117:52E', 'Raspberry town'),
('118:09E 39:37N', '39:37N', '118:09E', 'Singapore'),
('119:37E 39:54N', '39:54N', '119:37E', 'Toronto');

-- use case 3
INSERT INTO `hospital` (name, doctor_name, district_name) 
VALUES 
('Lenny Hospital', 'Ada', 'Lenny town'),
('Bunny Tail Hospital', 'Andrew', 'Bunny Tail district'),
('Raspberry Hospital', 'Bill', 'Raspberry town'),
('Massa Hospital ', 'Erick', 'Massa '),
('Glow Sand Hospital ', 'Gary', 'Glow Sand district'),
('Johns Hospital', 'jianjun', 'Johns'),
(' King College Hospital', 'Lok', 'King'),
('Singapore Hospital', 'Moral', 'Singapore '),
('Toronto Hospital', 'Steven', 'Toronto '),
('Lausa Hospital', 'yanlin', 'Lausa '),
('Lukewarm Hosptial', 'yanwei', 'Centre Lukewarm Hillside'),
('Cleveland Hospital', 'York', 'Cleveland');

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

SELECT
    a.name,
    a.avg_time AS min_time
FROM
    (
    SELECT
        hospital.name,
        AVG(
            TIMESTAMPDIFF(
                HOUR,
                report.sample_test_time,
                report.report_time
            )
        ) AS avg_time
    FROM
        report
    JOIN hospital ON report.doctor_name = hospital.doctor_name
    GROUP BY
        hospital.name
) AS a,
(
    SELECT
        MIN(c.avg_time) AS min_time
    FROM
        (
        SELECT
            hospital.name,
            AVG(
                TIMESTAMPDIFF(
                    HOUR,
                    report.sample_test_time,
                    report.report_time
                )
            ) AS avg_time
        FROM
            report
        JOIN hospital ON report.doctor_name = hospital.doctor_name
        GROUP BY
            hospital.name
    ) AS c
) AS b
WHERE
    a.avg_time = b.min_time

-- use case 4
INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');
  
SELECT
    citizen_phone
FROM
    report
WHERE
    citizen_phone IN(
    SELECT
        citizen_phone
    FROM
        report
    WHERE
        citizen_phone IN(
        SELECT
            citizen_phone
        FROM
            report
        WHERE
            sample_test_time > '2021-10-03 00:00' AND sample_test_time < '2021-10-05 00:00'
        GROUP BY
            citizen_phone
        HAVING
            COUNT(citizen_phone) = 2
    ) AND TIMESTAMPDIFF(
        HOUR,
        (
        SELECT
            MIN(sample_test_time)
        FROM
            report r
        WHERE
            r.citizen_phone = citizen_phone
    ),
    (
    SELECT
        MAX(sample_test_time)
    FROM
        report r
    WHERE
        r.citizen_phone = citizen_phone
)
    ) > 24
)
GROUP BY
    citizen_phone

-- use case 5

INSERT INTO `district` (district_name, region_name, risk_level)
VALUES 
('Bunny Tail district', 'west', NULL),
('Centre Lukewarm Hillside', ' north', NULL),
('Cleveland ', 'east', NULL),
('Glow Sand district', 'central', NULL),
('Johns', 'north', NULL),
('King', 'west', NULL),
('Lausa', 'south', NULL),
('Lenny town', 'central', NULL),
('Massa ', 'south', NULL),
('Raspberry town', 'central', NULL),
('Singapore', 'east', NULL),
('Toronto', 'north', NULL);

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

INSERT INTO `tracking_information` (id, citizen_phone, time_enter, time_leave, district_name)
VALUES 
(1, '137928', '2021-10-02 20:56:32', '2021-10-19 18:00:10', 'Centre Lukewarm Hillside'),
(2, '233636', '2021-10-05 19:07:22', '2021-10-07 21:08:35', 'Massa '),
(3, '233636', '2021-10-07 22:16:38', '2021-11-22 21:26:08', 'Lenny town'),
(4, '264639', '2021-10-02 17:17:51', '2021-12-22 15:18:18', 'Johns'),
(5, '362849', '2021-10-02 21:25:15', '2021-10-27 21:25:21', 'Cleveland '),
(6, '362946', '2021-10-03 09:28:17', '2021-10-27 14:15:38', 'Toronto'),
(7, '363846', '2021-10-01 21:31:23', '2021-12-02 21:31:28', 'Bunny Tail district'),
(8, '372937', '2021-09-29 19:32:07', '2021-10-21 21:32:16', 'Singapore'),
(9, '374529', '2021-10-02 21:33:11', '2021-10-27 09:33:29', 'Lenny town'),
(10, '384027', '2021-10-04 21:34:17', '2022-10-20 07:24:27', 'Singapore'),
(11, '472072', '2021-09-27 08:44:12', '2021-10-07 09:00:26', 'Massa '),
(12, '472072', '2021-10-07 11:36:52', '2021-12-05 16:37:07', 'Bunny Tail district'),
(13, '492720', '2021-09-20 21:37:42', '2021-12-01 17:55:56', 'Lenny town'),
(14, '846292', '2021-10-01 09:38:44', '2021-10-20 13:11:52', 'Centre Lukewarm Hillside'),
(15, '856436', '2021-10-01 05:37:16', '2021-10-24 18:41:34', 'King'),
(16, '976590', '2021-09-29 21:42:05', '2021-10-10 08:42:07', 'Raspberry town'),
(17, '986754', '2021-10-06 21:42:49', '2021-12-13 21:43:12', 'Glow Sand district');



SELECT
    district.district_name,
    'high' risk_level
FROM
    report
JOIN tracking_information ON report.citizen_phone = tracking_information.citizen_phone
JOIN district ON tracking_information.district_name = district.district_name
WHERE
    report.sample_result = 'positive' AND TIMESTAMPDIFF(
        HOUR,
        tracking_information.time_enter,
        tracking_information.time_leave
    ) > 24
GROUP BY
    district.district_name
UNION
SELECT
    district.district_name,
    'mid' risk_level
FROM
    report
JOIN tracking_information ON report.citizen_phone = tracking_information.citizen_phone
JOIN district ON tracking_information.district_name = district.district_name
WHERE
    report.sample_result = 'positive' AND TIMESTAMPDIFF(
        HOUR,
        (
        SELECT
            MIN(sample_test_time)
        FROM
            report r
        WHERE
            sample_result = 'positive'
    ),
    (
    SELECT
        MAX(sample_test_time)
    FROM
        report r
    WHERE
        sample_result = 'positive'
)
    ) <= 7
GROUP BY
    district.district_name
UNION
SELECT
    district.district_name,
    'low' risk_level
FROM
    report
JOIN tracking_information ON report.citizen_phone = tracking_information.citizen_phone
JOIN district ON tracking_information.district_name = district.district_name
WHERE
    report.sample_result != 'positive' AND TIMESTAMPDIFF(
        HOUR,
        (
        SELECT
            MIN(sample_test_time)
        FROM
            report r
        WHERE
            sample_result != 'positive'
    ),
    (
    SELECT
        MAX(sample_test_time)
    FROM
        report r
    WHERE
        sample_result != 'positive'
)
    ) <= 7
GROUP BY
district.district_name

-- use case 6

INSERT INTO `citizen` (citizen_phone, name, sex, age)
VALUES ('137928', 'Amorn', 'female', 33),
('233636', 'Mark', 'male', 22),
('264639', 'Harry', 'male', 22),
('362849', 'Dobby', 'female', 44),
('362946', 'Albus', 'male', 57),
('363846', 'Lily', 'female', 35),
('372937', 'Dean', 'male', 29),
('374529', 'Heimione', 'female', 28),
('384027', 'Snape', 'male', 38),
('472072', 'Ron', 'male', 17),
('492720', 'Luna', 'female', 20),
('846292', 'Emily', 'female', 30),
('856436', 'Jseph', 'female', 62),
('976590', 'Antony', 'male', 15),
('986754', 'Patton', 'male', 52);

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

INSERT INTO `district` (district_name, region_name, risk_level)
VALUES 
('Bunny Tail district', 'west', NULL),
('Centre Lukewarm Hillside', ' north', NULL),
('Cleveland ', 'east', NULL),
('Glow Sand district', 'central', NULL),
('Johns', 'north', NULL),
('King', 'west', NULL),
('Lausa', 'south', NULL),
('Lenny town', 'central', NULL),
('Massa ', 'south', NULL),
('Raspberry town', 'central', NULL),
('Singapore', 'east', NULL),
('Toronto', 'north', NULL);

INSERT INTO `tracking_information` (id, citizen_phone, time_enter, time_leave, district_name)
VALUES 
(1, '137928', '2021-10-02 20:56:32', '2021-10-19 18:00:10', 'Centre Lukewarm Hillside'),
(2, '233636', '2021-10-05 19:07:22', '2021-10-07 21:08:35', 'Massa '),
(3, '233636', '2021-10-07 22:16:38', '2021-11-22 21:26:08', 'Lenny town'),
(4, '264639', '2021-10-02 17:17:51', '2021-12-22 15:18:18', 'Johns'),
(5, '362849', '2021-10-02 21:25:15', '2021-10-27 21:25:21', 'Cleveland '),
(6, '362946', '2021-10-03 09:28:17', '2021-10-27 14:15:38', 'Toronto'),
(7, '363846', '2021-10-01 21:31:23', '2021-12-02 21:31:28', 'Bunny Tail district'),
(8, '372937', '2021-09-29 19:32:07', '2021-10-21 21:32:16', 'Singapore'),
(9, '374529', '2021-10-02 21:33:11', '2021-10-27 09:33:29', 'Lenny town'),
(10, '384027', '2021-10-04 21:34:17', '2022-10-20 07:24:27', 'Singapore'),
(11, '472072', '2021-09-27 08:44:12', '2021-10-07 09:00:26', 'Massa '),
(12, '472072', '2021-10-07 11:36:52', '2021-12-05 16:37:07', 'Bunny Tail district'),
(13, '492720', '2021-09-20 21:37:42', '2021-12-01 17:55:56', 'Lenny town'),
(14, '846292', '2021-10-01 09:38:44', '2021-10-20 13:11:52', 'Centre Lukewarm Hillside'),
(15, '856436', '2021-10-01 05:37:16', '2021-10-24 18:41:34', 'King'),
(16, '976590', '2021-09-29 21:42:05', '2021-10-10 08:42:07', 'Raspberry town'),
(17, '986754', '2021-10-06 21:42:49', '2021-12-13 21:43:12', 'Glow Sand district');

SELECT
    citizen.name,
    citizen.citizen_phone
FROM
    citizen
JOIN report ON citizen.citizen_phone = report.citizen_phone
JOIN tracking_information ON report.citizen_phone = tracking_information.citizen_phone
JOIN district ON tracking_information.district_name = district.district_name
WHERE
    report.sample_result = 'positive' AND report.report_time LIKE '2021-10-04%' AND district.district_name = 'Centre Lukewarm Hillside'

-- use case 7

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

INSERT INTO `tracking_information` (id, citizen_phone, time_enter, time_leave, district_name)
VALUES 
(1, '137928', '2021-10-02 20:56:32', '2021-10-19 18:00:10', 'Centre Lukewarm Hillside'),
(2, '233636', '2021-10-05 19:07:22', '2021-10-07 21:08:35', 'Massa '),
(3, '233636', '2021-10-07 22:16:38', '2021-11-22 21:26:08', 'Lenny town'),
(4, '264639', '2021-10-02 17:17:51', '2021-12-22 15:18:18', 'Johns'),
(5, '362849', '2021-10-02 21:25:15', '2021-10-27 21:25:21', 'Cleveland '),
(6, '362946', '2021-10-03 09:28:17', '2021-10-27 14:15:38', 'Toronto'),
(7, '363846', '2021-10-01 21:31:23', '2021-12-02 21:31:28', 'Bunny Tail district'),
(8, '372937', '2021-09-29 19:32:07', '2021-10-21 21:32:16', 'Singapore'),
(9, '374529', '2021-10-02 21:33:11', '2021-10-27 09:33:29', 'Lenny town'),
(10, '384027', '2021-10-04 21:34:17', '2022-10-20 07:24:27', 'Singapore'),
(11, '472072', '2021-09-27 08:44:12', '2021-10-07 09:00:26', 'Massa '),
(12, '472072', '2021-10-07 11:36:52', '2021-12-05 16:37:07', 'Bunny Tail district'),
(13, '492720', '2021-09-20 21:37:42', '2021-12-01 17:55:56', 'Lenny town'),
(14, '846292', '2021-10-01 09:38:44', '2021-10-20 13:11:52', 'Centre Lukewarm Hillside'),
(15, '856436', '2021-10-01 05:37:16', '2021-10-24 18:41:34', 'King'),
(16, '976590', '2021-09-29 21:42:05', '2021-10-10 08:42:07', 'Raspberry town'),
(17, '986754', '2021-10-06 21:42:49', '2021-12-13 21:43:12', 'Glow Sand district');

INSERT INTO `district` (district_name, region_name, risk_level)
VALUES 
('Bunny Tail district', 'west', NULL),
('Centre Lukewarm Hillside', ' north', NULL),
('Cleveland ', 'east', NULL),
('Glow Sand district', 'central', NULL),
('Johns', 'north', NULL),
('King', 'west', NULL),
('Lausa', 'south', NULL),
('Lenny town', 'central', NULL),
('Massa ', 'south', NULL),
('Raspberry town', 'central', NULL),
('Singapore', 'east', NULL),
('Toronto', 'north', NULL);

SELECT
    (
        (
        SELECT
            COUNT(*) AS case_num
        FROM
            report
        JOIN tracking_information ON report.citizen_phone = tracking_information.citizen_phone
        JOIN district ON tracking_information.district_name = district.district_name
        WHERE
            report.sample_result = 'positive' AND report.report_time LIKE '2021-10-05%' AND district.district_name = 'Centre Lukewarm Hillside'
    ) -(
    SELECT
        COUNT(*) AS case_num
    FROM
        report
    JOIN tracking_information ON report.citizen_phone = tracking_information.citizen_phone
    JOIN district ON tracking_information.district_name = district.district_name
    WHERE
        report.sample_result = 'positive' AND report.report_time LIKE '2021-10-04%' AND district.district_name = 'Centre Lukewarm Hillside'
)
    ) AS add_num

-- use case 8




--          Extended use cases
--  !!! both test data and SELECT statements are needed
-- use case 1
INSERT INTO `citizen` (citizen_phone, name, sex, age)
VALUES ('137928', 'Amorn', 'female', 33),
('233636', 'Mark', 'male', 22),
('264639', 'Harry', 'male', 22),
('362849', 'Dobby', 'female', 44),
('362946', 'Albus', 'male', 57),
('363846', 'Lily', 'female', 35),
('372937', 'Dean', 'male', 29),
('374529', 'Heimione', 'female', 28),
('384027', 'Snape', 'male', 38),
('472072', 'Ron', 'male', 17),
('492720', 'Luna', 'female', 20),
('846292', 'Emily', 'female', 30),
('856436', 'Jseph', 'female', 62),
('976590', 'Antony', 'male', 15),
('986754', 'Patton', 'male', 52);

SELECT
    citizen_phone
FROM
    citizen
WHERE
citizen.age BETWEEN 20 AND 30;

-- use case 2

INSERT INTO `citizen` (citizen_phone, name, sex, age)
VALUES ('137928', 'Amorn', 'female', 33),
('233636', 'Mark', 'male', 22),
('264639', 'Harry', 'male', 22),
('362849', 'Dobby', 'female', 44),
('362946', 'Albus', 'male', 57),
('363846', 'Lily', 'female', 35),
('372937', 'Dean', 'male', 29),
('374529', 'Heimione', 'female', 28),
('384027', 'Snape', 'male', 38),
('472072', 'Ron', 'male', 17),
('492720', 'Luna', 'female', 20),
('846292', 'Emily', 'female', 30),
('856436', 'Jseph', 'female', 62),
('976590', 'Antony', 'male', 15),
('986754', 'Patton', 'male', 52);

SELECT
    *
FROM
    `citizen`
ORDER BY
    age ASC;

-- use case 3

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

SELECT DISTINCT
    citizen_phone
FROM
    report
WHERE
    sample_test_time BETWEEN '2021-10-01 00:00' AND '2021-11-20 00:00'
GROUP BY
    citizen_phone
HAVING
    COUNT(*) = 2;

-- use case 4

INSERT INTO `citizen` (citizen_phone, name, sex, age)
VALUES ('137928', 'Amorn', 'female', 33),
('233636', 'Mark', 'male', 22),
('264639', 'Harry', 'male', 22),
('362849', 'Dobby', 'female', 44),
('362946', 'Albus', 'male', 57),
('363846', 'Lily', 'female', 35),
('372937', 'Dean', 'male', 29),
('374529', 'Heimione', 'female', 28),
('384027', 'Snape', 'male', 38),
('472072', 'Ron', 'male', 17),
('492720', 'Luna', 'female', 20),
('846292', 'Emily', 'female', 30),
('856436', 'Jseph', 'female', 62),
('976590', 'Antony', 'male', 15),
('986754', 'Patton', 'male', 52);

SELECT
    citizen_phone
FROM
    citizen
WHERE
    LEFT(citizen_phone, 1) = 3;

-- use case 5

INSERT INTO `tracking_information` (id, citizen_phone, time_enter, time_leave, district_name)
VALUES 
(1, '137928', '2021-10-02 20:56:32', '2021-10-19 18:00:10', 'Centre Lukewarm Hillside'),
(2, '233636', '2021-10-05 19:07:22', '2021-10-07 21:08:35', 'Massa '),
(3, '233636', '2021-10-07 22:16:38', '2021-11-22 21:26:08', 'Lenny town'),
(4, '264639', '2021-10-02 17:17:51', '2021-12-22 15:18:18', 'Johns'),
(5, '362849', '2021-10-02 21:25:15', '2021-10-27 21:25:21', 'Cleveland '),
(6, '362946', '2021-10-03 09:28:17', '2021-10-27 14:15:38', 'Toronto'),
(7, '363846', '2021-10-01 21:31:23', '2021-12-02 21:31:28', 'Bunny Tail district'),
(8, '372937', '2021-09-29 19:32:07', '2021-10-21 21:32:16', 'Singapore'),
(9, '374529', '2021-10-02 21:33:11', '2021-10-27 09:33:29', 'Lenny town'),
(10, '384027', '2021-10-04 21:34:17', '2022-10-20 07:24:27', 'Singapore'),
(11, '472072', '2021-09-27 08:44:12', '2021-10-07 09:00:26', 'Massa '),
(12, '472072', '2021-10-07 11:36:52', '2021-12-05 16:37:07', 'Bunny Tail district'),
(13, '492720', '2021-09-20 21:37:42', '2021-12-01 17:55:56', 'Lenny town'),
(14, '846292', '2021-10-01 09:38:44', '2021-10-20 13:11:52', 'Centre Lukewarm Hillside'),
(15, '856436', '2021-10-01 05:37:16', '2021-10-24 18:41:34', 'King'),
(16, '976590', '2021-09-29 21:42:05', '2021-10-10 08:42:07', 'Raspberry town'),
(17, '986754', '2021-10-06 21:42:49', '2021-12-13 21:43:12', 'Glow Sand district');

SELECT
    citizen_phone
FROM
    tracking_information
WHERE
time_enter <= '2021-10-06 00:00' AND time_leave >= '2021-10-7 00:00' AND district_name = 'Johns';

-- use case 6

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

SELECT
    citizen_phone
FROM
    report
WHERE
    sample_result = 'positive' AND sample_type = 'Coughid_21';

-- use case 7

INSERT INTO `district` (district_name, region_name, risk_level)
VALUES 
('Bunny Tail district', 'west', NULL),
('Centre Lukewarm Hillside', ' north', NULL),
('Cleveland ', 'east', NULL),
('Glow Sand district', 'central', NULL),
('Johns', 'north', NULL),
('King', 'west', NULL),
('Lausa', 'south', NULL),
('Lenny town', 'central', NULL),
('Massa ', 'south', NULL),
('Raspberry town', 'central', NULL),
('Singapore', 'east', NULL),
('Toronto', 'north', NULL);

SELECT
    `district_name`,
    LENGTH(`district_name`)
FROM
    district
WHERE
    LENGTH(`district_name`) =(
    SELECT
        MAX(LENGTH(`district_name`))
    FROM
        district
)

-- use case 8

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

SELECT
    *
FROM
    report
WHERE
    doctor_name = 'jianjun';

-- use case 9

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

SELECT
    citizen_phone,
    COUNT(citizen_phone) AS t
FROM
    report
GROUP BY
    citizen_phone
HAVING
    COUNT(*) > 1

-- use case 10

INSERT INTO `report` (id, citizen_phone, sample_collect_time, sample_test_time, report_time, sample_result, doctor_name, sample_type) 
VALUES 
(1, '137928', '2021-10-03 09:57:56', '2021-10-03 10:15:05', '2021-10-04 08:58:17', 'positive', 'yanwei', 'Coughid_21'),
(2, '233636', '2021-10-08 10:45:35', '2021-10-08 10:56:33', '2021-10-09 19:30:00', 'positive', 'Ada', 'Coughid_19'),
(3, '264639', '2021-10-03 06:03:05', '2021-10-03 06:20:00', '2021-10-04 07:20:00', 'negative', 'jianjun', 'Coughid_23'),
(4, '264639', '2021-10-04 10:04:53', '2021-10-04 10:12:05', '2021-10-05 10:10:21', 'positive', 'jianjun', 'Coughid_23'),
(5, '362849', '2021-10-10 13:50:07', '2021-10-10 14:05:27', '2021-10-11 11:20:33', 'positive', 'York', 'Coughid_21'),
(6, '362946', '2021-11-03 08:30:44', '2021-11-03 09:00:03', '2021-11-04 16:30:50', 'negative', 'Steven', 'Coughid_24'),
(7, '363846', '2021-11-24 06:50:18', '2021-11-24 07:00:00', '2021-11-25 06:33:18', 'negative', 'Andrew', 'Coughid_21'),
(8, '372937', '2022-10-12 06:59:05', '2022-10-12 07:21:18', '2021-10-13 11:47:33', 'positive', 'Moral', 'Coughid_27'),
(9, '374529', '2021-10-03 11:25:00', '2021-10-03 11:34:00', '2021-10-04 07:25:00', 'negative', 'Ada', 'Coughid_23'),
(10, '384027', '2021-11-05 11:30:00', '2021-12-05 11:45:55', '2021-12-06 14:00:06', 'positive', 'Moral', 'Coughid_21'),
(11, '472072', '2021-09-28 15:00:19', '2021-09-28 16:45:11', '2021-09-29 18:20:22', 'positive', 'Erick', 'Coughid_24'),
(12, '492720', '2021-09-22 13:42:06', '2021-09-22 14:02:12', '2021-09-23 13:50:00', 'negative', 'Ada', 'Coughid_27'),
(13, '846292', '2021-10-03 10:40:00', '2021-10-03 10:55:00', '2021-10-04 07:00:39', 'positive', 'yanwei', 'Coughid_21'),
(14, '856436', '2021-10-03 07:30:05', '2021-10-03 08:00:23', '2021-10-04 13:40:00', 'negative', 'Lok', 'Coughid_21'),
(15, '856436', '2021-10-04 13:18:53', '2021-10-04 13:25:05', '2021-10-05 06:30:14', 'positive', 'Lok', 'Coughid_21'),
(16, '976590', '2021-09-30 06:42:53', '2021-09-30 13:20:08', '2021-10-01 08:05:48', 'positive', 'Bill', 'Coughid_24'),
(17, '986754', '2021-10-14 13:41:27', '2021-10-14 14:10:41', '2021-10-15 13:00:00', 'negative', 'Gary', 'Coughid_27');

SELECT
    *
FROM
    report
WHERE
    TIMESTAMPDIFF(
        MINUTE,
        sample_collect_time,
        sample_test_time
    ) > 20;


