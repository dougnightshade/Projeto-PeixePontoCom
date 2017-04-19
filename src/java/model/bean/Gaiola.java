package model.bean;
// Generated 23/10/2016 17:38:25 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Gaiola generated by hbm2java
 */
@Entity
@Table(name="gaiola"
    ,catalog="peixepontocom"
)
public class Gaiola  implements java.io.Serializable {


     private Integer gaiolaCodigo;
     private StatusGaiola statusGaiola;
     private TipoEstrutura tipoEstrutura;
     private BigDecimal gaiolaTamTotalM3;
     private BigDecimal gaiolaTamAltura;
     private BigDecimal gaiolaTamComprimento;
     private BigDecimal gaiolaTamLargura;
     private Date gaiolaDataCriacao;
     private String gaiolaComentarios;
     private Set registraLotedepeixes = new HashSet(0);
     private Set alimentas = new HashSet(0);

    public Gaiola() {
    }

	
    public Gaiola(StatusGaiola statusGaiola, TipoEstrutura tipoEstrutura, BigDecimal gaiolaTamTotalM3, BigDecimal gaiolaTamAltura, BigDecimal gaiolaTamComprimento, BigDecimal gaiolaTamLargura, Date gaiolaDataCriacao) {
        this.statusGaiola = statusGaiola;
        this.tipoEstrutura = tipoEstrutura;
        this.gaiolaTamTotalM3 = gaiolaTamTotalM3;
        this.gaiolaTamAltura = gaiolaTamAltura;
        this.gaiolaTamComprimento = gaiolaTamComprimento;
        this.gaiolaTamLargura = gaiolaTamLargura;
        this.gaiolaDataCriacao = gaiolaDataCriacao;
    }
    public Gaiola(StatusGaiola statusGaiola, TipoEstrutura tipoEstrutura, BigDecimal gaiolaTamTotalM3, BigDecimal gaiolaTamAltura, BigDecimal gaiolaTamComprimento, BigDecimal gaiolaTamLargura, Date gaiolaDataCriacao, String gaiolaComentarios, Set registraLotedepeixes, Set alimentas) {
       this.statusGaiola = statusGaiola;
       this.tipoEstrutura = tipoEstrutura;
       this.gaiolaTamTotalM3 = gaiolaTamTotalM3;
       this.gaiolaTamAltura = gaiolaTamAltura;
       this.gaiolaTamComprimento = gaiolaTamComprimento;
       this.gaiolaTamLargura = gaiolaTamLargura;
       this.gaiolaDataCriacao = gaiolaDataCriacao;
       this.gaiolaComentarios = gaiolaComentarios;
       this.registraLotedepeixes = registraLotedepeixes;
       this.alimentas = alimentas;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="gaiola_Codigo", unique=true, nullable=false)
    public Integer getGaiolaCodigo() {
        return this.gaiolaCodigo;
    }
    
    public void setGaiolaCodigo(Integer gaiolaCodigo) {
        this.gaiolaCodigo = gaiolaCodigo;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="fk_G_status_Gaiola_Codigo", nullable=false)
    public StatusGaiola getStatusGaiola() {
        return this.statusGaiola;
    }
    
    public void setStatusGaiola(StatusGaiola statusGaiola) {
        this.statusGaiola = statusGaiola;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="fk_G_tipo_Estrutura_Codigo", nullable=false)
    public TipoEstrutura getTipoEstrutura() {
        return this.tipoEstrutura;
    }
    
    public void setTipoEstrutura(TipoEstrutura tipoEstrutura) {
        this.tipoEstrutura = tipoEstrutura;
    }

    
    @Column(name="gaiola_TamTotalM3", nullable=false, precision=10, scale=3)
    public BigDecimal getGaiolaTamTotalM3() {
        return this.gaiolaTamTotalM3;
    }
    
    public void setGaiolaTamTotalM3(BigDecimal gaiolaTamTotalM3) {
        this.gaiolaTamTotalM3 = gaiolaTamTotalM3;
    }

    
    @Column(name="gaiola_TamAltura", nullable=false, precision=10, scale=3)
    public BigDecimal getGaiolaTamAltura() {
        return this.gaiolaTamAltura;
    }
    
    public void setGaiolaTamAltura(BigDecimal gaiolaTamAltura) {
        this.gaiolaTamAltura = gaiolaTamAltura;
    }

    
    @Column(name="gaiola_TamComprimento", nullable=false, precision=10, scale=3)
    public BigDecimal getGaiolaTamComprimento() {
        return this.gaiolaTamComprimento;
    }
    
    public void setGaiolaTamComprimento(BigDecimal gaiolaTamComprimento) {
        this.gaiolaTamComprimento = gaiolaTamComprimento;
    }

    
    @Column(name="gaiola_TamLargura", nullable=false, precision=10, scale=3)
    public BigDecimal getGaiolaTamLargura() {
        return this.gaiolaTamLargura;
    }
    
    public void setGaiolaTamLargura(BigDecimal gaiolaTamLargura) {
        this.gaiolaTamLargura = gaiolaTamLargura;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="gaiola_DataCriacao", nullable=false, length=10)
    public Date getGaiolaDataCriacao() {
        return this.gaiolaDataCriacao;
    }
    
    public void setGaiolaDataCriacao(Date gaiolaDataCriacao) {
        this.gaiolaDataCriacao = gaiolaDataCriacao;
    }

    
    @Column(name="gaiola_Comentarios")
    public String getGaiolaComentarios() {
        return this.gaiolaComentarios;
    }
    
    public void setGaiolaComentarios(String gaiolaComentarios) {
        this.gaiolaComentarios = gaiolaComentarios;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="gaiola")
    public Set getRegistraLotedepeixes() {
        return this.registraLotedepeixes;
    }
    
    public void setRegistraLotedepeixes(Set registraLotedepeixes) {
        this.registraLotedepeixes = registraLotedepeixes;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="gaiola")
    public Set getAlimentas() {
        return this.alimentas;
    }
    
    public void setAlimentas(Set alimentas) {
        this.alimentas = alimentas;
    }




}


