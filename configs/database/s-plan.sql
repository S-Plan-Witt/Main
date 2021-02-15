-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Erstellungszeit: 15. Feb 2021 um 16:27
-- Server-Version: 5.7.33
-- PHP-Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `splan`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_announcements`
--

CREATE TABLE `data_announcements`
(
    `iddata_announcements` int(11)                        NOT NULL,
    `content`              text COLLATE latin1_german2_ci NOT NULL,
    `created`              datetime DEFAULT CURRENT_TIMESTAMP,
    `edited`               datetime DEFAULT CURRENT_TIMESTAMP,
    `date`                 date     DEFAULT NULL,
    `authorId`             int(11)  DEFAULT NULL,
    `editorId`             int(11)  DEFAULT NULL,
    `courseId`             int(11)  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_aufsichten`
--

CREATE TABLE `data_aufsichten`
(
    `iddata_aufsichten` int(11)                          NOT NULL,
    `time`              varchar(45) CHARACTER SET latin1 NOT NULL,
    `date`              date                             NOT NULL,
    `teacher`           varchar(45) CHARACTER SET latin1 NOT NULL,
    `location`          varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_courses`
--

CREATE TABLE `data_courses`
(
    `iddata_courses` int(11)     NOT NULL,
    `grade`          varchar(45) NOT NULL,
    `subject`        varchar(45) NOT NULL,
    `group`          varchar(45) NOT NULL,
    `coursename`     varchar(45) GENERATED ALWAYS AS (concat(`grade`, _latin1'/', `subject`, _latin1'-', `group`)) VIRTUAL,
    `teacher`        varchar(15) DEFAULT NULL,
    `teacherId`      int(11)     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_entschuldigungen`
--

CREATE TABLE `data_entschuldigungen`
(
    `iddata_entschuldigungen` int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_exams`
--

CREATE TABLE `data_exams`
(
    `iddata_klausuren` int(11)                          NOT NULL,
    `date`             date                             NOT NULL,
    `subject`          varchar(45) CHARACTER SET latin1 NOT NULL,
    `grade`            varchar(45) CHARACTER SET latin1 NOT NULL,
    `group`            varchar(45) CHARACTER SET latin1 NOT NULL,
    `visibleOnDisplay` tinyint(4) DEFAULT NULL,
    `from`             time                             NOT NULL,
    `to`               time                             NOT NULL,
    `teacher`          varchar(45) CHARACTER SET latin1 NOT NULL,
    `students`         int(11)                          NOT NULL,
    `uniqueIdentifier` varchar(45) CHARACTER SET latin1 GENERATED ALWAYS AS (concat(`grade`, _latin1'-', `group`, _latin1'-', `subject`, _latin1'-', `date`)) VIRTUAL,
    `roomLink`         int(11)    DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_exam_rooms`
--

CREATE TABLE `data_exam_rooms`
(
    `iddata_exam_rooms` int(11)                          NOT NULL,
    `room`              varchar(45) CHARACTER SET latin1 NOT NULL,
    `from`              time DEFAULT NULL,
    `to`                time DEFAULT NULL,
    `date`              date DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_exam_supervisors`
--

CREATE TABLE `data_exam_supervisors`
(
    `supervisorId` int(11) NOT NULL,
    `RoomLink`     int(11) DEFAULT NULL,
    `TeacherId`    int(11) DEFAULT NULL,
    `from`         time    DEFAULT NULL,
    `to`           time    DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_lessons`
--

CREATE TABLE `data_lessons`
(
    `idlessons`  int(11)                          NOT NULL,
    `room`       varchar(45) CHARACTER SET latin1 NOT NULL,
    `lesson`     int(11)                          NOT NULL,
    `weekday`    int(11) DEFAULT NULL,
    `identifier` varchar(45) CHARACTER SET latin1 GENERATED ALWAYS AS (concat(`courseId`, _utf8mb4'-', `weekday`, _utf8mb4'-', `lesson`)) VIRTUAL,
    `courseId`   int(11) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `data_replacementlessons`
--

CREATE TABLE `data_replacementlessons`
(
    `iddata_vertretungen` int(11) NOT NULL,
    `date`                date    NOT NULL,
    `subject`             varchar(45) CHARACTER SET latin1 DEFAULT NULL,
    `room`                varchar(45) CHARACTER SET latin1 DEFAULT NULL,
    `info`                varchar(45) CHARACTER SET latin1 DEFAULT NULL,
    `lessonId`            int(11)                          DEFAULT NULL,
    `teacherId`           int(11)                          DEFAULT NULL,
    `replacementId`       varchar(45) CHARACTER SET latin1 GENERATED ALWAYS AS (concat(`date`, _utf8mb4'-', `lessonId`)) VIRTUAL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `devices`
--

CREATE TABLE `devices`
(
    `idDevices` int(11)   NOT NULL,
    `userId`    int(11)                           DEFAULT NULL,
    `deviceID`  longtext CHARACTER SET utf8mb4,
    `plattform` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
    `added`     timestamp NULL                    DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jwt_Token`
--

CREATE TABLE `jwt_Token`
(
    `idjwt_Token`     int(11)   NOT NULL,
    `tokenIdentifier` varchar(45) COLLATE latin1_german2_ci DEFAULT NULL,
    `userid`          int(11)                               DEFAULT NULL,
    `timestamp`       timestamp NULL                        DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lessons_teacher`
--

CREATE TABLE `lessons_teacher`
(
    `idlessons_teacher` int(11)                          NOT NULL,
    `teacher`           varchar(45) CHARACTER SET latin1 NOT NULL,
    `teacherId`         int(11) DEFAULT NULL,
    `lessonId`          int(11) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `moodle_mapping`
--

CREATE TABLE `moodle_mapping`
(
    `userid`   int(10) UNSIGNED NOT NULL,
    `moodleid` int(10) UNSIGNED NOT NULL,
    `uid`      int(11)          NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `permissions`
--

CREATE TABLE `permissions`
(
    `idpermissions`      int(11) NOT NULL,
    `userId`             int(11) NOT NULL,
    `users`              int(11) NOT NULL DEFAULT '0',
    `replacementLessons` int(11) NOT NULL DEFAULT '0',
    `announcements`      int(11) NOT NULL DEFAULT '0',
    `timeTable`          int(11) NOT NULL DEFAULT '0',
    `moodle`             int(11) NOT NULL DEFAULT '0',
    `globalAdmin`        int(11) NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `preAuth_Token`
--

CREATE TABLE `preAuth_Token`
(
    `idpreAuth_Token` int(11)                           NOT NULL,
    `userId`          int(11) DEFAULT NULL,
    `token`           varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student_courses`
--

CREATE TABLE `student_courses`
(
    `idstudent_courses` int(11) NOT NULL,
    `user_id`           int(11) NOT NULL,
    `courseId`          int(11)    DEFAULT NULL,
    `displayKlausuren`  tinyint(1) DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `telegramLinks`
--

CREATE TABLE `telegramLinks`
(
    `idtelegramLinks` int(11)                          NOT NULL,
    `telegramId`      int(11)                          NOT NULL,
    `token`           varchar(45) CHARACTER SET latin1 NOT NULL,
    `created`         timestamp                        NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TelegramMessages`
--

CREATE TABLE `TelegramMessages`
(
    `idTelegramMessages` int(11) NOT NULL,
    `chatId`             int(11) DEFAULT NULL,
    `message`            text COLLATE latin1_german2_ci,
    `direction`          text COLLATE latin1_german2_ci
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `token_calendar`
--

CREATE TABLE `token_calendar`
(
    `idtoken_calendar` int(11)                           NOT NULL,
    `userid`           int(11) DEFAULT NULL,
    `calendar_Token`   varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `totp`
--

CREATE TABLE `totp`
(
    `id_totp`  int(11)                                NOT NULL,
    `user_id`  int(11)                                NOT NULL,
    `totp_key` varchar(100) COLLATE latin1_german2_ci NOT NULL,
    `verified` int(11)                                NOT NULL DEFAULT '0',
    `alias`    varchar(45) COLLATE latin1_german2_ci           DEFAULT NULL,
    `added`    datetime                                        DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users`
(
    `idusers`     int(11)                          NOT NULL,
    `username`    varchar(45) CHARACTER SET latin1 NOT NULL,
    `firstname`   varchar(45) CHARACTER SET latin1 DEFAULT NULL,
    `lastname`    varchar(45) CHARACTER SET latin1 DEFAULT NULL,
    `type`        varchar(45) CHARACTER SET latin1 DEFAULT NULL,
    `lastlogon`   varchar(45) CHARACTER SET latin1 DEFAULT NULL,
    `displayname` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
    `active`      int(11)                          DEFAULT '1',
    `twoFactor`   int(11)                          DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users_mails`
--

CREATE TABLE `users_mails`
(
    `idusers_mails` int(11)                          NOT NULL,
    `mail`          varchar(45) CHARACTER SET latin1 NOT NULL,
    `added`         datetime                         DEFAULT CURRENT_TIMESTAMP,
    `confirmed`     int(11)                          DEFAULT '0',
    `token`         varchar(50) CHARACTER SET latin1 DEFAULT NULL,
    `userid`        int(11)                          DEFAULT NULL,
    `primary`       int(11)                          DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1
  COLLATE = latin1_german2_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `data_announcements`
--
ALTER TABLE `data_announcements`
    ADD PRIMARY KEY (`iddata_announcements`),
    ADD KEY `announcements_authorId_fk_idx` (`authorId`, `editorId`);

--
-- Indizes für die Tabelle `data_aufsichten`
--
ALTER TABLE `data_aufsichten`
    ADD PRIMARY KEY (`iddata_aufsichten`);

--
-- Indizes für die Tabelle `data_courses`
--
ALTER TABLE `data_courses`
    ADD PRIMARY KEY (`iddata_courses`),
    ADD KEY `courses_teacherId_fk_idx` (`teacherId`);

--
-- Indizes für die Tabelle `data_entschuldigungen`
--
ALTER TABLE `data_entschuldigungen`
    ADD PRIMARY KEY (`iddata_entschuldigungen`);

--
-- Indizes für die Tabelle `data_exams`
--
ALTER TABLE `data_exams`
    ADD PRIMARY KEY (`iddata_klausuren`),
    ADD KEY `FK_RoomLink_idx` (`roomLink`);

--
-- Indizes für die Tabelle `data_exam_rooms`
--
ALTER TABLE `data_exam_rooms`
    ADD PRIMARY KEY (`iddata_exam_rooms`);

--
-- Indizes für die Tabelle `data_exam_supervisors`
--
ALTER TABLE `data_exam_supervisors`
    ADD PRIMARY KEY (`supervisorId`),
    ADD KEY `FK_RoomLinkSV_idx` (`RoomLink`),
    ADD KEY `FK_RoomLink_idx` (`RoomLink`),
    ADD KEY `FK_UserID_idx` (`TeacherId`);

--
-- Indizes für die Tabelle `data_lessons`
--
ALTER TABLE `data_lessons`
    ADD PRIMARY KEY (`idlessons`),
    ADD UNIQUE KEY `idlessons_UNIQUE` (`idlessons`),
    ADD UNIQUE KEY `identifier_UNIQUE` (`identifier`);

--
-- Indizes für die Tabelle `data_replacementlessons`
--
ALTER TABLE `data_replacementlessons`
    ADD PRIMARY KEY (`iddata_vertretungen`),
    ADD UNIQUE KEY `replacementId_UNIQUE` (`replacementId`),
    ADD KEY `replacementLesson_teacherid_fk_idx` (`teacherId`);

--
-- Indizes für die Tabelle `devices`
--
ALTER TABLE `devices`
    ADD PRIMARY KEY (`idDevices`),
    ADD KEY `devices_uid_fk_idx` (`userId`);

--
-- Indizes für die Tabelle `jwt_Token`
--
ALTER TABLE `jwt_Token`
    ADD PRIMARY KEY (`idjwt_Token`),
    ADD KEY `user_mails_uid_fk_idx` (`userid`);

--
-- Indizes für die Tabelle `lessons_teacher`
--
ALTER TABLE `lessons_teacher`
    ADD PRIMARY KEY (`idlessons_teacher`),
    ADD KEY `lessons_teacher_teacherid_Fk_idx` (`teacherId`);

--
-- Indizes für die Tabelle `moodle_mapping`
--
ALTER TABLE `moodle_mapping`
    ADD UNIQUE KEY `moodle_mapping_users_idusers_fk` (`userid`),
    ADD KEY `moodlemapping_uid_fk_idx` (`uid`);

--
-- Indizes für die Tabelle `permissions`
--
ALTER TABLE `permissions`
    ADD PRIMARY KEY (`idpermissions`),
    ADD UNIQUE KEY `userId_UNIQUE` (`userId`),
    ADD KEY `userTable_uid_permissions_idx` (`userId`);

--
-- Indizes für die Tabelle `preAuth_Token`
--
ALTER TABLE `preAuth_Token`
    ADD PRIMARY KEY (`idpreAuth_Token`),
    ADD KEY `preauthToken_uid_fk_idx` (`userId`);

--
-- Indizes für die Tabelle `student_courses`
--
ALTER TABLE `student_courses`
    ADD PRIMARY KEY (`idstudent_courses`),
    ADD KEY `userid` (`user_id`);

--
-- Indizes für die Tabelle `telegramLinks`
--
ALTER TABLE `telegramLinks`
    ADD PRIMARY KEY (`idtelegramLinks`),
    ADD UNIQUE KEY `telegramLinks_telegramId_uindex` (`telegramId`),
    ADD UNIQUE KEY `telegramLinks_token_uindex` (`token`);

--
-- Indizes für die Tabelle `TelegramMessages`
--
ALTER TABLE `TelegramMessages`
    ADD PRIMARY KEY (`idTelegramMessages`);

--
-- Indizes für die Tabelle `token_calendar`
--
ALTER TABLE `token_calendar`
    ADD PRIMARY KEY (`idtoken_calendar`),
    ADD KEY `tokencalender_uid_fk_idx` (`userid`);

--
-- Indizes für die Tabelle `totp`
--
ALTER TABLE `totp`
    ADD PRIMARY KEY (`id_totp`),
    ADD UNIQUE KEY `totp_key_UNIQUE` (`totp_key`),
    ADD KEY `totp_user_fk_idx` (`user_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`idusers`),
    ADD UNIQUE KEY `users_username_uindex` (`username`);

--
-- Indizes für die Tabelle `users_mails`
--
ALTER TABLE `users_mails`
    ADD PRIMARY KEY (`idusers_mails`),
    ADD UNIQUE KEY `users_mails_mail_uindex` (`mail`),
    ADD UNIQUE KEY `users_mails_token_uindex` (`token`),
    ADD KEY `users_mails_users_idusers_fk` (`userid`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `data_announcements`
--
ALTER TABLE `data_announcements`
    MODIFY `iddata_announcements` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `data_aufsichten`
--
ALTER TABLE `data_aufsichten`
    MODIFY `iddata_aufsichten` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `data_courses`
--
ALTER TABLE `data_courses`
    MODIFY `iddata_courses` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 276;

--
-- AUTO_INCREMENT für Tabelle `data_entschuldigungen`
--
ALTER TABLE `data_entschuldigungen`
    MODIFY `iddata_entschuldigungen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `data_exams`
--
ALTER TABLE `data_exams`
    MODIFY `iddata_klausuren` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 437;

--
-- AUTO_INCREMENT für Tabelle `data_exam_rooms`
--
ALTER TABLE `data_exam_rooms`
    MODIFY `iddata_exam_rooms` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5099;

--
-- AUTO_INCREMENT für Tabelle `data_exam_supervisors`
--
ALTER TABLE `data_exam_supervisors`
    MODIFY `supervisorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `data_lessons`
--
ALTER TABLE `data_lessons`
    MODIFY `idlessons` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1365;

--
-- AUTO_INCREMENT für Tabelle `data_replacementlessons`
--
ALTER TABLE `data_replacementlessons`
    MODIFY `iddata_vertretungen` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 482;

--
-- AUTO_INCREMENT für Tabelle `devices`
--
ALTER TABLE `devices`
    MODIFY `idDevices` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 19;

--
-- AUTO_INCREMENT für Tabelle `jwt_Token`
--
ALTER TABLE `jwt_Token`
    MODIFY `idjwt_Token` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT für Tabelle `lessons_teacher`
--
ALTER TABLE `lessons_teacher`
    MODIFY `idlessons_teacher` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `permissions`
--
ALTER TABLE `permissions`
    MODIFY `idpermissions` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;

--
-- AUTO_INCREMENT für Tabelle `preAuth_Token`
--
ALTER TABLE `preAuth_Token`
    MODIFY `idpreAuth_Token` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `student_courses`
--
ALTER TABLE `student_courses`
    MODIFY `idstudent_courses` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3486;

--
-- AUTO_INCREMENT für Tabelle `telegramLinks`
--
ALTER TABLE `telegramLinks`
    MODIFY `idtelegramLinks` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 8;

--
-- AUTO_INCREMENT für Tabelle `TelegramMessages`
--
ALTER TABLE `TelegramMessages`
    MODIFY `idTelegramMessages` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `token_calendar`
--
ALTER TABLE `token_calendar`
    MODIFY `idtoken_calendar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `totp`
--
ALTER TABLE `totp`
    MODIFY `id_totp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
    MODIFY `idusers` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2060;

--
-- AUTO_INCREMENT für Tabelle `users_mails`
--
ALTER TABLE `users_mails`
    MODIFY `idusers_mails` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `data_courses`
--
ALTER TABLE `data_courses`
    ADD CONSTRAINT `courses_teacherId_fk` FOREIGN KEY (`teacherId`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `data_exams`
--
ALTER TABLE `data_exams`
    ADD CONSTRAINT `FK_RoomLink` FOREIGN KEY (`roomLink`) REFERENCES `data_exam_rooms` (`iddata_exam_rooms`);

--
-- Constraints der Tabelle `data_exam_supervisors`
--
ALTER TABLE `data_exam_supervisors`
    ADD CONSTRAINT `FK_RoomLinkSV` FOREIGN KEY (`RoomLink`) REFERENCES `data_exam_rooms` (`iddata_exam_rooms`),
    ADD CONSTRAINT `FK_UserID` FOREIGN KEY (`TeacherId`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `data_replacementlessons`
--
ALTER TABLE `data_replacementlessons`
    ADD CONSTRAINT `replacementLesson_teacherid_fk` FOREIGN KEY (`teacherId`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `devices`
--
ALTER TABLE `devices`
    ADD CONSTRAINT `devices_uid_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `jwt_Token`
--
ALTER TABLE `jwt_Token`
    ADD CONSTRAINT `user_mails_uid_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `lessons_teacher`
--
ALTER TABLE `lessons_teacher`
    ADD CONSTRAINT `lessons_teacher_teacherid_Fk` FOREIGN KEY (`teacherId`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `moodle_mapping`
--
ALTER TABLE `moodle_mapping`
    ADD CONSTRAINT `moodlemapping_uid_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `permissions`
--
ALTER TABLE `permissions`
    ADD CONSTRAINT `fk_permissions_uid` FOREIGN KEY (`userId`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `preAuth_Token`
--
ALTER TABLE `preAuth_Token`
    ADD CONSTRAINT `preauthToken_uid_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `student_courses`
--
ALTER TABLE `student_courses`
    ADD CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `token_calendar`
--
ALTER TABLE `token_calendar`
    ADD CONSTRAINT `tokencalender_uid_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `totp`
--
ALTER TABLE `totp`
    ADD CONSTRAINT `totp_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`idusers`);

--
-- Constraints der Tabelle `users_mails`
--
ALTER TABLE `users_mails`
    ADD CONSTRAINT `users_mails_users_idusers_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`idusers`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
