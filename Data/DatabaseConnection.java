// -- Exercicios

// -- 1) Faça os códigos vistos anteriormente funcionarem conectando a sua base de dados (PostgreSQL
// -- ou JavaDB ou MySQL, etc).
// -- 2) Continue desenvolvendo a aplicação swing, também disponível no Sapu, para permitir os
// -- cadastros das tabelas que temos


// -- Conexão com o Banco de Dados

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/postgres";
    private static final String USER = "postgres";
    private static final String PASSWORD = "postgres";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
