/*
table types
*/
------------------------------------------------
drop type if exists cat.[Agent.TableType];
go
------------------------------------------------
create type cat.[Agent.TableType] as table
(
	Id bigint,
	[Name] nvarchar(255),
	[Memo] nvarchar(255),
	-- Custom fields
	[Code] nvarchar(12),
	[FullName] nvarchar(255)
)
go

------------------------------------------------
drop type if exists cat.[Item.TableType];
go
------------------------------------------------
create type cat.[Item.TableType] as table
(
	Id bigint,
	[Name] nvarchar(255),
	[Memo] nvarchar(255),
	-- Custom fields
	[SKU] nvarchar(32),
	[BarCode] nvarchar(32),
	Unit bigint
)
go

