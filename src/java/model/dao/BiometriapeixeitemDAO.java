/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.BiometriaPeixeItem;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Leonardo
 */
public class BiometriaPeixeItemDAO {

    Session obSession;
    Transaction obTx;

    List<BiometriaPeixeItem> listaBiometriaPeixeItem = new ArrayList<BiometriaPeixeItem>();

    public void cadastrar(BiometriaPeixeItem obBiometriaPeixeItem) {
        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.save(obBiometriaPeixeItem);
            obTx.commit();
            obSession.close();
            System.out.println("Cadastrou o a biometria");
        } catch (Exception e) {
            System.out.println("ERRO DAO Cadastrar: " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }/*try ============================*/

    }/*cadastrar ========================*/

    public void excluir(BiometriaPeixeItem obBiometriaPeixeItem) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.delete(obBiometriaPeixeItem);
            obTx.commit();
            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obTx.rollback();
            obSession.close();
        }

    }

    public void alterar(BiometriaPeixeItem obBiometriaPeixeItem) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            obTx = obSession.beginTransaction();
            obSession.update(obBiometriaPeixeItem);
            obTx.commit();
            obSession.close();
            System.out.println("Biometria alterada com sucesso");

        } catch (Exception e) {
            System.out.println("ERRO Alterar: " + e.getMessage());
            obTx.rollback();
            obSession.close();
        }

    }

    public List<BiometriaPeixeItem> listar() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            listaBiometriaPeixeItem = obSession.createCriteria(BiometriaPeixeItem.class).list();

            obSession.close();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }

        return listaBiometriaPeixeItem;
    }

    public BiometriaPeixeItem buscarPorCodigo(int codigo) {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.biometria_peixe_item where biometria_Peixe_Item_Codigo = " + codigo).addEntity(BiometriaPeixeItem.class);

            listaBiometriaPeixeItem = query.list();
            obSession.close();
        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaBiometriaPeixeItem.get(0);
    }/*buscaPorCodigo ================================*/


    public BiometriaPeixeItem ultimaBiometriaPorRegistroDeLoteDePeixes(int codigo) {
        /*seleciona todas as biometrias que tenham o codigo do lote ordenandoas pelo numero da etada em ordem decrescente e limitado a 1*/
        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.biometria_peixe_item WHERE fk_Bpi_registra_LoteDePeixe_Codigo = "+codigo+" and biometria_peixe_item.biometria_Peixe_Item_Ativo = 1 order by biometria_Peixe_Item_NumeroEtapa desc limit 1;").addEntity(BiometriaPeixeItem.class);

            listaBiometriaPeixeItem = query.list();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaBiometriaPeixeItem.get(0);
    }/*buscaPorCodigo ================================*/

    public Integer calcularNumeroEtapaPorRegistroLoteDePeixes(int codigo) {
        /*E necessário saber o número da etapada da biometria em que o registro de lote esta para que seja criada uma nova biometria com um número a mais*/
        Integer numeroEtapda = 0;

        /*Cria um objeto com todas as biometrias */
        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.biometria_peixe_item WHERE fk_Bpi_registra_LoteDePeixe_Codigo = " + codigo + " and biometria_Peixe_Item_Ativo = 1 order by biometria_Peixe_Item_NumeroEtapa desc limit 1;").addEntity(BiometriaPeixeItem.class);
            listaBiometriaPeixeItem = query.list();
            obSession.close();
        } catch (Exception e) {
            System.out.println("ERRO calcularNumeroEtapaPorRegistroLoteDePeixes listar: " + e.getMessage());
            obSession.close();
        }/*try ============*/

        numeroEtapda = listaBiometriaPeixeItem.get(0).getBiometriaPeixeItemNumeroEtapa() + 1;
        System.out.println("Número Etapa: " + numeroEtapda);

        return numeroEtapda;
    }/*calcularNumeroEtapaPorRegistroLoteDePeixes ==============================*/

    public List<BiometriaPeixeItem> listarBiometriaPeixeItemComPorLoteAtivo() {

        try {
            obSession = new ConnectionFactory().getSessionFactory();
            Query query = obSession.createSQLQuery("SELECT * FROM peixepontocom.biometriapeixeitem where biometriaPeixeItem_Codigo in (SELECT biometriaPeixeItem_Codigo FROM biometriapeixeitem inner join registra_lotedepeixe on registra_LoteDePeixe_Codigo = fk_B_registra_LoteDePeixe_Codigo where registra_LoteDePeixe_Ativo = 1);").addEntity(BiometriaPeixeItem.class);

            listaBiometriaPeixeItem = query.list();

        } catch (Exception e) {
            e.getMessage();
            obSession.close();
        }
        return listaBiometriaPeixeItem;
    }/*listarBiometriaPeixeItemComPorLoteAtivo ================================*/

}
