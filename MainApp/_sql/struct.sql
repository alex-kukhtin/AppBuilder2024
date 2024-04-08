﻿/*
main structure
*/
------------------------------------------------
if not exists(select * from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME=N'cat')
	exec sp_executesql N'create schema cat authorization dbo';
go
if not exists(select * from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME=N'doc')
	exec sp_executesql N'create schema doc authorization dbo';
go
------------------------------------------------
alter authorization on schema::cat to dbo;
alter authorization on schema::doc to dbo;
go
------------------------------------------------
grant execute on schema::cat to public;
grant execute on schema::doc to public;
go
------------------------------------------------
if not exists(select * from INFORMATION_SCHEMA.SEQUENCES where SEQUENCE_SCHEMA = N'cat' and SEQUENCE_NAME = N'SQ_Agents')
	create sequence cat.SQ_Agents as bigint start with 1000 increment by 1;
go
------------------------------------------------
if not exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA=N'cat' and TABLE_NAME=N'Agents')
create table cat.Agents
(
	Id bigint not null
		constraint DF_Agents_Id default(next value for cat.SQ_Agents)
		constraint PK_Agents primary key,
	[Void] bit not null
		constraint DF_Agents_Void default(0),
	[Name] nvarchar(255),
	[Memo] nvarchar(255),
	-- Custom fields
	[Code] nvarchar(12),
	[FullName] nvarchar(255)
);
go


