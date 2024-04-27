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
------------------------------------------------
drop type if exists doc.[Document.TableType];
go
------------------------------------------------
create type doc.[Document.TableType] as table
(
	Id bigint,
	[Done] bit,
	[Number] nvarchar(32),
	[Date] date,
	[Sum] money,
	[Memo] nvarchar(255),
	-- Custom fields
	[Kind] nvarchar(16),
	[Agent] bigint
)
go
------------------------------------------------
drop type if exists doc.[Document.Row.TableType];
go
------------------------------------------------
create type doc.[Document.Row.TableType] as table
(
	Id bigint,
	RowNo int,
	[Memo] nvarchar(255),
	-- Custom fields
	[Item] bigint,
	[Qty] float,
	[Price] float,
	[Sum] money
)
go
