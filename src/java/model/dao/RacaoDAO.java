/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.Notificacao;
import model.bean.Racao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class RacaoDAO {

    Session obSession;
    Transaction obTx;

    Notificacao obNotificacao = new Notificacao();
    NotificacaoDAO obNotificacaoDAO = new NotificacaoDAO();

    List<Racao> listaRacao = new ArrayList<Racao>();

    public void cadastrar(Racao obRacao) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obRacao);
            obTx.commit();
            obSession.close();

            /*Salvar Notificação*/
            obNotificacao.setNotificacaoTitulo(String.valueOf("Ração cadastrada com sucesso"));
            obNotificacao.setNotificacaoDescricao(String.valueOf("Ração: " + obRacao.getRacaoNome() + " | Preço: " + obRacao.getRacaoPrecoAtual() + "| Estoque " + obRacao.getRacaoEstoque()));
            obNotificacaoDAO.notificacaoDeCadastro(obNotificacao);

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }/*try ====================*/

    }/*Cadatrar =========================*/


    public void excluir(Racao obRacao) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            /*Configura a notificação antes de serem excluidos os dados*/
//            obNotificacao.setNotificacaoDescricao(String.valueOf("Ração: " + obRacao.getRacaoNome() + " | Preço: " + obRacao.getRacaoPrecoAtual()+ "| Estoque " + obRacao.getRacaoEstoque()));

            obSession.delete(obRacao);
            obSession.close();
            System.out.println("Ração excluida com sucesso");

            /*Salvar Notificação*/
//            obNotificacao.setNotificacaoTitulo("Raçao excluida com sucesso");
//            obNotificacaoDAO.notificacaoDeExclusao(obNotificacao);
//            System.out.println("Notificação salvar com sucesso");

        } catch (Exception e) {
            System.out.println("ERRO excluirDAO Racao: " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }/*try =====================*/

    }/*Excluir ==========================*/

    public void alterar(Racao obRacao) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obRacao);
            obTx.commit();
            obSession.close();
        } catch (Exception e) {
            System.out.println("Erro RacaoDAO alterar" + e.getMessage());
            obTx.rollback();
            obSession.close();
        }
    }

    public List<Racao> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaRacao = obSession.createCriteria(Racao.class).list();

        } catch (Exception e) {
            e.getMessage();

        } finally {
            obSession.close();
        }/*try ================*/

        return listaRacao;
    }/*listar ============================== */

    public Racao buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from racao where racao_Codigo = " + codigo + ";").addEntity(Racao.class);

            listaRacao = query.list();
            obSession.close();
        } catch (Exception e) {
            e.getMessage();
        }
        return listaRacao.get(0);
    }/*buscarPoCodigo ===================*/

    public Racao consultarPorNome(String nome) {
        try {
            obSession = new ConnectionFactory().getSessionFactory();

            Query query = obSession.createSQLQuery("select * from racao where racao_Nome like '%" + nome + "%'").addEntity(Racao.class);
            listaRacao = query.list();

        } catch (Exception e) {
            System.out.println("Erro ao consultar por Nome: " + e.getMessage());
        } finally {
            obSession.close();
        }
        return listaRacao.get(0);
    }/*consultarPorNome =====================*/
}
