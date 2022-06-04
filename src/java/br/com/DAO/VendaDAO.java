/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.model.Venda;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

/**
 *
 * @author lucas
 */
public class VendaDAO {
        
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Venda> lista = new ArrayList<>();
    Venda v = new Venda();
    int id;
    
        public void cadastrarVenda(Venda venda) throws ClassNotFoundException, ParseException{
        String sql = "insert into tb_venda (fk_cliente, dt_venda, valor_total) values (?,STR_TO_DATE(?,'%d/%m/%Y %T'),?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, venda.getFk_cliente());
            pstm.setString(2, venda.armazenaData());
            System.out.println(venda.getValor_total());
            pstm.setString(3, venda.getValor_total());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    
    public ArrayList<Venda> RecuperaVendas() throws ClassNotFoundException{
        String sql = "select * from tb_venda";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                Venda venda = new Venda();
                venda.setId(rs.getInt("id_venda"));
                venda.setFk_cliente(rs.getInt("fk_cliente"));
                venda.setDt_venda(rs.getDate("dt_venda"));
                venda.setValor_total(rs.getString("valor_total"));
          
                lista.add(venda);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
        
        return lista;
    }
    
    public int RecuperaUltimoId() throws ClassNotFoundException, SQLException{
        String sql = "SELECT MAX(id_venda) as maxId FROM tb_venda";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            rs.next();
            id = rs.getInt("maxId");
            pstm.close();
            
        } catch (SQLException e) {
        }
        return id;
    }
    
    public Venda RecuperaVendaPorID(int id) throws ClassNotFoundException{
        String sql = "select * from tb_venda where id_venda=" + id;
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                v.setId(rs.getInt("id_venda"));
                v.setFk_cliente(rs.getInt("fk_cliente"));
                v.setDt_venda(rs.getDate("dt_venda"));
                v.setValor_total(rs.getString("valor_total"));
          
                lista.add(v);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
        
        return v;
    }
    
}
