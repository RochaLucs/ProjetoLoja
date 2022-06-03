/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.model.Fornecedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lucas
 */
public class FornecedorDAO {
    
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Fornecedor> lista = new ArrayList<>();
    //Fornecedor fornecedor = new Fornecedor();
    
        public void cadastrarFornecedor(Fornecedor fornecedor) throws ClassNotFoundException{
        String sql = "insert into tb_fornecedor (no_fornecedor, cnpj) values (?,?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, fornecedor.getNome_fornecedor());
            pstm.setString(2, fornecedor.getCnpj());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public ArrayList<Fornecedor> RecuperaFornecedor() throws ClassNotFoundException{
        String sql = "select * from tb_fornecedor";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setId(rs.getInt("id_fornecedor"));
                fornecedor.setNome_fornecedor(rs.getString("no_fornecedor"));
                fornecedor.setCnpj(rs.getString("cnpj"));
          
                lista.add(fornecedor);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
        
        return lista;
    }
    
    
    public String RecuperaNomeFornecedor(int id) throws ClassNotFoundException, SQLException{
        String sql = "select no_fornecedor from tb_fornecedor where id_fornecedor = ? ";
        con = new ConexaoDAO().conexaoBD();
        //Fornecedor fornecedor = new Fornecedor();
        String nome = null;
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            rs = pstm.executeQuery(sql);
             while(rs.next()){
                 nome = rs.getString("no_fornecedor");
             }
            pstm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return nome;
    }
}
