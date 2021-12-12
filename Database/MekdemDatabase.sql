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
  PRIMARY KEY (`AdministratorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('AGF/4342/05','Holden Tudicks','Male','Hodde',NULL,NULL);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `AssessmentName` varchar(45) NOT NULL,
  `Students` varchar(45) NOT NULL,
  `Courses` varchar(45) NOT NULL,
  `Result` double NOT NULL,
  PRIMARY KEY (`AssessmentName`),
  KEY `StudentID_idx` (`Students`),
  KEY `Courses_idx` (`Courses`),
  CONSTRAINT `Courses` FOREIGN KEY (`Courses`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `Students` FOREIGN KEY (`Students`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
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
  PRIMARY KEY (`ID`),
  KEY `CourseID_idx` (`Course`),
  KEY `InstructorID_idx` (`InstructorID`),
  CONSTRAINT `Course` FOREIGN KEY (`Course`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `InstructorID` FOREIGN KEY (`InstructorID`) REFERENCES `instructor` (`InstructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
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
  `Assignment` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentID_idx` (`Student`),
  KEY `Assignment_idx` (`Assignment`),
  CONSTRAINT `Assignment` FOREIGN KEY (`Assignment`) REFERENCES `assignments` (`ID`),
  CONSTRAINT `Student` FOREIGN KEY (`Student`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentsubmission`
--

LOCK TABLES `assignmentsubmission` WRITE;
/*!40000 ALTER TABLE `assignmentsubmission` DISABLE KEYS */;
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
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentCleared` varchar(45) NOT NULL,
  `Status` varchar(45) NOT NULL,
  `ClearanceReason` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentCleared_idx` (`StudentCleared`),
  CONSTRAINT `StudentCleared` FOREIGN KEY (`StudentCleared`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clearance`
--

LOCK TABLES `clearance` WRITE;
/*!40000 ALTER TABLE `clearance` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
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
  PRIMARY KEY (`ID`),
  KEY `StudentCostSharing_idx` (`StudentCostSharing`),
  CONSTRAINT `StudentCostSharing` FOREIGN KEY (`StudentCostSharing`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costsharing`
--

LOCK TABLES `costsharing` WRITE;
/*!40000 ALTER TABLE `costsharing` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student`
--

LOCK TABLES `course_student` WRITE;
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DepartmentID` varchar(8) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `DepartmentHead` varchar(8) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `InstructorID_idx` (`DepartmentHead`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('ElecEng','ElectricalEngineering','ERT13');
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
  `Location` varchar(45) NOT NULL,
  `RequestStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentD_idx` (`StudentD`),
  CONSTRAINT `StudentD` FOREIGN KEY (`StudentD`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
/*!40000 ALTER TABLE `dormitory` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventschedule`
--

DROP TABLE IF EXISTS `eventschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventschedule` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(45) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Start-EndTime` varchar(45) NOT NULL,
  `Location` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `EventName_idx` (`EventName`),
  CONSTRAINT `EventName` FOREIGN KEY (`EventName`) REFERENCES `events` (`EventName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventschedule`
--

LOCK TABLES `eventschedule` WRITE;
/*!40000 ALTER TABLE `eventschedule` DISABLE KEYS */;
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
  `SupportingFilePath` varchar(100) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
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
INSERT INTO `instructor` VALUES ('IDR/5433/03','Mike Litories','Male','Mikey',NULL,NULL,'E-123','ElecEng');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
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
  KEY `CourseRequest_idx` (`CourseRequest`),
  KEY `InstructorRequest_idx` (`InstructorRequest`),
  CONSTRAINT `CourseRequest` FOREIGN KEY (`CourseRequest`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `InstructorRequest` FOREIGN KEY (`InstructorRequest`) REFERENCES `instructor` (`InstructorID`),
  CONSTRAINT `StudentRequest` FOREIGN KEY (`StudentRequest`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makeupexamrequest`
--

LOCK TABLES `makeupexamrequest` WRITE;
/*!40000 ALTER TABLE `makeupexamrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `makeupexamrequest` ENABLE KEYS */;
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
  `ID` int NOT NULL AUTO_INCREMENT,
  `Staff` varchar(45) NOT NULL,
  `Criteria1` varchar(45) NOT NULL,
  `Criteria2` varchar(45) NOT NULL,
  `Criteria3` varchar(45) NOT NULL,
  `Criteria4` varchar(45) NOT NULL,
  `Criteria5` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Staff_idx` (`Staff`),
  CONSTRAINT `Staff` FOREIGN KEY (`Staff`) REFERENCES `instructor` (`InstructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffevaluation`
--

LOCK TABLES `staffevaluation` WRITE;
/*!40000 ALTER TABLE `staffevaluation` DISABLE KEYS */;
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
INSERT INTO `student` VALUES ('ATR/3333/11','Ivan Jerganov','Male','1999-01-01','IvanJ',NULL,NULL,'ElecEng','2015','2021','Active','3.7');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
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
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentTransfering` varchar(45) NOT NULL,
  `ReasonForRequest` varchar(200) NOT NULL,
  `DestinationDepartment` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentTransfering_idx` (`StudentTransfering`),
  CONSTRAINT `StudentTransfering` FOREIGN KEY (`StudentTransfering`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferrequest`
--

LOCK TABLES `transferrequest` WRITE;
/*!40000 ALTER TABLE `transferrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawalrequest`
--

DROP TABLE IF EXISTS `withdrawalrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawalrequest` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentWithdrawing` varchar(45) NOT NULL,
  `WithdrawalReason` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentWithdrawing_idx` (`StudentWithdrawing`),
  CONSTRAINT `StudentWithdrawing` FOREIGN KEY (`StudentWithdrawing`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawalrequest`
--

LOCK TABLES `withdrawalrequest` WRITE;
/*!40000 ALTER TABLE `withdrawalrequest` DISABLE KEYS */;
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

-- Dump completed on 2021-12-12 16:09:16
