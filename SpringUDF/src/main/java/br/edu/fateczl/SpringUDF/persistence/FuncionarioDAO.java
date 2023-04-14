package br.edu.fateczl.SpringUDF.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.edu.fateczl.SpringUDF.model.Funcionario;
import br.edu.fateczl.SpringUDF.model.Salario;

@Repository
public class FuncionarioDAO implements IFuncionarioDAO{
	
	@Autowired
	private GenericDAO gDao;

	@Override
	public List<Funcionario> listarSalarios() throws SQLException, ClassNotFoundException {
		List<Funcionario> listafunc = new ArrayList<>();
		Connection c = gDao.getConnection();
		String sql = "SELECT * FROM fn_funcdenp()";
		
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			Funcionario funcionario = new Funcionario();
			funcionario.setNome_funcionario(rs.getString("Nome_Funcionario"));
			funcionario.setNome_dependente(rs.getString("Nome_Dependente"));
			funcionario.setSalario_funcionario(rs.getFloat("Salario_Funcionario"));
			funcionario.setSalario_dependente(rs.getFloat("Salario_Dependente"));
			listafunc.add(funcionario);
		
		}
		
		return listafunc;
	}

	@Override
	public List<Salario> somarSalarios() throws SQLException, ClassNotFoundException {
		List<Salario> salarios = new ArrayList<>();
		Connection c = gDao.getConnection();
		String sql = "SELECT * FROM fn_somarsalario()";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Salario salario = new Salario();
			salario.setSalario_total(rs.getFloat("salario_total"));
			salarios.add(salario);
		}
		return salarios;
	}

}
