package br.edu.fateczl.SpringUDF.persistence;

import java.sql.SQLException;
import java.util.List;

import br.edu.fateczl.SpringUDF.model.Funcionario;
import br.edu.fateczl.SpringUDF.model.Salario;

public interface IFuncionarioDAO {
	
	public List<Funcionario> listarSalarios() throws SQLException, ClassNotFoundException;
    public List<Salario> somarSalarios() throws SQLException, ClassNotFoundException;
}
