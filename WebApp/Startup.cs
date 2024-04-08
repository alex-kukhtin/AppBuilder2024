// Copyright © 2024 Oleksandr Kukhtin. All rights reserved.

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace WebApp;

public class Startup(IConfiguration configuration)
{
	public IConfiguration Configuration { get; } = configuration;

	public void ConfigureServices(IServiceCollection services)
	{
		services.UsePlatform(Configuration);
	}

	public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
	{
		app.ConfigurePlatform(env, Configuration);
	}
}
