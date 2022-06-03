/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.model;


import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 *
 * @author lucas
 */
public class Venda {
    
    private int id;
    private int fk_cliente;
    private Date dt_venda;
    private String valor_total;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFk_cliente() {
        return fk_cliente;
    }

    public void setFk_cliente(int fk_cliente) {
        this.fk_cliente = fk_cliente;
    }

    public Date getDt_venda() {
        return dt_venda;
    }

    public void setDt_venda(Date dt_venda) {
        System.out.println(dt_venda);
        this.dt_venda = dt_venda;
    }

    public String getValor_total() {
        return valor_total;
    }

    public void setValor_total(String valor_total) {
        this.valor_total = valor_total;
    }
    
    public String armazenaData() throws ParseException{
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String monthAndYear = formatter.format(new Date());
        return monthAndYear;
    }
    
    public void somaValorTotal(String valor){
        BigDecimal big1 = new BigDecimal(valor);
        BigDecimal big2 = new BigDecimal(valor_total);
        BigDecimal bigResult = big1.add(big2);
        setValor_total(bigResult.toString());
    }
    
    public String fomataData(){
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String data = formatter.format(dt_venda);
        return data;
    }
    
    
}
