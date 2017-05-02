/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.models;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    private static final String EMAIL_PATTERN
            = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    private static final Pattern pattern = Pattern.compile(EMAIL_PATTERN, Pattern.CASE_INSENSITIVE);

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
                    fornecedor = dados;
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

            if (cnpj.equals("00000000000000") || cnpj.equals("11111111111111")
                    || cnpj.equals("22222222222222") || cnpj.equals("33333333333333")
                    || cnpj.equals("44444444444444") || cnpj.equals("55555555555555")
                    || cnpj.equals("66666666666666") || cnpj.equals("77777777777777")
                    || cnpj.equals("88888888888888") || cnpj.equals("99999999999999")
                    || (cnpj.length() != 14)) {
                throw new Exception("CNPJ Inválido");
            }

            char dig13, dig14;
            int sm, i, r, num, peso;

            sm = 0;
            peso = 2;
            for (i = 11; i >= 0; i--) {
                num = (int) (cnpj.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso + 1;
                if (peso == 10) {
                    peso = 2;
                }
            }

            r = sm % 11;
            if ((r == 0) || (r == 1)) {
                dig13 = '0';
            } else {
                dig13 = (char) ((11 - r) + 48);
            }

            sm = 0;
            peso = 2;
            for (i = 12; i >= 0; i--) {
                num = (int) (cnpj.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso + 1;
                if (peso == 10) {
                    peso = 2;
                }
            }

            r = sm % 11;
            if ((r == 0) || (r == 1)) {
                dig14 = '0';
            } else {
                dig14 = (char) ((11 - r) + 48);
            }

            if (!(dig13 == cnpj.charAt(12)) && (dig14 == cnpj.charAt(13))) {
                throw new Exception("CNPJ Inválido");
            }

            cnpj = (cnpj.substring(0, 2) + "." + cnpj.substring(2, 5) + "."
                    + cnpj.substring(5, 8) + "." + cnpj.substring(8, 12) + "-"
                    + cnpj.substring(12, 14));
            
            Matcher matcher = pattern.matcher(email);
            if(!matcher.matches()){
                throw new Exception("E-mail Inválido");
            }

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
