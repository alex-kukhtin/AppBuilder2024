/*
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
------------------------------------------------
if not exists(select * from INFORMATION_SCHEMA.SEQUENCES where SEQUENCE_SCHEMA = N'cat' and SEQUENCE_NAME = N'SQ_Items')
	create sequence cat.SQ_Items as bigint start with 1000 increment by 1;
go
------------------------------------------------
if not exists(select * from INFORMATION_SCHEMA.SEQUENCES where SEQUENCE_SCHEMA = N'cat' and SEQUENCE_NAME = N'SQ_Units')
	create sequence cat.SQ_Units as bigint start with 1000 increment by 1;
go
------------------------------------------------
if not exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA=N'cat' and TABLE_NAME=N'Units')
create table cat.Units
(
	Id bigint not null
		constraint DF_Units_Id default(next value for cat.SQ_Units)
		constraint PK_Units primary key,
	[Void] bit not null
		constraint DF_Units_Void default(0),
	[Name] nvarchar(255),
	[Memo] nvarchar(255),
	-- Custom fields
	[Short] nvarchar(8)
);
go
------------------------------------------------
if not exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA=N'cat' and TABLE_NAME=N'Items')
create table cat.Items
(
	Id bigint not null
		constraint DF_Items_Id default(next value for cat.SQ_Items)
		constraint PK_Items primary key,
	[Void] bit not null
		constraint DF_Items_Void default(0),
	[Name] nvarchar(255),
	[Memo] nvarchar(255),
	-- Custom fields
	[SKU] nvarchar(32),
	[BarCode] nvarchar(32),
	Unit bigint
		constraint FK_Items_Unit_Units foreign key references cat.Units(Id)
);
go

