CREATE DATABASE  IF NOT EXISTS `mekdemschoolportal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mekdemschoolportal`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: mekdemschoolportal
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `AdministratorID` varchar(11) NOT NULL,
  `FullName` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Password` varchar(5) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `TelephoneNo` varchar(45) DEFAULT NULL,
  `Responsibility` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`AdministratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('AGF/1111/11','Nahom Hailu','Male','1111',NULL,NULL,NULL),('AGF/4342/05','Nahom Behailu','Male','55555',NULL,NULL,NULL);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `studentId` varchar(45) NOT NULL,
  `assessment1` varchar(45) DEFAULT NULL,
  `assessment2` varchar(45) DEFAULT NULL,
  `assessment3` varchar(45) DEFAULT NULL,
  `assessment4` varchar(45) DEFAULT NULL,
  `evaluaionGrade` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES ('Atr/1111/11','45','23','12','22','100');
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `InstructorID` varchar(45) NOT NULL,
  `AssignmentPath` varchar(200) NOT NULL,
  `Course` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,'Mike Litories','IDR/5433/03','C:/Users/Omen/Downloads/justtring/html_tutorial.pdf','ECEG'),(2,'Kebede Abebe','IDR/1111/11','.//4168.jpg','ECEA'),(3,'Kebede Abebe','IDR/1111/11','C:Files/AssignmentsUploaded/git-cheat-sheet-education.pdf','SRS');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentsubmission`
--

DROP TABLE IF EXISTS `assignmentsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentsubmission` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Student` varchar(45) NOT NULL,
  `Assignment` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentID_idx` (`Student`),
  KEY `Assignment_idx` (`Assignment`),
  CONSTRAINT `Student` FOREIGN KEY (`Student`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentsubmission`
--

LOCK TABLES `assignmentsubmission` WRITE;
/*!40000 ALTER TABLE `assignmentsubmission` DISABLE KEYS */;
INSERT INTO `assignmentsubmission` VALUES (1,'atr/1111/11','C:/Users/Omen/Downloads/justtring/Mekdim.zip','emf'),(2,'atr/1111/11','C:/Users/Omen/Downloads/justtring/SRS.rtf','emf'),(3,'Atr/1111/11','C:/ASSIGMENT/Birdy.png','ECEG'),(4,'Atr/1111/11','C:Files/ASSIGNMENT/Birdy.png','ECEG'),(5,'Atr/1111/11','C:Files/ASSIGNMENTS/b1.png','ECEG');
/*!40000 ALTER TABLE `assignmentsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AcademicYear` varchar(45) NOT NULL,
  `Semester` varchar(45) NOT NULL,
  `AdmissionType` varchar(45) NOT NULL,
  `CalendarPath` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clearance`
--

DROP TABLE IF EXISTS `clearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clearance` (
  `FirstName` varchar(45) NOT NULL,
  `Lastname` varchar(45) NOT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `date` varchar(45) NOT NULL,
  `ID` varchar(30) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `cyear` varchar(45) NOT NULL,
  `myfile` varchar(45) NOT NULL,
  `ClearanceReason` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clearance`
--

LOCK TABLES `clearance` WRITE;
/*!40000 ALTER TABLE `clearance` DISABLE KEYS */;
INSERT INTO `clearance` VALUES ('','','','dd/mm/yyyy','','','','','415-4151459_glass-marble-ball-orb-bubble-blue-black-blue.png'),('Nathan','Zelalem','Kebede','11/11/2001','Atr/1111/11','Male','2011','I am awesome',''),('Nathan','Zelalem','ff','11/11/2001','Atr/1131/11','Male','2011','Awesomes',''),('Lillian','Zelalem','Kebede','11/11/3000','Atr/6567/56','Female','2011','Magnificence','you suck.txt'),('Nathan','Zelalem','Kebede','11/11/2002','Atr/6567/56','Male','2011','Magnificence','you suck.txt'),('Lillian','Alehegn','Kebede','11/11/2002','Atr/6567/56','Male','undefined','My awesomeness scares me             ','you suck.txt');
/*!40000 ALTER TABLE `clearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `ClubName` varchar(45) NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `FoundationDate` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Goal` varchar(200) DEFAULT NULL,
  `Vision` varchar(200) DEFAULT NULL,
  `Mission` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ClubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES ('Red Cross','approved','11-11-11',NULL,NULL,NULL,NULL),('What','approved','11-11-11',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactdephead`
--

DROP TABLE IF EXISTS `contactdephead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactdephead` (
  `primaryid` int NOT NULL AUTO_INCREMENT,
  `studentname` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` varchar(300) NOT NULL,
  PRIMARY KEY (`primaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactdephead`
--

LOCK TABLES `contactdephead` WRITE;
/*!40000 ALTER TABLE `contactdephead` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactdephead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costsharing`
--

DROP TABLE IF EXISTS `costsharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costsharing` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentCostSharing` varchar(45) NOT NULL,
  `AccountNumber` varchar(45) NOT NULL,
  `ServiceChoice` varchar(45) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Subcity` varchar(45) DEFAULT NULL,
  `Woreda` varchar(45) DEFAULT NULL,
  `HouseNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `StudentCostSharing_UNIQUE` (`StudentCostSharing`),
  KEY `StudentCostSharing_idx` (`StudentCostSharing`),
  CONSTRAINT `StudentCostSharing` FOREIGN KEY (`StudentCostSharing`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costsharing`
--

LOCK TABLES `costsharing` WRITE;
/*!40000 ALTER TABLE `costsharing` DISABLE KEYS */;
INSERT INTO `costsharing` VALUES (5,'Atr/1111/11','0987098','FoodAndDorm','AA','N/S/L','78','new'),(12,'ATR/3333/11','786','Food','arbaminch','nech sar','67','asdf');
/*!40000 ALTER TABLE `costsharing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `council`
--

DROP TABLE IF EXISTS `council`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `council` (
  `CouncilName` varchar(45) NOT NULL,
  `OfficeNo` varchar(45) NOT NULL,
  `Campus` varchar(45) NOT NULL,
  `FoundationDate` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CouncilName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `council`
--

LOCK TABLES `council` WRITE;
/*!40000 ALTER TABLE `council` DISABLE KEYS */;
INSERT INTO `council` VALUES ('4 kilo council','+251-118-2147','4 kilo','14/08/2002','4kilo@gmail.com'),('5 kilo council','+251-118-2143','5 kilo','14/08/2002','5kilo@gmail.com'),('6 kilo council','+251-118-3652','6 kilo','01/05/2000','6kilo@gmail.com');
/*!40000 ALTER TABLE `council` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `councilstudents`
--

DROP TABLE IF EXISTS `councilstudents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `councilstudents` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CouncilName` varchar(45) NOT NULL,
  `StudentID` varchar(45) NOT NULL,
  `Role` varchar(200) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `VoteNumber` int DEFAULT NULL,
  `PhotoPath` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CouncilName_idx` (`CouncilName`),
  KEY `StudentID_idx` (`StudentID`),
  CONSTRAINT `CouncilName` FOREIGN KEY (`CouncilName`) REFERENCES `council` (`CouncilName`),
  CONSTRAINT `StudentID` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `councilstudents`
--

LOCK TABLES `councilstudents` WRITE;
/*!40000 ALTER TABLE `councilstudents` DISABLE KEYS */;
/*!40000 ALTER TABLE `councilstudents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseID` varchar(8) NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `ECTS` int NOT NULL,
  `CreditHour` int NOT NULL,
  `ModuleName` varchar(45) NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('ECEG','Micro',12,3,'ESE');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_department`
--

DROP TABLE IF EXISTS `course_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_department` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CourseID` varchar(8) NOT NULL,
  `DepartmentID` varchar(45) NOT NULL,
  `Semester` varchar(45) NOT NULL,
  `Year` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CourseID_idx` (`CourseID`),
  KEY `DepartmentID_idx` (`DepartmentID`),
  CONSTRAINT `CourseID` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `DepartmentID` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_department`
--

LOCK TABLES `course_department` WRITE;
/*!40000 ALTER TABLE `course_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_instructor`
--

DROP TABLE IF EXISTS `course_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_instructor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Course_Instructor` varchar(45) NOT NULL,
  `CourseGiven` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Course_Instructor_idx` (`Course_Instructor`),
  KEY `CourseGiven_idx` (`CourseGiven`),
  CONSTRAINT `Course_Instructor` FOREIGN KEY (`Course_Instructor`) REFERENCES `instructor` (`InstructorID`),
  CONSTRAINT `CourseGiven` FOREIGN KEY (`CourseGiven`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_instructor`
--

LOCK TABLES `course_instructor` WRITE;
/*!40000 ALTER TABLE `course_instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_material`
--

DROP TABLE IF EXISTS `course_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_material` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Course_Material` varchar(45) NOT NULL,
  `MaterialFilePath` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Course_Material_idx` (`Course_Material`),
  CONSTRAINT `Course_Material` FOREIGN KEY (`Course_Material`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_material`
--

LOCK TABLES `course_material` WRITE;
/*!40000 ALTER TABLE `course_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_schedule`
--

DROP TABLE IF EXISTS `course_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Course_Scheduled` varchar(45) NOT NULL,
  `Department` varchar(45) NOT NULL,
  `Semester` varchar(45) NOT NULL,
  `Year` varchar(45) NOT NULL,
  `Stream` varchar(45) DEFAULT NULL,
  `Section` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Course_Scheduled_idx` (`Course_Scheduled`),
  KEY `Department_idx` (`Department`),
  CONSTRAINT `Course_Scheduled` FOREIGN KEY (`Course_Scheduled`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `Department` FOREIGN KEY (`Department`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_schedule`
--

LOCK TABLES `course_schedule` WRITE;
/*!40000 ALTER TABLE `course_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_student`
--

DROP TABLE IF EXISTS `course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_student` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentInCourse` varchar(45) NOT NULL,
  `CourseChosen` varchar(45) NOT NULL,
  `CourseGrade` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentInCourse_idx` (`StudentInCourse`),
  KEY `CourseChosen_idx` (`CourseChosen`),
  CONSTRAINT `CourseChosen` FOREIGN KEY (`CourseChosen`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `StudentInCourse` FOREIGN KEY (`StudentInCourse`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student`
--

LOCK TABLES `course_student` WRITE;
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
INSERT INTO `course_student` VALUES (1,'Atr/1111/11','ECEG','f');
/*!40000 ALTER TABLE `course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseadddroprequest`
--

DROP TABLE IF EXISTS `courseadddroprequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseadddroprequest` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CourseRequested` varchar(45) NOT NULL,
  `StudentRequesting` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CourseRequested_idx` (`CourseRequested`),
  KEY `StudentRequesting_idx` (`StudentRequesting`),
  CONSTRAINT `CourseRequested` FOREIGN KEY (`CourseRequested`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `StudentRequesting` FOREIGN KEY (`StudentRequesting`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseadddroprequest`
--

LOCK TABLES `courseadddroprequest` WRITE;
/*!40000 ALTER TABLE `courseadddroprequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseadddroprequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseschedule`
--

DROP TABLE IF EXISTS `courseschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseschedule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Department` varchar(45) NOT NULL,
  `Year` varchar(45) NOT NULL,
  `Semester` varchar(45) NOT NULL,
  `Section` varchar(45) NOT NULL,
  `Room` varchar(45) NOT NULL,
  `Monday` varchar(45) DEFAULT NULL,
  `Tuesday` varchar(45) DEFAULT NULL,
  `Wednesday` varchar(45) DEFAULT NULL,
  `Thursday` varchar(45) DEFAULT NULL,
  `Friday` varchar(45) DEFAULT NULL,
  `Monday2` varchar(45) DEFAULT NULL,
  `Tuesday2` varchar(45) DEFAULT NULL,
  `Wednesday2` varchar(45) DEFAULT NULL,
  `Thursday2` varchar(45) DEFAULT NULL,
  `Friday2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseschedule`
--

LOCK TABLES `courseschedule` WRITE;
/*!40000 ALTER TABLE `courseschedule` DISABLE KEYS */;
INSERT INTO `courseschedule` VALUES (1,'Electrical','1','First','A','118','MAT','EMF','Free','EMF','Free','Free','Free','Free','DB','Free'),(2,'Electrical','2','Second','B','131','DB','ENG','Free','MAT','ENG','Free','DS','DS','Free','EMF'),(3,'Electrical','2','First','A','109','DS','DB','EMF','Free','Free','Free','Free','Free','DB','Free'),(4,'Electrical','3','Second','B','118','EMF','DS','DB','DS','DS','DB','DS','Free','Free','DS'),(5,'Electrical','3','First','A','131','ENG','Free','Free','DB','MAT','Free','Free','DS','MAT','Free'),(6,'Software','1','Second','B','109','MAT','DB','DS','Free','Free','DS','Free','Free','ENG','ENG'),(7,'Software','2','First','A','118','Free','Free','MAT','EMF','Free','ENG','MAT','Free','Free','DB'),(8,'Software','3','Second','B','109','MAT','ENG','EMF','Free','DB','Free','Free','MAT','DS','Free'),(9,'Civil','1','First','A','131','Free','DB','Free','Free','Free','DS','DS','Free','ENG','DB'),(10,'Civil','2','Second','B','118','ENG','ENG','MAT','MAT','ENG','Free','Free','Free','Free','EMF'),(11,'Civil','3','First','A','109','Free','DB','EMF','Free','Free','Free','DS','DS','DS','Free');
/*!40000 ALTER TABLE `courseschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DepartmentID` varchar(8) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `DepartmentH` varchar(11) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `InstructorID_idx` (`DepartmentH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('biomed','Biomed','BRT13'),('Civil','Civil','CRT13'),('ElecEng','ElectricalEngineering','ERT13'),('SME','Mechanical','MRT13'),('soft','Software','SRT13');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory`
--

DROP TABLE IF EXISTS `dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentD` varchar(45) NOT NULL,
  `compound` varchar(45) DEFAULT NULL,
  `blockNumber` varchar(45) DEFAULT NULL,
  `roomNumber` varchar(45) DEFAULT NULL,
  `RequestStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `StudentD_UNIQUE` (`StudentD`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `StudentD_idx` (`StudentD`),
  CONSTRAINT `StudentD` FOREIGN KEY (`StudentD`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES (1,'Atr/1111/11',NULL,NULL,NULL,'pending'),(2,'Atr/1212/12','B',NULL,NULL,'pending'),(3,'ATR/3333/11','A','103','008','pending');
/*!40000 ALTER TABLE `dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitoryreq`
--

DROP TABLE IF EXISTS `dormitoryreq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitoryreq` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StuduentD` varchar(45) NOT NULL,
  `preferedComp1` varchar(45) NOT NULL,
  `preferedComp2` varchar(45) DEFAULT NULL,
  `preferedComp3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `StuduentD_UNIQUE` (`StuduentD`),
  CONSTRAINT `StuduentD` FOREIGN KEY (`StuduentD`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitoryreq`
--

LOCK TABLES `dormitoryreq` WRITE;
/*!40000 ALTER TABLE `dormitoryreq` DISABLE KEYS */;
INSERT INTO `dormitoryreq` VALUES (1,'Atr/1212/12','A','B','C'),(7,'ATR/3333/11','dorm_a','dorm_a','dorm_a');
/*!40000 ALTER TABLE `dormitoryreq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `EventName` varchar(45) NOT NULL,
  `ClubName` varchar(45) NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Date` varchar(45) NOT NULL,
  `Place` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  PRIMARY KEY (`EventName`),
  KEY `ClubName_idx` (`ClubName`),
  CONSTRAINT `ClubName` FOREIGN KEY (`ClubName`) REFERENCES `clubs` (`ClubName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES ('Blood Donation','Red Cross','Approved','11-11-11','AAiT','2:30');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventschedule`
--

DROP TABLE IF EXISTS `eventschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventschedule` (
  `EventName` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `eventvenue` varchar(45) NOT NULL,
  `Startingtime` varchar(45) NOT NULL,
  `Endtime` varchar(45) NOT NULL,
  `Eventdescription` varchar(255) NOT NULL,
  PRIMARY KEY (`EventName`),
  UNIQUE KEY `Date_UNIQUE` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventschedule`
--

LOCK TABLES `eventschedule` WRITE;
/*!40000 ALTER TABLE `eventschedule` DISABLE KEYS */;
INSERT INTO `eventschedule` VALUES (' bfbaf ','2021-12-01','bdakjbdj','15:51','15:51','hgfhg'),(' exam ','2021-12-20','hall','00:00','15:04','no busy'),(' final exam ','2021-12-29','new','15:59','16:59','check 123'),(' gyyr ','2021-12-03','bdakjbdj','15:51','15:51','hgfhg'),(' hhhhhhh ','2021-12-08','HHHH','00:12','02:21','It is awesome'),(' SE mid exam ','2021-12-16','E118 Hall','19:30','22:00','none'),(' SE mid exam2 ','2021-12-17','nb','15:21','18:21','desc'),(' SE mid exam3 ','2021-12-22','nb2','20:30','16:00','not necessary');
/*!40000 ALTER TABLE `eventschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialaid`
--

DROP TABLE IF EXISTS `financialaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financialaid` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentFinanced` varchar(45) NOT NULL,
  `Reason` varchar(200) NOT NULL,
  `Status` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentFinanced_idx` (`StudentFinanced`),
  CONSTRAINT `StudentFinanced` FOREIGN KEY (`StudentFinanced`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialaid`
--

LOCK TABLES `financialaid` WRITE;
/*!40000 ALTER TABLE `financialaid` DISABLE KEYS */;
/*!40000 ALTER TABLE `financialaid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentIDs` varchar(45) NOT NULL,
  `CourseIDs` varchar(45) NOT NULL,
  `Result` varchar(45) NOT NULL,
  `ApprovalStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Student_idx` (`StudentIDs`),
  KEY `CourseID_idx` (`CourseIDs`),
  CONSTRAINT `CourseIDs` FOREIGN KEY (`CourseIDs`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `StudentIDs` FOREIGN KEY (`StudentIDs`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,'Atr/1111/11','ECEG','A','Approved');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradechangerequest`
--

DROP TABLE IF EXISTS `gradechangerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gradechangerequest` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `InstructorGC` varchar(45) NOT NULL,
  `CourseGC` varchar(45) NOT NULL,
  `Grievance` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Instructor_idx` (`InstructorGC`),
  KEY `Course_idx` (`CourseGC`),
  CONSTRAINT `CourseGC` FOREIGN KEY (`CourseGC`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `InstructorGC` FOREIGN KEY (`InstructorGC`) REFERENCES `instructor` (`InstructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradechangerequest`
--

LOCK TABLES `gradechangerequest` WRITE;
/*!40000 ALTER TABLE `gradechangerequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradechangerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `InstructorID` varchar(11) NOT NULL,
  `FullName` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Password` varchar(5) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `TelephoneNo` varchar(45) DEFAULT NULL,
  `OfficeNo` varchar(45) NOT NULL,
  `InstructorDepartment` varchar(45) NOT NULL,
  `Degree` varchar(45) NOT NULL,
  PRIMARY KEY (`InstructorID`),
  KEY `InstructorDepartment_idx` (`InstructorDepartment`),
  CONSTRAINT `InstructorDepartment` FOREIGN KEY (`InstructorDepartment`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('IDR/1111/11','Kebede Abebe','Male','1111',NULL,NULL,'E-123','ElecEng',''),('IDR/5433/03','Abebe Abebe','Male','11111',NULL,NULL,'E-123','ElecEng','');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lostid`
--

DROP TABLE IF EXISTS `lostid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lostid` (
  `sId` varchar(45) NOT NULL,
  `name` varchar(50) NOT NULL,
  `currentyear` varchar(45) NOT NULL,
  `Department` varchar(45) NOT NULL,
  `datelost` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='the table for lost id \n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lostid`
--

LOCK TABLES `lostid` WRITE;
/*!40000 ALTER TABLE `lostid` DISABLE KEYS */;
INSERT INTO `lostid` VALUES ('Atr/1111/11','mike','2011','111','11/11/11','approved'),('Atr/1112/12','mike12','akldf','kljasdf','akljf','Not approved'),('Atr/1212/11','mike','akldf','kljasdf','akljf','approved'),('Atr/1232/12','mike','2021','elec','dd/mm/yyyy','approved'),('ATR/3333/11','nati nati','2011','Elec','11/11/2001','approved');
/*!40000 ALTER TABLE `lostid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makeupexamrequest`
--

DROP TABLE IF EXISTS `makeupexamrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `makeupexamrequest` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentRequest` varchar(45) NOT NULL,
  `CourseRequest` varchar(45) NOT NULL,
  `InstructorRequest` varchar(45) NOT NULL,
  `Reason` varchar(200) NOT NULL,
  `AttachmentFilePath` varchar(100) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentRequest_idx` (`StudentRequest`),
  CONSTRAINT `StudentRequest` FOREIGN KEY (`StudentRequest`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makeupexamrequest`
--

LOCK TABLES `makeupexamrequest` WRITE;
/*!40000 ALTER TABLE `makeupexamrequest` DISABLE KEYS */;
INSERT INTO `makeupexamrequest` VALUES (7,'Atr/1111/11','ECEG','dddd','111','.//here.png','11/11/2002','denied'),(8,'Atr/1111/11','ECEG','dddd','111','.//images.jpg','11/11/2001','denied'),(9,'Atr/1111/11','ECEG','dddd','undefined','.//images.jpg','11/11/3000','denied'),(11,'Atr/1111/11','undefined','Ababe','Say whaaaaa','C:Files/MakeupExamRequest/MakeupExamRequest.pdf','11/11/2002','denied');
/*!40000 ALTER TABLE `makeupexamrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_table` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `studentName` varchar(45) NOT NULL,
  `dept` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `body` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `studentName_idx` (`studentName`),
  KEY `dept_idx` (`dept`),
  CONSTRAINT `dept` FOREIGN KEY (`dept`) REFERENCES `department` (`DepartmentID`),
  CONSTRAINT `studentName` FOREIGN KEY (`studentName`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(45) NOT NULL,
  `Details` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffevaluation`
--

DROP TABLE IF EXISTS `staffevaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffevaluation` (
  `Presentation_and_clarification_of_course` varchar(25) DEFAULT NULL,
  `Knowledge_of_the_subject` varchar(25) DEFAULT NULL,
  `Ability_to_arouse_students’_interest` varchar(25) DEFAULT NULL,
  `Providing_feedback_on_test` varchar(25) DEFAULT NULL,
  `Fairness_in_marking` varchar(25) DEFAULT NULL,
  `Respect_for_students` varchar(25) DEFAULT NULL,
  `Time_management` varchar(25) DEFAULT NULL,
  `StudentID` varchar(255) DEFAULT NULL,
  `InstructorID` varchar(255) DEFAULT NULL,
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `staffevaluation_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffevaluation`
--

LOCK TABLES `staffevaluation` WRITE;
/*!40000 ALTER TABLE `staffevaluation` DISABLE KEYS */;
INSERT INTO `staffevaluation` VALUES ('Strongly agree','Agree','Agree','Neutral','Diagree','Neutral','Diagree','Atr/1111/11','Kebede Abebe'),('Strongly agree','Agree','Neutral','Diagree','Strongly diagree','Diagree','Diagree','Atr/1111/11','Kebede Abebe'),('Strongly agree','Agree','Agree','Agree','Neutral','Diagree','Strongly diagree','Atr/1111/11','Kebede Abebe'),('Strongly agree','Agree','Strongly agree','Agree','Agree','Agree','Agree','Atr/1111/11','Kebede Abebe'),('Strongly agree','Strongly agree','Strongly agree','Strongly agree','Strongly agree','Strongly agree','Strongly agree','Atr/1111/11','Kebede Abebe'),('Strongly diagree','Strongly diagree','Strongly diagree','Strongly diagree','Strongly diagree','Strongly diagree','Strongly diagree','Atr/1111/11','Abebe Abebe');
/*!40000 ALTER TABLE `staffevaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentID` varchar(11) NOT NULL,
  `FullName` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `BirthDate` date NOT NULL,
  `Password` varchar(5) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `TelephoneNo` varchar(45) DEFAULT NULL,
  `StudentDepartment` varchar(45) NOT NULL,
  `RegistrationYear` varchar(45) NOT NULL,
  `CurrentYear` varchar(45) NOT NULL,
  `IDStatus` varchar(45) DEFAULT NULL,
  `CGPA` varchar(45) NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `DepartmentID_idx` (`StudentDepartment`),
  CONSTRAINT `StudentDepartment` FOREIGN KEY (`StudentDepartment`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Atr/0000/11','Lillian','male','2011-11-11','0000','1212@gmail.com','09111111','ElecEng','2011','2011','valid','4'),('Atr/0011/11','Natha','male','2011-11-11','1111','1212@gmail.com','09111111','biomed','2011','2011','valid','4'),('Atr/0505/11','NathanZK','male','2011-11-11','5555','1212@gmail.com','09111111','SME','2011','2011','valid','4'),('Atr/1111/11','nati nati','male','2001-11-11','1111','nathanzelalem100@gmail.com','1111111111111','ElecEng','2011','2011','active','4'),('Atr/1131/11','IDR/1111/11','male','2011-11-11','1111','1212@gmail.com','09111111','ElecEng','2011','2011','valid','4'),('Atr/1212/12','john john','male','2012-12-12','1111','1212@gmail.com','09111111','ElecEng','2011','2011','valid','4'),('atr/2222/11','nati nati','male','2001-11-11','1111','nathanzelalem100@gmail.com','1111111111111','ElecEng','2011','2011','active','4'),('ATR/3333/11','Ivan Jerganov','Male','1999-01-01','IvanD',NULL,NULL,'ElecEng','2015','2021','Active','3.7'),('Atr/4444/11','Joshua','male','2011-11-11','4444','1212@gmail.com','09111111','ElecEng','2011','2011','valid','4'),('ATR/5555/11','Bisrat','male','2011-11-11','5555','1212@gmail.com','09111111','ElecEng','2011','2011','valid','4'),('Atr/6777/11','NathanZK','male','2011-11-11','6666','1212@gmail.com','09111111','ElecEng','2011','2011','active','4');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_registration`
--

DROP TABLE IF EXISTS `student_course_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course_registration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentid` varchar(45) NOT NULL,
  `courseid` varchar(45) NOT NULL,
  `adminVerdict` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_registration`
--

LOCK TABLES `student_course_registration` WRITE;
/*!40000 ALTER TABLE `student_course_registration` DISABLE KEYS */;
INSERT INTO `student_course_registration` VALUES (3,'Atr/1111/11','ECEB','pending');
/*!40000 ALTER TABLE `student_course_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentofinstructor`
--

DROP TABLE IF EXISTS `studentofinstructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentofinstructor` (
  `year` int NOT NULL,
  `course` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `section` varchar(45) NOT NULL,
  `Stream` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentofinstructor`
--

LOCK TABLES `studentofinstructor` WRITE;
/*!40000 ALTER TABLE `studentofinstructor` DISABLE KEYS */;
INSERT INTO `studentofinstructor` VALUES (5,'Micro','ECEG','4A','Computer');
/*!40000 ALTER TABLE `studentofinstructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme` (
  `Name` varchar(45) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferrequest`
--

DROP TABLE IF EXISTS `transferrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferrequest` (
  `ID` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) NOT NULL,
  `lastName` varchar(245) NOT NULL,
  `dateOfBirth` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `expectedGradYear` varchar(45) NOT NULL,
  `cGPA` varchar(45) NOT NULL,
  `departmentTO` varchar(45) NOT NULL,
  `departmentFrom` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentTransfering_idx` (`firstName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferrequest`
--

LOCK TABLES `transferrequest` WRITE;
/*!40000 ALTER TABLE `transferrequest` DISABLE KEYS */;
INSERT INTO `transferrequest` VALUES ('Atr/1111/11','fff','Alehegn','Kebede','11/11/2002','Female','2011','3.3','wwwww','undefined');
/*!40000 ALTER TABLE `transferrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawalrequest`
--

DROP TABLE IF EXISTS `withdrawalrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawalrequest` (
  `ID` varchar(45) NOT NULL,
  `StudentWithdrawing` varchar(45) NOT NULL,
  `sex` varchar(100) NOT NULL,
  `Department` varchar(45) NOT NULL,
  `reason for withdrawal` varchar(450) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `StudentWithdrawing` FOREIGN KEY (`ID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawalrequest`
--

LOCK TABLES `withdrawalrequest` WRITE;
/*!40000 ALTER TABLE `withdrawalrequest` DISABLE KEYS */;
INSERT INTO `withdrawalrequest` VALUES ('Atr/1111/11','tttttt','Male','Elec','                     \r\nI am awesome\r\n          ');
/*!40000 ALTER TABLE `withdrawalrequest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-02  1:55:25
