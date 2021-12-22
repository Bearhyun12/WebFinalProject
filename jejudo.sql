CREATE TABLE `place` (
  `P_SEQ` int NOT NULL COMMENT '장소 일련번호',
  `P_CATEGORY` varchar(45) CHARACTER SET utf8mb4  NOT NULL COMMENT '장소 카테고리 (식당, 카페, 관광지, 숙소 등)',
  `P_AREA` varchar(45) CHARACTER SET utf8mb4 NOT NULL COMMENT '구역 (동, 서, 남, 북)',
  `P_NAME` varchar(100) CHARACTER SET utf8mb4  NOT NULL COMMENT '장소명',
  `P_ADDRESS` varchar(200) CHARACTER SET utf8mb4  NOT NULL COMMENT '주소',
  `P_TELL` varchar(45) CHARACTER SET utf8mb4  NOT NULL COMMENT '연락처',
  `P_INFO` varchar(2000) CHARACTER SET utf8mb4  NOT NULL COMMENT '장소에대한 정보',
  `P_IMG_PATH` varchar(45) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '이미지 주소',
  `P_X_AXIS` varchar(45) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'X-좌표',
  `P_Y_AXIS` varchar(45) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'Y-좌표',
  `originalFileName` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `filePath` varchar(500) CHARACTER SET utf8mb4  DEFAULT NULL,
  PRIMARY KEY (`P_SEQ`)
) ;
CREATE TABLE `review` (
  `R_SEQ` int NOT NULL,
  `TR_SEQ` int DEFAULT NULL,
  `M_SEQ` int DEFAULT NULL,
  `R_WRITER_SEQ` int DEFAULT NULL,
  `R_CONTENT` varchar(500) DEFAULT NULL,
  `R_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `R_REVIEW_TYPE` varchar(45) DEFAULT NULL COMMENT 'REVIEW or COMPLAIN',
  `R_COMPLAIN` varchar(45) DEFAULT NULL COMMENT '신고 사유',
  PRIMARY KEY (`R_SEQ`)
) ;
CREATE TABLE `reviewboard_comment` (
  `RC_SEQ` int NOT NULL,
  `M_SEQ` int NOT NULL,
  `P_SEQ` int NOT NULL,
  `BAB` enum('1','2','3','4','5','NULL') DEFAULT NULL,
  `CLEAN` enum('1','2','3','4','5','NULL') DEFAULT NULL,
  `VIEW` enum('1','2','3','4','5','NULL') DEFAULT NULL,
  `REVISIT` enum('Y','N','NULL') DEFAULT NULL,
  `PARKING` enum('Y','N','NULL') DEFAULT NULL,
  `REVIEW` varchar(200) DEFAULT NULL,
  `RC_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RC_SEQ`)
) ;
CREATE TABLE `tr_schedule` (
  `SC_SEQ` int NOT NULL,
  `TR_SEQ` int NOT NULL,
  `P_SEQ` int NOT NULL,
  `tr_status` int DEFAULT NULL COMMENT '0 : not clear\n1: clear',
  `TR_CLEAR_FILENAME` varchar(200) DEFAULT NULL COMMENT '인증하기에 올린 사진',
  PRIMARY KEY (`SC_SEQ`,`TR_SEQ`)
) ;
CREATE TABLE `trip` (
  `TR_SEQ` int NOT NULL COMMENT '개설될 여행의 일련번호',
  `TR_NAME` varchar(45) NOT NULL COMMENT '여행 이름',
  `TR_MODE` varchar(45) NOT NULL COMMENT '여행 모드',
  `TR_AREA_SET` varchar(45) NOT NULL COMMENT '구역 (동, 서, 남, 북) 설정',
  `TR_DATE_SET` int DEFAULT NULL COMMENT '날짜 설정',
  `TR_STEPS` varchar(45) DEFAULT NULL COMMENT '<<보류>>\\n\\n스텝 시퀀스',
  `TR_STEP_STATUS` varchar(45) DEFAULT NULL COMMENT '<<보류>>\n\n스텝 상태',
  `TR_GENDER_SET` enum('M','F','X') NOT NULL DEFAULT 'X' COMMENT '성별 설정 ( 남, 여, 무관)',
  `TR_PERSONNEL_SET` int NOT NULL COMMENT '인원 설정',
  `TR_LICENSE_SET` enum('Y','N','X') NOT NULL DEFAULT 'X' COMMENT '운전면허 설정 (유, 무, 무관)',
  `TR_TRANSPORTATION_SET` varchar(45) DEFAULT 'X' COMMENT '이동수단 설정',
  `TR_PASSWORD_SET` varchar(45) DEFAULT NULL COMMENT '비밀전호 설정',
  `TR_INTRO` varchar(500) DEFAULT NULL,
  `TR_IMG_PATH` varchar(200) DEFAULT NULL,
  `TR_IMG_NAME` varchar(45) DEFAULT NULL,
  `TR_STATUS` int DEFAULT '1',
  PRIMARY KEY (`TR_SEQ`)
) ;
CREATE TABLE `trip_members` (
  `TM_SEQ` int NOT NULL COMMENT '맴버 그룹 일련번호',
  `TR_SEQ` int NOT NULL COMMENT '여행 일련번호',
  `M_SEQ` int NOT NULL COMMENT '맴버 일련번호',
  `TM_ROLE` varchar(45) DEFAULT 'g',
  `TM_NAME` varchar(45) DEFAULT NULL,
  `TM_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TM_SEQ`)
) ;
CREATE TABLE `board` (
  `SEQ` int(11) NOT NULL,
  `M_SEQ` int(11) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `WRITER` varchar(100)  DEFAULT NULL,
  `CONTENT` varchar(2000)  DEFAULT NULL,
  `REG_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CNT` varchar(100)  DEFAULT '0',
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`SEQ`)
) ;
CREATE TABLE `board_file` (
  `SEQ` int(11) NOT NULL,
  `F_SEQ` int(11) NOT NULL,
  `ORIGINAL_FILE_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_SIZE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEQ`,`F_SEQ`)
) ;
CREATE TABLE `comment` (
  `CM_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '대화방 일련번호',
  `TR_SEQ` int(11) NOT NULL COMMENT '여행 일련번호',
  `M_SEQ` int(11) NOT NULL COMMENT '맴버 일련번호',
  `CM_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CM_COMENT` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '코멘트 내용',
  PRIMARY KEY (`CM_SEQ`),
  KEY `DFGDFG_idx` (`M_SEQ`),
  KEY `TR_SEQ_idx` (`TR_SEQ`)
) ;
CREATE TABLE `freeboard_comment` (
  `FM_SEQ` int(11) NOT NULL AUTO_INCREMENT,
  `SEQ` int(11) NOT NULL,
  `M_SEQ` int(11) NOT NULL,
  `FM_TIME` timestamp NULL DEFAULT NULL,
  `FM_COMMENT` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FM_NICKNAME` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FM_SEQ`)
);
CREATE TABLE `member` (
  `M_SEQ` int(11) NOT NULL,
  `M_ID` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `M_NICKNAME` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `M_PASSWORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `M_NAME` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `M_BIRTHDAY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `M_EMAIL` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `M_GENDER` enum('M','F') COLLATE utf8_unicode_ci NOT NULL,
  `M_TELL` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `M_LICENSE` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `M_IMG_PATH` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `M_IMG_NAME` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `M_INTRODUCE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `M_ACCOUNT_STATUS` varchar(9) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`M_SEQ`),
  UNIQUE KEY `M_ID_UNIQUE` (`M_ID`)
) ;

commit;
