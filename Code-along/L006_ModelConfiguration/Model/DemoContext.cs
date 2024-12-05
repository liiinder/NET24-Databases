using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L006_ModelConfiguration.Model
{
    internal class DemoContext : DbContext
    {
        public DbSet<Student> Students { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var connectionString = new SqlConnectionStringBuilder()
            {
                ServerSPN = "localhost",
                InitialCatalog = "demoDB",
                TrustServerCertificate = true,
                IntegratedSecurity = true,
                //UserID = "iths",
                //Password = "iths"
            }.ToString();

            optionsBuilder.UseSqlServer(connectionString);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Student>()
                .ToTable("Students", "ITHS")
                .HasKey(s => s.FirstName);     // Use FirstName as primary key.

                // Making FirstName and LastName as composite key.
                //.HasKey(s => new { s.FirstName, s.LastName });

            modelBuilder.Entity<Student>().Ignore(s => s.RequiredInt);

            modelBuilder.Entity<Student>()
                .Property(s => s.DateOfBirth)
                .HasColumnName("Birthday")
                .HasColumnType("Date");

            modelBuilder.Entity<Student>()
                .Property<string>("ShadowData");
        }
    }

    [Table("MyStudents", Schema="ITHS")]
    public class Student
    {
        public int StudentId { get; set; }

        //public Guid StudentId { get; set; }

        [NotMapped]
        public int? OptionalInt { get; set; }
        
        public int RequiredInt { get; set; }

        public required string FirstName { get; set; }
        public required string LastName { get; set; }

        [Column("BirthDate")]
        public DateOnly? DateOfBirth { get; set; }

    }
}
