/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.bean.Gaiola;
import model.bean.Notificacao;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class GaiolaDAO {

    Session obSession;
    Transaction obTx;

    Notificacao obNotificacao = new Notificacao();
    NotificacaoDAO obNotificacaoDAO = new NotificacaoDAO();

    List<Gaiola> listaGaiola = new ArrayList<Gaiola>();

    public void cadastrar(Gaiola obGaiola) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            System.out.println("Sessão aberta");

            obTx = obSession.beginTransaction();
            System.out.println("Iniciando transação");

            obSession.save(obGaiola);
            System.out.println("Salvando transação");

            obTx.commit();
            System.out.println("Cnfirmando transação");

            obSession.close();
            System.out.println("Fechando sessão");

            /*Gera a notificação*/
//            obNotificacao.setNotificacaoTitulo(String.valueOf("Codigo da gaiola cadastrada: " + obGaiola.getGaiolaCodigo()));
//            obNotificacao.setNotificacaoDescricao(String.valueOf("Tamanho Total M³: " + obGaiola.getGaiolaTamTotalM3()));
//            obNotificacaoDAO.notificacaoDeCadastro(obNotificacao);
        } catch (Exception e) {
            System.out.println("Erro DAO: " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }
    }/*cadastrar*/

    public void excluir(Gaiola obGaiola) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obNotificacao.setNotificacaoDescricao(String.valueOf("Codigo: " + obGaiola.getGaiolaCodigo() + "Tamanho Total: " + obGaiola.getGaiolaTamTotalM3()));

            obSession.delete(obGaiola);
            obTx.commit();
            obSession.close();
            System.out.println("Gaiola excluida com sucesso");

            obNotificacao.setNotificacaoTitulo("Gaiola excluida com sucesso");
            obNotificacaoDAO.notificacaoDeExclusao(obNotificacao);

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }/*excluir ================*/

    public void alterar(Gaiola obGaiola) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obGaiola);
            obTx.commit();
            obSession.close();
            System.out.println("Gaiola alterada com sucesso");
        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public List<Gaiola> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaGaiola = obSession.createCriteria(Gaiola.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaGaiola;
    }

    public List<Gaiola> listarPorStatus(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query obQuery = obSession.createSQLQuery("select * from gaiola where fk_status_Gaiola_Codigo =" + codigo).addEntity(Gaiola.class);

            listaGaiola = obQuery.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaGaiola;
    } /*listarPorStatus ====================*/

    public Gaiola buscarCodigo(int codigo) {

        try {

            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.gaiola where gaiola_Codigo =" + codigo + ";").addEntity(Gaiola.class);

            listaGaiola = query.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaGaiola.get(0);
    }

    public double calcularTamanhoTotalm3Gaiola(double alt, double lar, double com) {
        double tamtotalgaiola = 0;
        tamtotalgaiola = alt * lar * com;
        return tamtotalgaiola;
    }
}
