/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import model.bean.TaxaDeAlimentacao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Owner
 */
public class TaxaDeAlimentacaoDAO {

    Session obSession;
    Transaction obTx;

    List<TaxaDeAlimentacao> listaTaxaDeAlimentacao = new ArrayList<TaxaDeAlimentacao>();

    public List<TaxaDeAlimentacao> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaTaxaDeAlimentacao = obSession.createCriteria(TaxaDeAlimentacao.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaTaxaDeAlimentacao;
    }

    public TaxaDeAlimentacao buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.taxa_de_alimentacao where taxa_De_Alimentacao_Codigo = " + codigo).addEntity(TaxaDeAlimentacao.class);

            listaTaxaDeAlimentacao = query.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaTaxaDeAlimentacao.get(0);
    }/*buscarCodigo ============*/


    public TaxaDeAlimentacao TaxaDeAlimentacaoPorPesoMedio(BigDecimal obPesoMedio) {
        /*Recebe o peso medio como */
        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.taxa_de_alimentacao where ("+obPesoMedio+" > taxa_De_Alimentacao_Peso_Minimo) and ("+obPesoMedio+" < taxa_De_Alimentacao_Peso_Maximo);").addEntity(TaxaDeAlimentacao.class);

            listaTaxaDeAlimentacao = query.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaTaxaDeAlimentacao.get(0);
    }/*codigoTaxaDeAlimentacaoPorPesoMedio ============*/

}
