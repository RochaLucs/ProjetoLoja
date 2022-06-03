/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.model.ItemVenda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author lucas
 */
public class ItemVendaDAO {
    
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<ItemVenda> lista = new ArrayList<>();
    
    
    public void registrarItemVenda(ItemVenda itemVenda) throws ClassNotFoundException{
        String sql = "insert into tb_item_venda (fk_venda, fk_produto, valor_itens) values (?,?,?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, itemVenda.getFkVenda());
            pstm.setInt(2, itemVenda.getFkProduto());
            pstm.setString(3, itemVenda.getValorItens());
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    public ArrayList<ItemVenda> RecuperaItemVenda() throws ClassNotFoundException{
        String sql = "select * from tb_item_venda";
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                ItemVenda itemVenda = new ItemVenda();
                itemVenda.setId(rs.getInt("id_item_venda"));
                itemVenda.setFkVenda(rs.getInt("fk_venda"));
                itemVenda.setFkProduto(rs.getInt("fk_produto"));
                itemVenda.setValorItens(rs.getString("valor_total"));
          
                lista.add(itemVenda);
            }
            pstm.close();
            
        } catch (SQLException e) {
        }
        
        return lista;
    }
    
     public ArrayList<ItemVenda> RecuperaItensDaVenda(int venda) throws ClassNotFoundException{
        String sql = "select fk_produto, valor_itens from tb_item_venda where fk_venda=" + venda;
        con = new ConexaoDAO().conexaoBD();
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            while(rs.next()){
                ItemVenda itemVenda = new ItemVenda();
                itemVenda.setFkProduto(rs.getInt("fk_produto"));
                System.out.println(itemVenda.getFkProduto());
                itemVenda.setValorItens(rs.getString("valor_itens"));
                lista.add(itemVenda);
            }
            pstm.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return lista;
    }
    
    
    
    
}
