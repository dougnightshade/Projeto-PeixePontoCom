package model.bean;
// Generated 23/10/2016 17:38:25 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Cidades generated by hbm2java
 */
@Entity
@Table(name="cidades"
    ,catalog="peixepontocom"
)
public class Cidades  implements java.io.Serializable {


     private int cidadesCodigo;
     private String cidadesUf;
     private String cidadesNome;
     private Set bairroses = new HashSet(0);

    public Cidades() {
    }

	
    public Cidades(int cidadesCodigo, String cidadesUf, String cidadesNome) {
        this.cidadesCodigo = cidadesCodigo;
        this.cidadesUf = cidadesUf;
        this.cidadesNome = cidadesNome;
    }
    public Cidades(int cidadesCodigo, String cidadesUf, String cidadesNome, Set bairroses) {
       this.cidadesCodigo = cidadesCodigo;
       this.cidadesUf = cidadesUf;
       this.cidadesNome = cidadesNome;
       this.bairroses = bairroses;
    }
   
     @Id 

    
    @Column(name="cidades_codigo", unique=true, nullable=false)
    public int getCidadesCodigo() {
        return this.cidadesCodigo;
    }
    
    public void setCidadesCodigo(int cidadesCodigo) {
        this.cidadesCodigo = cidadesCodigo;
    }

    
    @Column(name="cidades_uf", nullable=false, length=2)
    public String getCidadesUf() {
        return this.cidadesUf;
    }
    
    public void setCidadesUf(String cidadesUf) {
        this.cidadesUf = cidadesUf;
    }

    
    @Column(name="cidades_nome", nullable=false)
    public String getCidadesNome() {
        return this.cidadesNome;
    }
    
    public void setCidadesNome(String cidadesNome) {
        this.cidadesNome = cidadesNome;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="cidades")
    public Set getBairroses() {
        return this.bairroses;
    }
    
    public void setBairroses(Set bairroses) {
        this.bairroses = bairroses;
    }




}

