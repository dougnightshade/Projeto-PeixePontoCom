package model.bean;
// Generated 23/10/2016 17:38:25 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TelefoneCliente generated by hbm2java
 */
@Entity
@Table(name="telefone_cliente"
    ,catalog="peixepontocom"
)
public class TelefoneCliente  implements java.io.Serializable {


     private Integer telefoneClienteCodigo;
     private Cliente cliente;
     private String telefoneClienteDddfixo;
     private String telefoneClienteFixo;
     private String telefoneClienteDddcelular;
     private String telefoneClienteCelular;

    public TelefoneCliente() {
    }

	
    public TelefoneCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public TelefoneCliente(Cliente cliente, String telefoneClienteDddfixo, String telefoneClienteFixo, String telefoneClienteDddcelular, String telefoneClienteCelular) {
       this.cliente = cliente;
       this.telefoneClienteDddfixo = telefoneClienteDddfixo;
       this.telefoneClienteFixo = telefoneClienteFixo;
       this.telefoneClienteDddcelular = telefoneClienteDddcelular;
       this.telefoneClienteCelular = telefoneClienteCelular;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="telefone_Cliente_Codigo", unique=true, nullable=false)
    public Integer getTelefoneClienteCodigo() {
        return this.telefoneClienteCodigo;
    }
    
    public void setTelefoneClienteCodigo(Integer telefoneClienteCodigo) {
        this.telefoneClienteCodigo = telefoneClienteCodigo;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="fk_Tc_Cliente_Codigo", nullable=false)
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    
    @Column(name="telefone_Cliente_DDDFixo", length=3)
    public String getTelefoneClienteDddfixo() {
        return this.telefoneClienteDddfixo;
    }
    
    public void setTelefoneClienteDddfixo(String telefoneClienteDddfixo) {
        this.telefoneClienteDddfixo = telefoneClienteDddfixo;
    }

    
    @Column(name="telefone_Cliente_Fixo", length=10)
    public String getTelefoneClienteFixo() {
        return this.telefoneClienteFixo;
    }
    
    public void setTelefoneClienteFixo(String telefoneClienteFixo) {
        this.telefoneClienteFixo = telefoneClienteFixo;
    }

    
    @Column(name="telefone_Cliente_DDDCelular", length=3)
    public String getTelefoneClienteDddcelular() {
        return this.telefoneClienteDddcelular;
    }
    
    public void setTelefoneClienteDddcelular(String telefoneClienteDddcelular) {
        this.telefoneClienteDddcelular = telefoneClienteDddcelular;
    }

    
    @Column(name="telefone_Cliente_Celular", length=10)
    public String getTelefoneClienteCelular() {
        return this.telefoneClienteCelular;
    }
    
    public void setTelefoneClienteCelular(String telefoneClienteCelular) {
        this.telefoneClienteCelular = telefoneClienteCelular;
    }




}

