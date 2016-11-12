import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by saikumar on 11/11/16.
 */
public class DatabaseEntry {
    public static void main(String[] args) {
        try {
            String dbString = "jdbc:mysql://localhost:3306/datacrate?user=root&password=mysql&useSSL=false";
            FileReader fr = new FileReader("./src/data/years.txt");
            BufferedReader br = new BufferedReader(fr);
            Connection connection = DriverManager.getConnection(dbString);
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO years VALUES(?)");
            String str = "";
            String[] arr;
            while ((str = br.readLine()) != null) {
                preparedStatement.setInt(1, Integer.valueOf(str));
                preparedStatement.executeUpdate();
            }
            fr.close();
            br.close();
            preparedStatement.close();
            fr = new FileReader("./src/data/courses.txt");
            br = new BufferedReader(fr);
            preparedStatement = connection.prepareStatement("INSERT INTO courses VALUES(?,?,?)");
            while ((str = br.readLine()) != null) {
                arr = str.split(" ");
                preparedStatement.setString(1, arr[0]);
                preparedStatement.setString(2, arr[1]);
                preparedStatement.setInt(3, Integer.valueOf(arr[2]));
                preparedStatement.executeUpdate();
            }
            fr.close();
            br.close();
            preparedStatement.close();
            fr = new FileReader("./src/data/books.txt");
            br = new BufferedReader(fr);
            preparedStatement = connection.prepareStatement("INSERT INTO books VALUES(?,?)");
            while ((str = br.readLine()) != null) {
                arr = str.split(" ");
                preparedStatement.setString(1, arr[0]);
                preparedStatement.setString(2, arr[1]);
                preparedStatement.executeUpdate();
            }
            fr.close();
            br.close();
            preparedStatement.close();
            fr = new FileReader("./src/data/dept.txt");
            br = new BufferedReader(fr);
            preparedStatement = connection.prepareStatement("INSERT INTO departments VALUES(?,?)");
            while ((str = br.readLine()) != null) {
                arr = str.split(" ");
                preparedStatement.setString(1, arr[0]);
                preparedStatement.setString(2, arr[1]);
                preparedStatement.executeUpdate();
            }

        } catch (IOException | SQLException e) {
            System.out.println(e);
        }
    }

}
