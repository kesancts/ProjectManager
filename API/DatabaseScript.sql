CREATE Database projectDB

USE [projectDB]
GO

CREATE TABLE [dbo].[ParentTask] (
    [Parent_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Parent_Task] VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Parent_ID] ASC)
);

CREATE TABLE [dbo].[Project] (
     [Project_ID]  INT           IDENTITY (1, 1) NOT NULL,
    [Start_Date]  DATE          NULL,
    [End_Date]    DATE          NULL,
    [Priority]    INT           NULL,
    [ProjectName] VARCHAR (100) NULL,
    [Manager]     VARCHAR (100) NULL
    PRIMARY KEY CLUSTERED ([Project_ID] ASC)
);

CREATE TABLE [dbo].[Task] (
     [Task_ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Parent_ID]  INT           NULL,
    [Project_ID] INT           NULL,
    [Task_name]  VARCHAR (100) NULL,
    [Start_Date] DATE          NULL,
    [End_Date]   DATE          NULL,
    [Priority]   INT           NULL,
    [Status]     VARCHAR (15)  NULL,
    [user_id]    INT           NULL
    PRIMARY KEY CLUSTERED ([Task_ID] ASC),
    FOREIGN KEY ([Parent_ID]) REFERENCES [dbo].[ParentTask] ([Parent_ID]),
    FOREIGN KEY ([Project_ID]) REFERENCES [dbo].[Project] ([Project_ID])
);

CREATE TABLE [dbo].[Users] (
     [User_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [First_Name]  VARCHAR (100) NULL,
    [Last_Name]   VARCHAR (100) NULL,
    [Employee_ID] INT           NULL 
); 
ALTER TABLE [dbo].[Users]
    ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([User_ID] ASC);

CREATE TABLE [dbo].[Error] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [Error_Message]     VARCHAR (100) NULL,
    [Error_Description] VARCHAR (200) NULL,
    [Error_Date]        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);