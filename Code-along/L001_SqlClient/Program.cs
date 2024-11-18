
using Microsoft.Data.SqlClient;

var connectionString = "Server=localhost;Database=everyloop;Trusted_Connection=True;TrustServerCertificate=True;";
var query = """
select 
    top 5 * 
from 
    users;
""";

using (var connection = new SqlConnection(connectionString))
using (var command = new SqlCommand(query, connection))
{
    connection.Open();

    using (var reader = command.ExecuteReader())
    {
        for (int i = 0; i < reader.FieldCount; i++)
        {
            Console.WriteLine($"{reader.GetName(i),-20}{reader.GetDataTypeName(i)}");
        }

        Console.WriteLine();

        while (reader.Read())
        {
            for (int i = 0; i < reader.FieldCount; i++)
            {
                Console.Write($"{reader.GetValue(i)}, ");
            }
            Console.WriteLine();
        }
    }
}