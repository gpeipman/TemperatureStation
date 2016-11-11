using Microsoft.EntityFrameworkCore.Migrations;

namespace TemperatureStation.Web.Data.Migrations
{
    public partial class SensorRelationFix : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Readings_Measurements_MeasurementId",
                table: "Readings");

            migrationBuilder.DropIndex(
                name: "IX_Readings_MeasurementId",
                table: "Readings");

            migrationBuilder.DropColumn(
                name: "MeasurementId",
                table: "Readings");

            migrationBuilder.AddColumn<int>(
                name: "SensorRoleId",
                table: "Readings",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Readings_SensorRoleId",
                table: "Readings",
                column: "SensorRoleId");

            migrationBuilder.AddForeignKey(
                name: "FK_Readings_SensorRoles_SensorRoleId",
                table: "Readings",
                column: "SensorRoleId",
                principalTable: "SensorRoles",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Readings_SensorRoles_SensorRoleId",
                table: "Readings");

            migrationBuilder.DropIndex(
                name: "IX_Readings_SensorRoleId",
                table: "Readings");

            migrationBuilder.DropColumn(
                name: "SensorRoleId",
                table: "Readings");

            migrationBuilder.AddColumn<int>(
                name: "MeasurementId",
                table: "Readings",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Readings_MeasurementId",
                table: "Readings",
                column: "MeasurementId");

            migrationBuilder.AddForeignKey(
                name: "FK_Readings_Measurements_MeasurementId",
                table: "Readings",
                column: "MeasurementId",
                principalTable: "Measurements",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
