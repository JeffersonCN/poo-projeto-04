/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.models;

import java.util.ArrayList;

/**
 *
 * @author Victor Schleumer
 */
public class Cliente {

    private static ArrayList<Cliente> lista = new ArrayList<Cliente>();

    private int id;
    private String nome;
    private String cpf;
    private String rg;
    private String email;
    private String telefone;
    private String endereco;

    public static ArrayList<Cliente> listar() {
        return lista;
    }

    public static int adicionar(Cliente cliente) {
        try {
            lista.add(cliente);
            return cliente.id;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return 0;
        }
    }

    public static Cliente clienteById(int id) {
        try {
            for (Cliente cliente : lista) {
                if (cliente.id == id) {
                    return cliente;
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
        return null;
    }

    public static boolean editar(Cliente dados, int id) {
        try {
            for (Cliente cliente : lista) {
                if (cliente.id == id) {
                    int index = lista.indexOf(cliente);
                    dados.setId(id);
                    lista.set(index, dados);
                    return true;
                }
            }
            return true;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static boolean excluir(int id) {
        try {
            for (Cliente cliente : lista) {
                if (cliente.id == id) {
                    lista.remove(cliente);
                    return true;
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
        return false;
    }

    public Cliente(String nome, String cpf, String rg, String email, String telefone, String endereco) {
        try {
            this.id = (int)(Math.random() * 10000);
            this.nome = nome;
            this.cpf = cpf;
            this.rg = rg;
            this.email = email;
            this.telefone = telefone;
            this.endereco = endereco;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

}
