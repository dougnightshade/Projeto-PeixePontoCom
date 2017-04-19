/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.sql.Time;
import java.util.List;
import model.bean.Notificacao;
import model.bean.TipoNotificacao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Owner
 */
public class NotificacaoDAO {

    /*Hibernate*/
    Session obSession;
    Transaction obTx;

    /*Objetos utilzidos nos métodos*/
    Notificacao obNotificacao = new Notificacao();
    TipoNotificacao obTipoNotificacao = new TipoNotificacao();
    TipoNotificacaoDAO obTipoNotificacaoDAO = new TipoNotificacaoDAO();
    List<Notificacao> listaNotificacao = new ArrayList<Notificacao>();

    /*
        Tipo de Notificação tem os seguintes codigos
    
    1	Notificação	panel-info
    2	Alarme/ERRO	panel-danger
    3	Cadastro	panel-success
    4	Alteração	panel-warning
    5	Exclusão	panel-yellow
           
     */
    public void notificacaoDeCadastro(Notificacao obNotificacao) {

        /*================= Gera o Objeto*/
        try {

            obNotificacao.setNotificacaoTitulo(obNotificacao.getNotificacaoTitulo());
            obNotificacao.setNotificacaoDescricao(obNotificacao.getNotificacaoDescricao());

            /*Instância a data e a hora atual no servidor para ser salva na notificação*/
            Date obDate = new Date();
            obNotificacao.setNotificacaoData(obDate);
            obNotificacao.setNotificacaoHora(obDate);

            /*
            Tipo de Notificação tem os seguintes codigos
    
        1	Notificação	panel-info
        2	Alarme/ERRO	panel-danger
        3	Cadastro	panel-success
        4	Alteração	panel-warning
        5	Exclusão	panel-yellow
           
             */
            obNotificacao.setTipoNotificacao(obTipoNotificacaoDAO.buscarCodigo(3));

        } catch (Exception e) {
            System.out.println("\n\n\n\n\n\nERRO ao criar os objetos: " + e.getMessage());

        }/*Gerar objeto ===================*/

 /*================== Salvar no banco*/
        try {
            obSession = new ConnectionFactory().getSessionFactory();

            obTx = obSession.beginTransaction();
            obSession.save(obNotificacao);

            /*Confirma o salvamento ao banco*/
            obTx.commit();

        } catch (Exception e) {
            System.out.println("\n\n\n\n\n\nERRO ao Salvar" + e.getMessage());
        }/*Salvar no banco =======================*/

    }/*Notificação de Cadastro ================*/

    public void notificacaoDeExclusao(Notificacao obNotificacao) {

        /*================= Gera o Objeto*/
        try {

            obNotificacao.setNotificacaoTitulo(obNotificacao.getNotificacaoTitulo());
            obNotificacao.setNotificacaoDescricao(obNotificacao.getNotificacaoDescricao());

            /*Instância a data e a hora atual no servidor para ser salva na notificação*/
            Date obDate = new Date();
            obNotificacao.setNotificacaoData(obDate);
            obNotificacao.setNotificacaoHora(obDate);

            /*
            Tipo de Notificação tem os seguintes codigos
    
        1	Notificação	panel-info
        2	Alarme/ERRO	panel-danger
        3	Cadastro	panel-success
        4	Alteração	panel-warning
        5	Exclusão	panel-yellow
           
             */
            obNotificacao.setTipoNotificacao(obTipoNotificacaoDAO.buscarCodigo(5));

        } catch (Exception e) {
            System.out.println("\n\n\n\n\n\nERRO ao criar os objetos: " + e.getMessage());

        }/*Gerar objeto ===================*/

        
 /*================== Salvar no banco*/
        try {
            obSession = new ConnectionFactory().getSessionFactory();

            obTx = obSession.beginTransaction();
            obSession.save(obNotificacao);

            /*Confirma o salvamento ao banco*/
            obTx.commit();

        } catch (Exception e) {
            System.out.println("\n\n\n\n\n\nERRO ao Salvar" + e.getMessage());
        } finally {
            obSession.close();
        }
        /*Salvar no banco =======================*/

    }/*Notificação de Cadastro ================*/


    public Notificacao buscarCodigo(int codigo) {

        try {

            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM notificacao where notificacao_Codigo = " + codigo + ";").addEntity(Notificacao.class);

            listaNotificacao = query.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaNotificacao.get(0);
    }

    public List<Notificacao> listar() {
        
        
        try {
            obSession = new ConnectionFactory().getSessionFactory();
           Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.notificacao order by notificacao_Codigo desc").addEntity(Notificacao.class);

            listaNotificacao = query.list();
        } catch (Exception e) {
            System.out.println("\n\n\n\n\n\n\nERRO: " + e.getMessage());
            obSession.close();
        }
        /*try =============*/

        return listaNotificacao;
    }/*listar ==============*/

    public List<Notificacao> listarLimit3() {
        
        
        try {
            obSession = new ConnectionFactory().getSessionFactory();
           Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.notificacao order by notificacao_Codigo desc limit 3").addEntity(Notificacao.class);

            listaNotificacao = query.list();
        } catch (Exception e) {
            System.out.println("\n\n\n\n\n\n\nERRO: " + e.getMessage());
            obSession.close();
        }
        /*try =============*/

        return listaNotificacao;
    }/*listar ==============*/
    
}
