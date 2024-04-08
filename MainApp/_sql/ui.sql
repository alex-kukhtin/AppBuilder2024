/*
ui
*/
begin
	set nocount on;

	-- select newid(), newid(), newid();

	declare @menu a2ui.[Menu.TableType];

	declare @moduleId uniqueidentifier = N'A056EB10-62F6-40B1-9C38-51B45B458B33';

	exec a2ui.RegisterModule @ModuleId = @moduleId, @Name = N'Main'
	exec a2ui.[Tenant.ConnectModule] @ModuleId = @moduleId, @TenantId = 1;

	insert into @menu(Id, Parent, [Order], [Name], [Url], CreateName, CreateUrl, Icon, ClassName) 
	values
		(N'00000000-0000-0000-0000-000000000000', null,  
			0, N'Main', null, null, null, null, null),
		(N'7B72A89B-4608-43B2-B402-1A184F66A2AA', N'00000000-0000-0000-0000-000000000000',  
			10, N'@[Catalogs]',	 null, null, null,  N'items', 'border-bottom'),

		(N'5E614DAA-8A5F-4EC9-BC32-E46FA4ACFA0C', N'00000000-0000-0000-0000-000000000000',  
			30, N'@[Documents]', null, null, null,  N'file-content', null),

		(N'FDC45B07-7F1E-4CFC-A53A-828905D297B3', N'7B72A89B-4608-43B2-B402-1A184F66A2AA',  
			10, N'@[General]',  null, null, null,  null, null),

		(N'319F639C-2CAB-42ED-810A-42BD2C1980D4', N'FDC45B07-7F1E-4CFC-A53A-828905D297B3', 
			10, N'@[Agents]',  N'page:/catalog/agent/index/0',  null, null, null, null),
		(N'E92358BF-CD48-4973-BCB3-FF9D7499015B', N'FDC45B07-7F1E-4CFC-A53A-828905D297B3', 
			20, N'@[Items]',   N'page:/catalog/item/index/0',  null, null, null, null);


	
	exec a2ui.[Menu.Merge] 1, @menu, @ModuleId;
end
go

--delete from a2ui.Menu;

