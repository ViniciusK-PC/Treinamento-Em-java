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
    private static final String URL = "jdbc:postgresql://localhost:5432/seubanco";
    private static final String USER = "postgres";
    private static final String PASSWORD = "teste12";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

// -- Implementar Operações CRUD

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EstadoDAO {
    public void createEstado(String nome, String sigla) throws SQLException {
        String sql = "INSERT INTO Estados (nome, sigla) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, nome);
            pstmt.setString(2, sigla);
            pstmt.executeUpdate();
        }
    }

    public void retrieveEstados() throws SQLException {
        String sql = "SELECT * FROM Estados";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id") + ", Nome: " + rs.getString("nome") + ", Sigla: " + rs.getString("sigla"));
            }
        }
    }

    public void updateEstado(int id, String nome, String sigla) throws SQLException {
        String sql = "UPDATE Estados SET nome = ?, sigla = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, nome);
            pstmt.setString(2, sigla);
            pstmt.setInt(3, id);
            pstmt.executeUpdate();
        }
    }

    public void deleteEstado(int id) throws SQLException {
        String sql = "DELETE FROM Estados WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
}