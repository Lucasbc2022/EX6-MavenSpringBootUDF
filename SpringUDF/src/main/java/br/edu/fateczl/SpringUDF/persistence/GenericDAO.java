package br.edu.fateczl.SpringUDF.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

@Repository
public class GenericDAO {

	private Connection c;

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		String hostName = "localhost";
		String dbName = "pratica_funcao";
		String user = "sa";
		String senha = "123456";
		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		c = DriverManager.getConnection(String.format(
				"jdbc:jtds:sqlserver://%s:50080;databaseName=%s;user=%s;password=%s;", hostName, dbName, user, senha));

		return c;
	}

}