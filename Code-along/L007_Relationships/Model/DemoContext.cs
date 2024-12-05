using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L007_Relationships.Model;

internal class RelationshipDemoContext : DbContext
{
    public DbSet<Student> Students { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var connectionString = new SqlConnectionStringBuilder()
        {
            ServerSPN = "localhost",
            InitialCatalog = "relationalDemo",
            TrustServerCertificate = true,
            IntegratedSecurity = true,
        }.ToString();

        optionsBuilder.UseSqlServer(connectionString);
    }
}

public class Course
{
    public int CourseId { get; set; }
}

public class Student
{
    public int StudentId { get; set; }

    public required string FirstName { get; set; }
    public required string LastName { get; set; }

    public DateOnly? DateOfBirth { get; set; }

}
