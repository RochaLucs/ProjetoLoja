/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lucas
 */
public class ClienteDAO {
    
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Cliente> lista = new ArrayList<>();
    Cliente c = new Cliente();
    
    public void cadastrarCliente(Cliente cliente) throws ClassNotFoundException{
        String sql = "insert into tb_cliente (cpf, no_cliente, tx_email, tx_tel) values (?,?,?,?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, cliente.getCpf());
            pstm.setString(2, cliente.getNome_cliente());
            pstm.setString(3, cliente.getTx_email());
            pstm.setString(4, cliente.getTx_cel());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<Cliente> pesquisarCliente() throws ClassNotFoundException{
        String sql = "select * from tb_cliente";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setCpf(rs.getInt("cpf"));
                cliente.setNome_cliente(rs.getString("no_cliente"));
                cliente.setTx_email(rs.getString("tx_email"));
                cliente.setTx_cel(Integer.toString(rs.getInt("tx_tel")));
                
                lista.add(cliente);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
        
        return lista;
    }
    
     public Cliente BuscaClientePorCpf(Cliente cliente) throws ClassNotFoundException{
        String sql = "SELECT * FROM tb_cliente WHERE cpf= " + cliente.getCpf();
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            //System.out.println(cliente.getCpf());
            //pstm.setInt(1, cliente.getCpf());
            //pstm.execute();
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setNome_cliente(rs.getString("no_cliente"));
                cliente.setTx_email(rs.getString("tx_email"));
                cliente.setTx_cel(Integer.toString(rs.getInt("tx_tel")));
                lista.add(cliente);
            }
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return cliente;
    }
     
     public Cliente RecuperaClientePorId(int id) throws ClassNotFoundException{
        String sql = "SELECT * FROM tb_cliente WHERE id_cliente= " + id;
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                c.setId(rs.getInt("id_cliente"));
                c.setNome_cliente(rs.getString("no_cliente"));
                c.setTx_email(rs.getString("tx_email"));
                c.setTx_cel(Integer.toString(rs.getInt("tx_tel")));
                lista.add(c);
            }
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return c;
    }
    
    
    
}
