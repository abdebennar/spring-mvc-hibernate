package fr.cinema.init;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

public class DatabaseSeeder {

    private final DataSource dataSource;

    public DatabaseSeeder(DataSource dataSource) {
        this.dataSource = dataSource;
        seed();
    }

    private void seed() {
        try (Connection conn = dataSource.getConnection(); Statement stmt = conn.createStatement()) {

            // Create users table
            stmt.execute("""
                CREATE TABLE IF NOT EXISTS users (
                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                    username VARCHAR(50) NOT NULL UNIQUE,
                    email VARCHAR(100) NOT NULL UNIQUE,
                    password VARCHAR(255) NOT NULL,
                    created_at TIMESTAMP NOT NULL
                )
            """);

            // Create movies table
            stmt.execute("""
                CREATE TABLE IF NOT EXISTS movies (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(255) NOT NULL
                )
            """);

            // Check if movies table is empty
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM movies");
            rs.next();
            if (rs.getInt(1) == 0) {
                try (PreparedStatement ps = conn.prepareStatement(
                        "INSERT INTO movies (title) VALUES (?)"
                )) {
                    ps.setString(1, "Inception");
                    ps.executeUpdate();

                    ps.setString(1, "Interstellar");
                    ps.executeUpdate();

                    ps.setString(1, "The Dark Knight");
                    ps.executeUpdate();
                }
                System.out.println("Movies table seeded with initial data");
            }

            System.out.println("Database initialization complete");

        } catch (Exception e) {
            throw new RuntimeException("Database seeding failed", e);
        }
    }
}
