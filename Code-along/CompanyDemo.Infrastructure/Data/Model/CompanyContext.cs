using CompanyDemo.Domain;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Emit;

namespace CompanyDemo.Infrastructure.Data.Model;

public partial class CompanyContext : DbContext
{
    public CompanyContext()
    {
    }

    public CompanyContext(DbContextOptions<CompanyContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<EmployeeTerritory> EmployeeTerritories { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderDetail> OrderDetails { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<Region> Regions { get; set; }

    public virtual DbSet<Supplier> Suppliers { get; set; }

    public virtual DbSet<Territory> Territories { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Initial Catalog=Everyloop;Integrated Security=True;Trust Server Certificate=True;Server SPN=localhost");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("Finnish_Swedish_CI_AS");

        new CustomerEntityTypeConfiguration().Configure(modelBuilder.Entity<Customer>());
        new EmployeeEntityTypeConfiguration().Configure(modelBuilder.Entity<Employee>());
        new OrderEntityTypeConfiguration().Configure(modelBuilder.Entity<Order>());
        new OrderDetailEntityTypeConfiguration().Configure(modelBuilder.Entity<OrderDetail>());
        new ProductEntityTypeConfiguration().Configure(modelBuilder.Entity<Product>());
        new RegionEntityTypeConfiguration().Configure(modelBuilder.Entity<Region>());
        new SupplierEntityTypeConfiguration().Configure(modelBuilder.Entity<Supplier>());
        new TerritoryEntityTypeConfiguration().Configure(modelBuilder.Entity<Territory>());

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
