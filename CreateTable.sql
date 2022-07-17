CREATE TABLE [Student](
	[StudentId] [nchar](15) NOT NULL Primary key,	
	[Name] [nvarchar](150) NOT NULL,
	[Dob] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,	
)


CREATE TABLE [Lectures](
	[LecturesId] [nchar](15) NOT NULL Primary key,
	[Dob] [date] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
)


CREATE TABLE [Subject](
	[SubjectId] [nchar](15) NOT NULL Primary key,
	[SubjectName] [nvarchar](50) NOT NULL,
)
CREATE TABLE [Semester](
	[SemesterId] [nchar](15) NOT NULL Primary key,
	[SemesterName] [nchar](15) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
)
CREATE TABLE [Group](
	[GroupId] [nchar](15) NOT NULL Primary key,
	[SubjectId] [nchar](15) NOT NULL,
	[SemesterId] [nchar](15) NOT NULL,
	Constraint FK_Group_Subject foreign key (SubjectId) references [Subject](SubjectId),
	Constraint FK_Group_Semester foreign key (SemesterId) references [Semester](SemesterId)
)

CREATE TABLE [Student_Group](
	[StudentId] [nchar](15) NOT NULL,
	[GroupId] [nchar](15) NOT NULL,
	CONSTRAINT pk_Student_Group PRIMARY KEY(StudentID,GroupId),
	CONSTRAINT fk_Student FOREIGN KEY (StudentId) REFERENCES Student([StudentId]),
	CONSTRAINT fk_Group FOREIGN KEY (GroupId) REFERENCES [Group](GroupId)
)

CREATE TABLE [Lectures_Group](
	[LecturesId] [nchar](15) NOT NULL,
	[GroupId] [nchar](15) NOT NULL,
	CONSTRAINT pk_Lectures_Group PRIMARY KEY(LecturesId,GroupId),
	CONSTRAINT fk_Lectures FOREIGN KEY (LecturesId) REFERENCES [Lectures](LecturesId),
	CONSTRAINT fk_Group1 FOREIGN KEY (GroupId) REFERENCES [Group](GroupId)
) 

CREATE TABLE [Category](
	[CateId] [nchar](15) NOT NULL Primary key,
	[Name] [nchar](15) NOT NULL,	
	[Part] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[CompletionCiteria] [float] NOT NULL,	
	[SubjectId] [nchar](15) NOT NULL,
	Constraint FK_Category_Subject foreign key (SubjectId) references [Subject](SubjectId)
)

CREATE TABLE [Assessment](
	[StudentId] [nchar](15) NOT NULL,
	[AssId] [nchar](15) NOT NULL,
	[Mark] [float] NOT NULL,
	Constraint pk_Ass_Student Primary key(AssId,StudentId),
	Constraint fk_Assessment foreign key (AssId) references [Category](CateId),
	Constraint fk_Student1 foreign key (StudentId) references [Student](StudentId) 
)
