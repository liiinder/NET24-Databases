using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L007_Relationships.Model;

internal class RelationshipDemoContext : DbContext
{
    public DbSet<Student> Students { get; set; }
    public DbSet<Course> Courses { get; set; }

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

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        //var courseData = new[]
        //{
        //    new Course() { CourseId = 1, Name = "C# programming"},
        //    new Course() { CourseId = 2, Name = "Databases"},
        //};

        //modelBuilder.Entity<Course>()
        //    .HasData(courseData);

        //var studentData = new[]
        //{
        //    new Student() { StudentId = 1, FirstName = "Anders", LastName = "Andersson", CourseId = 1 },
        //    new Student() { StudentId = 2, FirstName = "Bengt", LastName = "Bengtsson", CourseId = 1 },
        //    new Student() { StudentId = 3, FirstName = "Carl", LastName = "Carlsson", CourseId = 2 },
        //    new Student() { StudentId = 4, FirstName = "David", LastName = "Davidsson", CourseId = 2 },
        //    new Student() { StudentId = 5, FirstName = "Erik", LastName = "Eriksson", CourseId = 2 },
        //};

        //modelBuilder.Entity<Student>()
        //    .HasData(studentData);

    }
}

[DebuggerDisplay("{CourseId, nq}: {Name, nq}")]
public class Course
{
    public int CourseId { get; set; }
    public string Name { get; set; }

    public List<Student> Students { get; set; }
}

[DebuggerDisplay("{StudentId, nq}: {FirstName, nq} {LastName, nq}")]
public class Student
{
    public int StudentId { get; set; }

    [Required]
    public required string FirstName { get; set; }

    [Required]
    public required string LastName { get; set; }

    public DateOnly? DateOfBirth { get; set; }

    public List<Course> Courses { get; set; }

    //public int CourseId { get; set; }
}
