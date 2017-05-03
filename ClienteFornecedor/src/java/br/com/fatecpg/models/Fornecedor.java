/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.models;

import java.util.ArrayList;

/**
 *
 * @author jeffersoncn
 */
public class Fornecedor {

    private static ArrayList<Fornecedor> lista = new ArrayList<Fornecedor>();

    private int id;
    private String nome;
    private String razaoSocial;
    private String cnpj;
    private String email;
    private String telefone;
    private String endereco;

    public static ArrayList<Fornecedor> listar() {
        return lista;
    }

    public static int adicionar(Fornecedor fornecedor) {
        try {
            lista.add(fornecedor);
            return fornecedor.id;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return 0;
        }
    }

    public static Fornecedor fornecedorById(int id) {
        try {
            for (Fornecedor fornecedor : lista) {
                if (fornecedor.id == id) {
                    return fornecedor;
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
        return null;
    }

    public static boolean editar(Fornecedor dados, int id) {
        try {
            for (Fornecedor fornecedor : lista) {
                if (fornecedor.id == id) {
                    int index = lista.indexOf(fornecedor);
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
            for (Fornecedor fornecedor : lista) {
                if (fornecedor.id == id) {
                    lista.remove(fornecedor);
                    return true;
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
        return false;
    }

    public Fornecedor(String nome, String razaoSocial, String cnpj, String email, String telefone, String endereco) {
        try {
            this.id = (int)(Math.random() * 10000);
            this.nome = nome;
            this.razaoSocial = razaoSocial;
            this.cnpj = cnpj;
            this.email = email;
            this.telefone = telefone;
            this.endereco = endereco;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static ArrayList<Fornecedor> getLista() {
        return lista;
    }

    public static void setLista(ArrayList<Fornecedor> lista) {
        Fornecedor.lista = lista;
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

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getCnpj() {
        
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
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
