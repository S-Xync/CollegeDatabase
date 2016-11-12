import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 * Created by saikumar on 11/11/16.
 */
public class DatabaseCreateTables {
    public static void main(String[] args) {
        String dbString="jdbc:mysql://localhost:3306/datacrate?user=root&password=mysql&useSSL=false";
        try{
            Connection connection= DriverManager.getConnection(dbString);
            Statement statement=connection.createStatement();

            statement.executeUpdate("CREATE TABLE years(" +
                    "year INTEGER NOT NULL," +
                    "PRIMARY KEY(year))");

            statement.executeUpdate("CREATE TABLE departments(" +
                    "dep_id VARCHAR(10) NOT NULL," +
                    "dep_name VARCHAR(255)," +
                    "PRIMARY KEY(dep_id))");

            statement.executeUpdate("CREATE TABLE s_details(" +
                    "s_roll INTEGER NOT NULL," +
                    "first_name VARCHAR(255) NOT NULL," +
                    "last_name VARCHAR(255)," +
                    "year INTEGER NOT NULL," +
                    "dep_id VARCHAR(10) NOT NULL," +
                    "address VARCHAR(255)," +
                    "PRIMARY KEY(s_roll)," +
                    "FOREIGN KEY(year) REFERENCES years(year)," +
                    "FOREIGN KEY(dep_id) REFERENCES departments(dep_id))");

            statement.executeUpdate("CREATE TABLE e_details(" +
                    "e_roll INTEGER NOT NULL," +
                    "first_name VARCHAR(255) NOT NULL," +
                    "last_name VARCHAR(255)," +
                    "dep_id VARCHAR(10) NOT NULL," +
                    "address VARCHAR(255)," +
                    "PRIMARY KEY(e_roll)," +
                    "FOREIGN KEY(dep_id) REFERENCES departments(dep_id))");

            statement.executeUpdate("CREATE TABLE courses(" +
                    "c_id VARCHAR(10) NOT NULL," +
                    "c_name VARCHAR(255)," +
                    "year INTEGER NOT NULL," +
                    "PRIMARY KEY(c_id)," +
                    "FOREIGN KEY(year) REFERENCES years(year))");

            statement.executeUpdate("CREATE TABLE books(" +
                    "b_id VARCHAR(10) NOT NULL," +
                    "b_name VARCHAR(255)," +
                    "PRIMARY KEY(b_id))");

            statement.executeUpdate("CREATE TABLE s_courses(" +
                    "roll INTEGER NOT NULL," +
                    "c_id VARCHAR(10) NOT NULL," +
                    "FOREIGN KEY(roll) REFERENCES s_details(s_roll)," +
                    "FOREIGN KEY(c_id) REFERENCES courses(c_id))");

            statement.executeUpdate("CREATE TABLE e_courses(" +
                    "roll INTEGER NOT NULL," +
                    "c_id VARCHAR(10) NOT NULL," +
                    "FOREIGN KEY(roll) REFERENCES e_details(e_roll)," +
                    "FOREIGN KEY(c_id) REFERENCES courses(c_id))");

            statement.executeUpdate("CREATE TABLE s_books(" +
                    "roll INTEGER NOT NULL," +
                    "b_id VARCHAR(10) NOT NULL," +
                    "FOREIGN KEY(roll) REFERENCES s_details(s_roll)," +
                    "FOREIGN KEY(b_id) REFERENCES books(b_id))");

            statement.executeUpdate("CREATE TABLE e_books(" +
                    "roll INTEGER NOT NULL," +
                    "b_id VARCHAR(10) NOT NULL," +
                    "FOREIGN KEY(roll) REFERENCES e_details(e_roll)," +
                    "FOREIGN KEY(b_id) REFERENCES books(b_id))");

            statement.executeUpdate("CREATE TABLE s_login(" +
                    "roll INTEGER NOT NULL," +
                    "pass VARCHAR(255) NOT NULL," +
                    "FOREIGN KEY(roll) REFERENCES s_details(s_roll))");

            statement.executeUpdate("CREATE TABLE e_login(" +
                    "roll INTEGER NOT NULL," +
                    "pass VARCHAR(255) NOT NULL," +
                    "FOREIGN KEY(roll) REFERENCES e_details(e_roll))");

            statement.executeUpdate("CREATE TABLE admin(" +
                    "u_id VARCHAR(255) NOT NULL," +
                    "password VARCHAR(255) NOT NULL)");

            statement.executeUpdate("INSERT INTO admin VALUES('admin','admin123')");//admin's username and password

            connection.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
