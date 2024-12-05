using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace L004_Intro_EFcore.Migrations
{
    /// <inheritdoc />
    public partial class RenameRatingColumn : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Rating",
                table: "Blogs",
                newName: "RatingRenamed");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "RatingRenamed",
                table: "Blogs",
                newName: "Rating");
        }
    }
}
