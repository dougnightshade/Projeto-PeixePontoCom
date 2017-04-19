package model.bean;
// Generated 23/10/2016 17:38:25 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Racao generated by hbm2java
 */
@Entity
@Table(name="racao"
    ,catalog="peixepontocom"
)
public class Racao  implements java.io.Serializable {


     private Integer racaoCodigo;
     private String racaoNome;
     private BigDecimal racaoEstoque;
     private BigDecimal racaoPrecoAtual;
     private BigDecimal racaoProteina;
     private String racaoMarca;
     private Set forneces = new HashSet(0);
     private Set alimentas = new HashSet(0);

    public Racao() {
    }

	
    public Racao(String racaoNome, BigDecimal racaoEstoque, BigDecimal racaoPrecoAtual, BigDecimal racaoProteina) {
        this.racaoNome = racaoNome;
        this.racaoEstoque = racaoEstoque;
        this.racaoPrecoAtual = racaoPrecoAtual;
        this.racaoProteina = racaoProteina;
    }
    public Racao(String racaoNome, BigDecimal racaoEstoque, BigDecimal racaoPrecoAtual, BigDecimal racaoProteina, String racaoMarca, Set forneces, Set alimentas) {
       this.racaoNome = racaoNome;
       this.racaoEstoque = racaoEstoque;
       this.racaoPrecoAtual = racaoPrecoAtual;
       this.racaoProteina = racaoProteina;
       this.racaoMarca = racaoMarca;
       this.forneces = forneces;
       this.alimentas = alimentas;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="racao_Codigo", unique=true, nullable=false)
    public Integer getRacaoCodigo() {
        return this.racaoCodigo;
    }
    
    public void setRacaoCodigo(Integer racaoCodigo) {
        this.racaoCodigo = racaoCodigo;
    }

    
    @Column(name="racao_Nome", nullable=false, length=45)
    public String getRacaoNome() {
        return this.racaoNome;
    }
    
    public void setRacaoNome(String racaoNome) {
        this.racaoNome = racaoNome;
    }

    
    @Column(name="racao_Estoque", nullable=false, precision=10, scale=3)
    public BigDecimal getRacaoEstoque() {
        return this.racaoEstoque;
    }
    
    public void setRacaoEstoque(BigDecimal racaoEstoque) {
        this.racaoEstoque = racaoEstoque;
    }

    
    @Column(name="racao_PrecoAtual", nullable=false, precision=10)
    public BigDecimal getRacaoPrecoAtual() {
        return this.racaoPrecoAtual;
    }
    
    public void setRacaoPrecoAtual(BigDecimal racaoPrecoAtual) {
        this.racaoPrecoAtual = racaoPrecoAtual;
    }

    
    @Column(name="racao_Proteina", nullable=false, precision=10)
    public BigDecimal getRacaoProteina() {
        return this.racaoProteina;
    }
    
    public void setRacaoProteina(BigDecimal racaoProteina) {
        this.racaoProteina = racaoProteina;
    }

    
    @Column(name="racao_Marca", length=45)
    public String getRacaoMarca() {
        return this.racaoMarca;
    }
    
    public void setRacaoMarca(String racaoMarca) {
        this.racaoMarca = racaoMarca;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="racao")
    public Set getForneces() {
        return this.forneces;
    }
    
    public void setForneces(Set forneces) {
        this.forneces = forneces;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="racao")
    public Set getAlimentas() {
        return this.alimentas;
    }
    
    public void setAlimentas(Set alimentas) {
        this.alimentas = alimentas;
    }




}


