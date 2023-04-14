package br.edu.fateczl.SpringUDF.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.SpringUDF.model.Funcionario;
import br.edu.fateczl.SpringUDF.model.Salario;
import br.edu.fateczl.SpringUDF.persistence.FuncionarioDAO;

@Controller
public class FuncionarioController {
	
	@Autowired
	FuncionarioDAO fDao;
	
	@RequestMapping(name = "funcionario", value = "/funcionario", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		List<Funcionario> listaFunc = new ArrayList<>();
		List<Salario> salarios = new ArrayList<>();
		String erro = "";
        try {
        	listaFunc = fDao.listarSalarios();
        	salarios = fDao.somarSalarios();
        } catch (SQLException | ClassNotFoundException e) {
        	erro = e.getMessage();
        } finally {
        	
        }
        model.addAttribute("erro", erro);
        model.addAttribute("listaFunc", listaFunc);
        model.addAttribute("salarios", salarios);
		
		return new ModelAndView("funcionario");
	}

}
