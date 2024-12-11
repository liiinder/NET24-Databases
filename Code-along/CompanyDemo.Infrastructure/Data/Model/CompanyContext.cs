using CompanyDemo.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
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

public class CategoryEntityTypeConfiguration : IEntityTypeConfiguration<Category>
{
    public void Configure(EntityTypeBuilder<Category> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_Categories");

        builder.ToTable("categories", "company");

        builder.Property(e => e.Id).ValueGeneratedNever();
        builder.Property(e => e.CategoryName).HasMaxLength(50);
        builder.Property(e => e.Description).HasMaxLength(100);
    }
}

public class CustomerEntityTypeConfiguration : IEntityTypeConfiguration<Customer>
{
    public void Configure(EntityTypeBuilder<Customer> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_Customers");

        builder.ToTable("customers", "company");

        builder.Property(e => e.Id).HasMaxLength(10);
        builder.Property(e => e.Address).HasMaxLength(100);
        builder.Property(e => e.City).HasMaxLength(50);
        builder.Property(e => e.CompanyName).HasMaxLength(100);
        builder.Property(e => e.ContactName).HasMaxLength(50);
        builder.Property(e => e.ContactTitle).HasMaxLength(50);
        builder.Property(e => e.Country).HasMaxLength(50);
        builder.Property(e => e.Fax).HasMaxLength(50);
        builder.Property(e => e.Phone).HasMaxLength(50);
        builder.Property(e => e.PostalCode).HasMaxLength(20);
        builder.Property(e => e.Region).HasMaxLength(50);
    }
}

public class EmployeeEntityTypeConfiguration : IEntityTypeConfiguration<Employee>
{
    public void Configure(EntityTypeBuilder<Employee> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_Employees");

        builder.ToTable("employees", "company");

        builder.Property(e => e.Id).ValueGeneratedNever();
        builder.Property(e => e.Address).HasMaxLength(50);
        builder.Property(e => e.BirthDate).HasMaxLength(10);
        builder.Property(e => e.City).HasMaxLength(20);
        builder.Property(e => e.Country).HasMaxLength(10);
        builder.Property(e => e.Extension).HasMaxLength(10);
        builder.Property(e => e.FirstName).HasMaxLength(20);
        builder.Property(e => e.HireDate).HasMaxLength(10);
        builder.Property(e => e.HomePhone).HasMaxLength(50);
        builder.Property(e => e.LastName).HasMaxLength(20);
        builder.Property(e => e.Notes).HasMaxLength(500);
        builder.Property(e => e.PhotoPath).HasMaxLength(100);
        builder.Property(e => e.PostalCode).HasMaxLength(20);
        builder.Property(e => e.Region).HasMaxLength(13);
        builder.Property(e => e.Title).HasMaxLength(50);
        builder.Property(e => e.TitleOfCourtesy).HasMaxLength(10);
    }
}

public class EmployeeTerritoryEntityTypeConfiguration : IEntityTypeConfiguration<EmployeeTerritory>
{
    public void Configure(EntityTypeBuilder<EmployeeTerritory> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_EmployeeTerritory");

        builder.ToTable("employee_territory", "company");

        builder.Property(e => e.Id).HasMaxLength(7);

        builder.HasOne(d => d.Employee).WithMany(p => p.EmployeeTerritories)
            .HasForeignKey(d => d.EmployeeId)
            .HasConstraintName("FK_EmployeeTerritory_Employees");

        builder.HasOne(d => d.Territory).WithMany(p => p.EmployeeTerritories)
            .HasForeignKey(d => d.TerritoryId)
            .HasConstraintName("FK_EmployeeTerritory_Territories");
    }
}
public class OrderEntityTypeConfiguration : IEntityTypeConfiguration<Order>
{
    public void Configure(EntityTypeBuilder<Order> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_Orders");

        builder.ToTable("orders", "company");

        builder.Property(e => e.Id).ValueGeneratedNever();
        builder.Property(e => e.CustomerId).HasMaxLength(10);
        builder.Property(e => e.OrderDate).HasMaxLength(10);
        builder.Property(e => e.RequiredDate).HasMaxLength(10);
        builder.Property(e => e.ShipAddress).HasMaxLength(100);
        builder.Property(e => e.ShipCity).HasMaxLength(50);
        builder.Property(e => e.ShipCountry).HasMaxLength(50);
        builder.Property(e => e.ShipName).HasMaxLength(100);
        builder.Property(e => e.ShipPostalCode).HasMaxLength(20);
        builder.Property(e => e.ShipRegion).HasMaxLength(50);
        builder.Property(e => e.ShippedDate).HasMaxLength(10);

        builder.HasOne(d => d.Customer).WithMany(p => p.Orders)
            .HasForeignKey(d => d.CustomerId)
            .HasConstraintName("FK_Orders_Customers");

        builder.HasOne(d => d.Employee).WithMany(p => p.Orders)
            .HasForeignKey(d => d.EmployeeId)
            .HasConstraintName("FK_Orders_Employees");
    }
}
public class OrderDetailEntityTypeConfiguration : IEntityTypeConfiguration<OrderDetail>
{
    public void Configure(EntityTypeBuilder<OrderDetail> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_OrderDetails");

        builder.ToTable("order_details", "company");

        builder.Property(e => e.Id).HasMaxLength(10);

        builder.HasOne(d => d.Order).WithMany(p => p.OrderDetails)
            .HasForeignKey(d => d.OrderId)
            .HasConstraintName("FK_OrderDetails_Orders");

        builder.HasOne(d => d.Product).WithMany(p => p.OrderDetails)
            .HasForeignKey(d => d.ProductId)
            .HasConstraintName("FK_OrderDetails_Products");
    }
}

public class ProductEntityTypeConfiguration : IEntityTypeConfiguration<Product>
{
    public void Configure(EntityTypeBuilder<Product> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_Products");

        builder.ToTable("products", "company");

        builder.Property(e => e.Id).ValueGeneratedNever();
        builder.Property(e => e.ProductName).HasMaxLength(100);
        builder.Property(e => e.QuantityPerUnit).HasMaxLength(50);

        builder.HasOne(d => d.Category).WithMany(p => p.Products)
            .HasForeignKey(d => d.CategoryId)
            .HasConstraintName("FK_Products_Categories");

        builder.HasOne(d => d.Supplier).WithMany(p => p.Products)
            .HasForeignKey(d => d.SupplierId)
            .HasConstraintName("FK_Products_Suppliers");
    }
}

public class RegionEntityTypeConfiguration : IEntityTypeConfiguration<Region>
{
    public void Configure(EntityTypeBuilder<Region> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_Regions");

        builder.ToTable("regions", "company");

        builder.Property(e => e.Id).ValueGeneratedNever();
        builder.Property(e => e.RegionDescription).HasMaxLength(20);
    }
}


public class SupplierEntityTypeConfiguration : IEntityTypeConfiguration<Supplier>
{
    public void Configure(EntityTypeBuilder<Supplier> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_Suppliers");

        builder.ToTable("suppliers", "company");

        builder.Property(e => e.Id).ValueGeneratedNever();
        builder.Property(e => e.Address).HasMaxLength(100);
        builder.Property(e => e.City).HasMaxLength(50);
        builder.Property(e => e.CompanyName).HasMaxLength(100);
        builder.Property(e => e.ContactName).HasMaxLength(50);
        builder.Property(e => e.ContactTitle).HasMaxLength(50);
        builder.Property(e => e.Country).HasMaxLength(50);
        builder.Property(e => e.Fax).HasMaxLength(50);
        builder.Property(e => e.HomePage).HasMaxLength(100);
        builder.Property(e => e.Phone).HasMaxLength(50);
        builder.Property(e => e.PostalCode).HasMaxLength(20);
        builder.Property(e => e.Region).HasMaxLength(50);
    }
}

public class TerritoryEntityTypeConfiguration : IEntityTypeConfiguration<Territory>
{
    public void Configure(EntityTypeBuilder<Territory> builder)
    {
        builder.HasKey(e => e.Id).HasName("PK_Territories");

        builder.ToTable("territories", "company");

        builder.Property(e => e.Id).ValueGeneratedNever();
        builder.Property(e => e.TerritoryDescription).HasMaxLength(50);

        builder.HasOne(d => d.Region).WithMany(p => p.Territories)
            .HasForeignKey(d => d.RegionId)
            .HasConstraintName("FK_Territories_Regions");
    }
}