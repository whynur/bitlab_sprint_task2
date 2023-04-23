package kz.bitlab.javaee.sprint2.db;

import kz.bitlab.javaee.sprint2.model.Item;
import kz.bitlab.javaee.sprint2.model.User;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    public static final String url = "jdbc:postgresql://localhost:5433/bitlab_sprint2";
    public static final String user = "postgres";
    public static final String password = "00000000";

    public static ArrayList<Item> getItems() {
        ArrayList<Item> items = new ArrayList<>();
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("Select * FROM items");
                while (resultSet.next()) {
                    Long id = resultSet.getLong("id");
                    String name = resultSet.getString("name");
                    String description = resultSet.getString("description");
                    double price = resultSet.getDouble("price");
                    items.add(new Item(id, name, description, price));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }

    public static ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("Select * FROM users");
                while (resultSet.next()) {
                    Long id = resultSet.getLong("id");
                    String email = resultSet.getString("email");
                    String password = resultSet.getString("password");
                    String fullName = resultSet.getString("full_name");
                    users.add(new User(id, email, password, fullName));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public static User getUser(String email) {
        User usere = null;
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                PreparedStatement statement = conn.prepareStatement("" + "SELECT * FROM users WHERE email = ?");
                statement.setString(1, email);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    usere = new User();
                    usere.setId(resultSet.getLong("id"));
                    usere.setEmail(resultSet.getString("email"));
                    usere.setPassword(resultSet.getString("password"));
                    usere.setFullName(resultSet.getString("full_name"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return usere;
    }
}