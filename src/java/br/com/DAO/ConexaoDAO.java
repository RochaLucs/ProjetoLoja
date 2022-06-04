package br.com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {
    
  public Connection conexaoBD() throws ClassNotFoundException{
        Connection con = null;
        String server = "anhanguera.cmi4gdq4rsw6.sa-east-1.rds.amazonaws.com";
        String banco = "loja";
        String user = "admin";
        String pass = "adminadmin";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://"+server+":3306/"+banco+"?user="+user+"&password="+pass+"";            
            con = DriverManager.getConnection(url);            
            
        } catch (SQLException e) {
        }
        return con;
    }
}
