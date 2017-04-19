/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Fornece;
import model.bean.Fornecedor;
import model.dao.FornecedorDAO;
import model.bean.Notificacao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Owner
 */
public class ForneceDAO {
    
    Session obSession;
    Transaction obTx;

    Notificacao obNotificacao = new Notificacao();
    NotificacaoDAO obNotificacaoDAO = new NotificacaoDAO();

    List<Fornece> listaFornece = new ArrayList<Fornece>();
    List<Fornecedor> listaFornecedor = new ArrayList<Fornecedor>();
    
    FornecedorDAO obFornecedorDAO = new FornecedorDAO();

    public void cadastrar(Fornece obFornece) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obFornece);
            obTx.commit();
            obSession.close();

            /*Salvar Notificação*/
//            obNotificacao.setNotificacaoTitulo(String.valueOf("Ração cadastrada com sucesso"));
//            obNotificacao.setNotificacaoDescricao(String.valueOf("Ração: " + obFornece.getForneceNome() + " | Preço: " + obFornece.getFornecePrecoAtual() + "| Estoque " + obFornece.getForneceEstoque()));
//            obNotificacaoDAO.notificacaoDeCadastro(obNotificacao);

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }/*try ====================*/

    }/*Cadatrar =========================*/


    public void excluir(Fornece obFornece) {

        try {
            
            System.out.println("aqui 1");
            obSession = new ConnectionFactory().getSessionFactory();
            System.out.println("aqui 2");
            obTx = obSession.beginTransaction();
            System.out.println("aqui 3");
            /*Configura a notificação antes de serem excluidos os dados*/
//            obNotificacao.setNotificacaoDescricao(String.valueOf("Ração: " + obFornece.getForneceNome() + " | Preço: " + obFornece.getFornecePrecoAtual()+ "| Estoque " + obFornece.getForneceEstoque()));

            obSession.delete(obFornece);
            System.out.println("aqui 4");
            obTx.commit();
            System.out.println("aqui 5");
            obSession.close();
            System.out.println("Ração excluida com sucesso");

            /*Salvar Notificação*/
//            obNotificacao.setNotificacaoTitulo("Raçao excluida com sucesso");
//            obNotificacaoDAO.notificacaoDeExclusao(obNotificacao);
//            System.out.println("Notificação salvar com sucesso");

        } catch (Exception e) {
            System.out.println("ERRO ao excluir racao: " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }/*try =====================*/

    }/*Excluir ==========================*/

    public void alterar(Fornece obFornece) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obFornece);
            obTx.commit();
            obSession.close();
        } catch (Exception e) {
            System.out.println("Erro ForneceDAO alterar" + e.getMessage());
            obTx.rollback();
            obSession.close();
        }
    }

    public List<Fornece> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaFornece = obSession.createCriteria(Fornece.class).list();

        } catch (Exception e) {
            e.getMessage();

        } finally {
            obSession.close();
        }/*try ================*/

        return listaFornece;
    }/*listar ============================== */

    public Fornece buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("select * from racao where racao_Codigo =" + codigo + ";").addEntity(Fornece.class);

            listaFornece = query.list();
            obSession.close();
        } catch (Exception e) {
            e.getMessage();
        }
        return listaFornece.get(0);
    }/*buscarPoCodigo ===================*/
    
    public List<Fornece> fornecimentosPorRacao(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.fornece where fk_F_racao_Codigo = " + codigo + ";").addEntity(Fornece.class);
            listaFornece = query.list();
            obSession.close();
        } catch (Exception e) {
            System.out.println("ERRO fornecimentosPorRacao: " + e.getMessage());
        }
        return listaFornece;
    }/*buscarPoCodigo ===================*/
   
    
    public List<Fornecedor> fornecedoresPorRacao(int codigo) {

        /*Executa o SQL para saber todos os fornecimentos agrupados por pela chave do fornecedor*/
        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.fornece where fk_F_racao_Codigo = " + codigo + " GROUP BY fk_F_fornecedor_Codigo;").addEntity(Fornece.class);
            listaFornece = query.list();
            obSession.close();
        } catch (Exception e) {
            System.out.println("ERRO: " + e.getMessage());
        }/*try ====================*/
        
        /*Busca e adiciona os fornecedores do objeto criado anteriormente para o novo objeto*/
        try {
            for (int index = 0; index < listaFornece.size(); index++) {
            listaFornecedor.add(obFornecedorDAO.buscarCodigo(listaFornece.get(index).getFornecedor().getFornecedorCodigo()));
        }
        } catch (Exception e) {
            System.out.println("ERR: " + e.getMessage());
        }/*try ========================*/
        
        
        return listaFornecedor;
    }/*buscarPoCodigo ===================*/
    
}
