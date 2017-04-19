package model.bean;
// Generated 23/10/2016 17:38:25 by Hibernate Tools 4.3.1


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
 * TipoNotificacao generated by hbm2java
 */
@Entity
@Table(name="tipo_notificacao"
    ,catalog="peixepontocom"
)
public class TipoNotificacao  implements java.io.Serializable {


     private Integer tipoNotificacaoCodigo;
     private String tipoNotificacaoDescricao;
     private String tipoNotificacaoClass;
     private Set notificacaos = new HashSet(0);

    public TipoNotificacao() {
    }

	
    public TipoNotificacao(String tipoNotificacaoDescricao, String tipoNotificacaoClass) {
        this.tipoNotificacaoDescricao = tipoNotificacaoDescricao;
        this.tipoNotificacaoClass = tipoNotificacaoClass;
    }
    public TipoNotificacao(String tipoNotificacaoDescricao, String tipoNotificacaoClass, Set notificacaos) {
       this.tipoNotificacaoDescricao = tipoNotificacaoDescricao;
       this.tipoNotificacaoClass = tipoNotificacaoClass;
       this.notificacaos = notificacaos;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="tipo_Notificacao_Codigo", unique=true, nullable=false)
    public Integer getTipoNotificacaoCodigo() {
        return this.tipoNotificacaoCodigo;
    }
    
    public void setTipoNotificacaoCodigo(Integer tipoNotificacaoCodigo) {
        this.tipoNotificacaoCodigo = tipoNotificacaoCodigo;
    }

    
    @Column(name="tipo_Notificacao_Descricao", nullable=false)
    public String getTipoNotificacaoDescricao() {
        return this.tipoNotificacaoDescricao;
    }
    
    public void setTipoNotificacaoDescricao(String tipoNotificacaoDescricao) {
        this.tipoNotificacaoDescricao = tipoNotificacaoDescricao;
    }

    
    @Column(name="tipo_Notificacao_class", nullable=false, length=45)
    public String getTipoNotificacaoClass() {
        return this.tipoNotificacaoClass;
    }
    
    public void setTipoNotificacaoClass(String tipoNotificacaoClass) {
        this.tipoNotificacaoClass = tipoNotificacaoClass;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="tipoNotificacao")
    public Set getNotificacaos() {
        return this.notificacaos;
    }
    
    public void setNotificacaos(Set notificacaos) {
        this.notificacaos = notificacaos;
    }




}

