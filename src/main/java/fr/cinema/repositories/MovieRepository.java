package fr.cinema.repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

@Repository
public class MovieRepository {

    private final DataSource dataSource;

    // Spring injects DataSource here
    public MovieRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public int countMovies() {
        try (Connection conn = dataSource.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM movies")) {

            rs.next();
            return rs.getInt(1);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
