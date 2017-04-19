/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Rilmar
 */
public class Conexao {
    Statement stm;
    public static Connection getConnection(){
    Connection con= null;
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url="jdbc:mysql://localhost:3306/peixepontocom";
        String login="root";
        String senha="123456";
        con= DriverManager.getConnection(url,login,senha);
    }catch(Exception erro){
        JOptionPane.showMessageDialog(null, "Erro ao Conectar: \n "+erro.getMessage());
    } 
    return con;
}
    
}

