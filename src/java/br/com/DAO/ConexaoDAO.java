package br.com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {
    
    public Connection conexaoBD() throws ClassNotFoundException{
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/loja?user=root&password=password&useSSL=false";            
            con = DriverManager.getConnection(url);            
            
        } catch (SQLException e) {
        }
        return con;
    }
}
