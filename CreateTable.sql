CREATE TABLE [Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL Primary key,	
	[Name] [nvarchar](150) NOT NULL,
	[Dob] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,	
)


CREATE TABLE [Lectures](
	[LecturesId] [int] IDENTITY(1,1) NOT NULL Primary key,
	[Dob] [date] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
)



CREATE TABLE [Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL Primary key,
	[SubjectCode] [nchar](10) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
)
CREATE TABLE [Semester](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL Primary key,
	[SemesterName] [nchar](15) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
)
CREATE TABLE [Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL Primary key,
	[GroupCode] [nchar](10) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
	Constraint FK_Group_Subject foreign key (SubjectId) references [Subject](SubjectId),
	Constraint FK_Group_Semester foreign key (SemesterId) references [Semester](SemesterId)
)

CREATE TABLE [Student_Group](
	[StudentId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	CONSTRAINT pk_Student_Group PRIMARY KEY(StudentID,GroupId),
	CONSTRAINT fk_Student FOREIGN KEY (StudentId) REFERENCES Student([StudentId]),
	CONSTRAINT fk_Group FOREIGN KEY (StudentId) REFERENCES [Group](GroupId)
)

CREATE TABLE [Lectures_Group](
	[LecturesId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	CONSTRAINT pk_Lectures_Group PRIMARY KEY(LecturesId,GroupId),
	CONSTRAINT fk_Lectures FOREIGN KEY (LecturesId) REFERENCES [Lectures](LecturesId),
	CONSTRAINT fk_Group1 FOREIGN KEY (GroupId) REFERENCES [Group](GroupId)
) 

CREATE TABLE [Category](
	[CateId] [int] IDENTITY(1,1) NOT NULL Primary key,
	[Name] [nchar](15) NOT NULL,
	[Type] [nvarchar](15) NULL,
	[Part] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[CompletionCiteria] [int] NOT NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[Noquestion] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	Constraint FK_Category_Subject foreign key (SubjectId) references [Subject](SubjectId)
)

CREATE TABLE [Assessment](
	[StudentId] [int] NOT NULL,
	[AssId] [int] NOT NULL,
	[Mark] [int] NOT NULL,
	Constraint pk_Ass_Student Primary key(AssId,StudentId),
	Constraint fk_Assessment foreign key (AssId) references [Category](CateId),
	Constraint fk_Student1 foreign key (StudentId) references [Student](StudentId) 
)