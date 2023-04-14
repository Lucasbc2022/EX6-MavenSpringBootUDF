<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/styles.css"/>'>
<title>Funcionario</title>
</head>
<body>
    <div>
          <jsp:include page="menu.jsp"/>
    </div>
    <div align="center">
          <form action="funcionario" method="get"></form> 
    <br />
    <br />
    </div>
	<div align="center">
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
		<c:if test="${not empty saida }">
			<H2><c:out value="${saida }" /></H2>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty listaFunc }">
			<table border="1" class="table_round">
				<thead>
					<tr>
						<th>Nome do Funcionario</th>
						<th>Nome do Dependente</th>
						<th>Salario do Funcionario</th>
						<th>Salario do Dependente</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listaFunc }" var="lf">
						<tr align="center">
							<td><c:out value="${lf.nome_funcionario }"></c:out></td>
							<td><c:out value="${lf.nome_dependente }"></c:out></td>
							<td><c:out value="${lf.salario_funcionario }"></c:out></td>
							<td><c:out value="${lf.salario_dependente }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>	
	</div>

    <br />
    <br />
	<div align="center">
		<c:if test="${not empty salarios }">
			<table border="1" class="table_round">
				<thead>
					<tr>
						<th>Salario Total</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${salarios }" var="s">
						<tr align="center">
							<td><c:out value="${s.salario_total }"></c:out></td>
						</tr>
				    </c:forEach>
				</tbody>
			</table>
		</c:if>	
	</div>     
</body>
</html>