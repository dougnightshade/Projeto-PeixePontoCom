package model.dao;
// Generated 07/09/2016 21:42:17 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Funcionario generated by hbm2java
 */
public class Funcionario  implements java.io.Serializable {


     private Integer funcionarioCodigo;
     private TipoFuncionario tipoFuncionario;
     private String funcionarioNome;
     private String funcionarioEmail;
     private String funcionarioTelPrefixoFixo;
     private String funcionarioTelFixo;
     private String funcionarioTelPrefixoCelular;
     private String funcionarioTelCelular;
     private String funcionarioUsuLogin;
     private String funcionarioUsuSenha;
     private Set registraLotedepeixes = new HashSet(0);
     private Set realizas = new HashSet(0);

    public Funcionario() {
    }

	
    public Funcionario(TipoFuncionario tipoFuncionario, String funcionarioNome, String funcionarioEmail) {
        this.tipoFuncionario = tipoFuncionario;
        this.funcionarioNome = funcionarioNome;
        this.funcionarioEmail = funcionarioEmail;
    }
    public Funcionario(TipoFuncionario tipoFuncionario, String funcionarioNome, String funcionarioEmail, String funcionarioTelPrefixoFixo, String funcionarioTelFixo, String funcionarioTelPrefixoCelular, String funcionarioTelCelular, String funcionarioUsuLogin, String funcionarioUsuSenha, Set registraLotedepeixes, Set realizas) {
       this.tipoFuncionario = tipoFuncionario;
       this.funcionarioNome = funcionarioNome;
       this.funcionarioEmail = funcionarioEmail;
       this.funcionarioTelPrefixoFixo = funcionarioTelPrefixoFixo;
       this.funcionarioTelFixo = funcionarioTelFixo;
       this.funcionarioTelPrefixoCelular = funcionarioTelPrefixoCelular;
       this.funcionarioTelCelular = funcionarioTelCelular;
       this.funcionarioUsuLogin = funcionarioUsuLogin;
       this.funcionarioUsuSenha = funcionarioUsuSenha;
       this.registraLotedepeixes = registraLotedepeixes;
       this.realizas = realizas;
    }
   
    public Integer getFuncionarioCodigo() {
        return this.funcionarioCodigo;
    }
    
    public void setFuncionarioCodigo(Integer funcionarioCodigo) {
        this.funcionarioCodigo = funcionarioCodigo;
    }
    public TipoFuncionario getTipoFuncionario() {
        return this.tipoFuncionario;
    }
    
    public void setTipoFuncionario(TipoFuncionario tipoFuncionario) {
        this.tipoFuncionario = tipoFuncionario;
    }
    public String getFuncionarioNome() {
        return this.funcionarioNome;
    }
    
    public void setFuncionarioNome(String funcionarioNome) {
        this.funcionarioNome = funcionarioNome;
    }
    public String getFuncionarioEmail() {
        return this.funcionarioEmail;
    }
    
    public void setFuncionarioEmail(String funcionarioEmail) {
        this.funcionarioEmail = funcionarioEmail;
    }
    public String getFuncionarioTelPrefixoFixo() {
        return this.funcionarioTelPrefixoFixo;
    }
    
    public void setFuncionarioTelPrefixoFixo(String funcionarioTelPrefixoFixo) {
        this.funcionarioTelPrefixoFixo = funcionarioTelPrefixoFixo;
    }
    public String getFuncionarioTelFixo() {
        return this.funcionarioTelFixo;
    }
    
    public void setFuncionarioTelFixo(String funcionarioTelFixo) {
        this.funcionarioTelFixo = funcionarioTelFixo;
    }
    public String getFuncionarioTelPrefixoCelular() {
        return this.funcionarioTelPrefixoCelular;
    }
    
    public void setFuncionarioTelPrefixoCelular(String funcionarioTelPrefixoCelular) {
        this.funcionarioTelPrefixoCelular = funcionarioTelPrefixoCelular;
    }
    public String getFuncionarioTelCelular() {
        return this.funcionarioTelCelular;
    }
    
    public void setFuncionarioTelCelular(String funcionarioTelCelular) {
        this.funcionarioTelCelular = funcionarioTelCelular;
    }
    public String getFuncionarioUsuLogin() {
        return this.funcionarioUsuLogin;
    }
    
    public void setFuncionarioUsuLogin(String funcionarioUsuLogin) {
        this.funcionarioUsuLogin = funcionarioUsuLogin;
    }
    public String getFuncionarioUsuSenha() {
        return this.funcionarioUsuSenha;
    }
    
    public void setFuncionarioUsuSenha(String funcionarioUsuSenha) {
        this.funcionarioUsuSenha = funcionarioUsuSenha;
    }
    public Set getRegistraLotedepeixes() {
        return this.registraLotedepeixes;
    }
    
    public void setRegistraLotedepeixes(Set registraLotedepeixes) {
        this.registraLotedepeixes = registraLotedepeixes;
    }
    public Set getRealizas() {
        return this.realizas;
    }
    
    public void setRealizas(Set realizas) {
        this.realizas = realizas;
    }




}


