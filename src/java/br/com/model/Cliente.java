/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.model;

/**
 *
 * @author lucas
 */
public class Cliente {
    
    private int id;
    private int cpf;
    private String nome_cliente;
    private String tx_email;
    private String tx_cel;
    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCpf() {
        return cpf;
    }

    public void setCpf(int cpf) {
        this.cpf = cpf;
    }

    public String getNome_cliente() {
        return nome_cliente;
    }

    public void setNome_cliente(String nome_cliente) {
        this.nome_cliente = nome_cliente;
    }

    public String getTx_email() {
        return tx_email;
    }

    public void setTx_email(String tx_email) {
        this.tx_email = tx_email;
    }

    public String getTx_cel() {
        return tx_cel;
    }

    public void setTx_cel(String tx_cel) {
        this.tx_cel = tx_cel;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
