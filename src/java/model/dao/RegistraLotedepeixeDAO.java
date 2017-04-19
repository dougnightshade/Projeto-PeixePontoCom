/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Gaiola;
import model.bean.RegistraLotedepeixe;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class RegistraLotedepeixeDAO {

    Session obSession;
    Transaction obTx;

    List<RegistraLotedepeixe> listaRegistraLotedepeixe = new ArrayList<RegistraLotedepeixe>();
    List<Gaiola> listaGaiola = new ArrayList<Gaiola>();

    public void cadastrar(RegistraLotedepeixe obRegistraLotedepeixe) {
        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obRegistraLotedepeixe);
            obTx.commit();
            obSession.close();
            System.out.println("Passou cadastrar RegistraLotedepeixe");
        } catch (Exception e) {
            System.out.println("ERRO cadastrar RegistraLotedepeixe: " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }
    }/*cadastrar =================*/

    public void excluir(RegistraLotedepeixe obRegistraLotedepeixe) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obRegistraLotedepeixe);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(RegistraLotedepeixe obRegistraLotedepeixe) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obRegistraLotedepeixe);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public List<RegistraLotedepeixe> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaRegistraLotedepeixe = obSession.createCriteria(RegistraLotedepeixe.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaRegistraLotedepeixe;
    }

    public RegistraLotedepeixe buscarCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.registra_lotedepeixe where registra_LoteDePeixe_Codigo = " + codigo).addEntity(RegistraLotedepeixe.class);

            listaRegistraLotedepeixe = query.list();

        } catch (Exception e) {
            System.out.println("ERRO buscar Codigo RegistraLote: " + e.getMessage());
            obSession.close();
        }
        return listaRegistraLotedepeixe.get(0);
    }/*buscarCodigo ===============================*/

    public List<RegistraLotedepeixe> listarLoteAtivos() {
        /*Com o passar do tempo começaram a existir lotes que ja terminaram sua vida, sendo vendido assim então eles deixam de existir dentro do sistema para fins 
        de estoque*/
        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.registra_lotedepeixe where registra_LoteDePeixe_Ativo = 1;").addEntity(RegistraLotedepeixe.class);

            listaRegistraLotedepeixe = query.list();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaRegistraLotedepeixe;
    }/*listarLoteAtivos ===========================*/
    
    
    public List<RegistraLotedepeixe> listarLoteAtivosMenorQueEtapa4() {
        /*Com o passar do tempo começaram a existir lotes que ja terminaram sua vida, sendo vendido assim então eles deixam de existir dentro do sistema para fins 
        de estoque*/
        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.registra_lotedepeixe where registra_LoteDePeixe_Ativo = 1 and registra_LoteDePeixe_Codigo not in (SELECT fk_Bpi_registra_LoteDePeixe_Codigo FROM peixepontocom.biometria_peixe_item WHERE biometria_peixe_item.biometria_Peixe_Item_NumeroEtapa = 4);").addEntity(RegistraLotedepeixe.class);

            listaRegistraLotedepeixe = query.list();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaRegistraLotedepeixe;
    }/*listarLoteAtivosMenorQueEtapa4 ===========================*/

    public List<Gaiola> ListarGaiolasDisponiveis() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query obQuery = obSession.createSQLQuery("SELECT * FROM peixepontocom.gaiola where fk_G_status_Gaiola_Codigo = 1").addEntity(Gaiola.class);

            listaGaiola = obQuery.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaGaiola;
    }

    /*listarPorStatus ====================*/
    public List<Gaiola> ListarGaiolasEmUtilizacao() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query obQuery = obSession.createSQLQuery("SELECT * FROM peixepontocom.gaiola where fk_G_status_Gaiola_Codigo = 2").addEntity(Gaiola.class);

            listaGaiola = obQuery.list();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaGaiola;
    }
    /*listarPorStatus ====================*/

}
