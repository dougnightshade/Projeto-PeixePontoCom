
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Fornecedor;
import model.bean.FornecedorHasRacao;
import model.bean.Racao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class FornecedorHasRacaoDAO {

    Session obSession;
    Transaction obTx;

    List<FornecedorHasRacao> listaFornecedorHasRacao = new ArrayList<FornecedorHasRacao>();

    public void abrirSessao() {
        if (obSession == null) {
            obSession = new ConnectionFactory().getSessionFactory();
        }
    }

    public void cadastrar(FornecedorHasRacao obFornecedorHasRacao) {

        try {
            abrirSessao();

            obTx = obSession.beginTransaction();
            obSession.save(obFornecedorHasRacao);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void excluir(FornecedorHasRacao obFornecedorHasRacao) {

        try {

            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            try {
                obSession.delete(obFornecedorHasRacao);
                obTx.commit();
                obSession.close();
            } catch (Exception e) {
                System.out.println("\n\n\n\n\n\n");
                System.out.println("ERRO: " + e.getMessage());
            }

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }
    }/*excluir ==================*/

    public void alterar(FornecedorHasRacao obFornecedorHasRacao) {

        try {
            abrirSessao();
            obTx = obSession.beginTransaction();
            obSession.update(obFornecedorHasRacao);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public List<FornecedorHasRacao> listar() {

        try {
            abrirSessao();
            listaFornecedorHasRacao = obSession.createCriteria(FornecedorHasRacao.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaFornecedorHasRacao;
    }

    public FornecedorHasRacao buscarCodigo(int codigo) {

        try {
            abrirSessao();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.fornecedor_has_racao where fornecedor_has_racao_Codigo = " + codigo).addEntity(FornecedorHasRacao.class);

            listaFornecedorHasRacao = query.list();

            System.out.println("Codigo: " + listaFornecedorHasRacao.get(0).getFornecedorHasRacaoCodigo());
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaFornecedorHasRacao.get(0);
    }/*buscarCodigo =========================*/

    public List<FornecedorHasRacao> listarPorRacao(Racao obRacao) {

        try {
            abrirSessao();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.fornecedor_has_racao where fk_Fhr_racao_Codigo = " + obRacao.getRacaoCodigo()).addEntity(FornecedorHasRacao.class);

            listaFornecedorHasRacao = query.list();

            System.out.println("Chegou aqui listarPorRacao");
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaFornecedorHasRacao;
    }/*listarPorRacao ========================= */

    public List<FornecedorHasRacao> listarPorRacaoNaoFornecedores(Racao obRacao) {

        try {
            abrirSessao();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.fornecedor_has_racao where fk_Fhr_racao_Codigo != "+ obRacao.getRacaoCodigo() +" and fk_Fhr_fornecedor_Codigo not in (SELECT fk_Fhr_fornecedor_Codigo FROM peixepontocom.fornecedor_has_racao where fk_Fhr_racao_Codigo = "+ obRacao.getRacaoCodigo() +") group by fk_Fhr_fornecedor_Codigo;").addEntity(FornecedorHasRacao.class);

            listaFornecedorHasRacao = query.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaFornecedorHasRacao;
    }/*listarPorRacaoNaoFornecedores ======================= */

}
