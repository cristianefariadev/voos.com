<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cadastro de passageiro</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="page-header">
		<h1>Passageiro</h1>
		<ul class="breadcrumb">
			<li><a href="index.jsp">home</a></li>
			<li>passageiro</li>
		</ul>
	</div>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="bloco">
					<form action="Passageiro" method="POST">
						<div class="row">
							<div class="col-md-6"></div>
							<div class="col-md-6">
								<div class="input-group">
									<input type="text" id="pesquisa" name="pesquisa"
										class="form-control" placeholder="Digite o nome..."> <span
										class="input-group-btn">
										<button class="btn btn-primary" value="Pesquisar" name="botao"
											type="submit">Pesquisar</button>
									</span>
								</div>
							</div>
						</div>
					</form>
				</div>
				<h3>Cadastro de Passageiro</h3>
				<hr>
				<div class="bloco">
					<form action="Passageiro" method="POST">

						<div class="form-group hide">
							<label for="codigo">C�digo</label> <input type="text"
								class="form-control" id="codigo" readonly="readonly"
								placeholder="c�digo" name="codigo"
								value="<c:out value="${passageiro.id}"/>">
						</div>

						<div class="form-group col-md-9">
							<label for="nome">Nome</label> <input type="text"
								class="form-control" id="nome" placeholder="nome" name="nome"
								value="<c:out value="${passageiro.pessoa.nome}"/>">
						</div>
						<div class="form-group col-md-3">
							<label for="datepicker">Data de Nascimento</label>
							<p>
								<input type="date" id="dataNascimento" name="dataNascimento"
									class="form-control"
									value="<fmt:formatDate pattern="MM/dd/yyyy" value="${passageiro.pessoa.dataNascimento}" />">
							</p>
						</div>

						<div class="form-group col-md-3">
							<label for="cpf">CPF</label> <input type="text"
								class="form-control" id="cpf" placeholder="cpf" name="cpf"
								value="<c:out value="${passageiro.pessoa.cpf.numero}"/>">
						</div>

						<div class="form-group col-md-3">
							<label for="cpf">CNPJ</label> <input type="text"
								class="form-control" id="cnpj" placeholder="CNPJ" name="cnpj"
								value="<c:out value="${passageiro.pessoa.cnpj.numero}"/>">
						</div>

						<div class="form-group col-md-3">
							<label>Estado Civil</label> <select class="form-control"
								id="estadoCivil" name="estadoCivil"
								value="<c:out value="${passageiro.pessoa.estadoCivil}"/>">
								<option>Casado</option>
								<option>Solteiro</option>
								<option>Divorciado</option>
								<option>Viuvo</option>
							</select>
						</div>

						<div class="form-group col-md-3">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" placeholder="email" name="email"
								value="<c:out value="${passageiro.pessoa.email}"/>">
						</div>
						<div class="form-group col-md-3">
							<label for="telefone">Telefone</label> <input type="text"
								class="form-control" id="telefone" placeholder="telefone"
								name="telefone"
								value="<c:out value="${passageiro.pessoa.telefone}"/>">
						</div>
						<div class="form-group col-md-9">
							<label for="endereco">Endereco</label> <input type="text"
								class="form-control" id="endereco" placeholder="endere�o"
								name="endereco"
								value="<c:out value="${passageiro.pessoa.endereco}"/>">
						</div>
						<div class="form-group col-md-3">
							<label for="telefone">Milhagem</label> <input type="text"
								class="form-control" id="milhagem" placeholder="milhagem"
								name="milhagem" value="<c:out value="${cliente.milhagem}"/>">
						</div>
						<div class="form-group col-md-3">
							<label for="telefone">Percentual de Desconto</label> <input
								type="text" class="form-control" id="percentDesconto"
								placeholder="desconto" name="percentDesconto"
								value="<c:out value="${cliente.percentDesconto}"/>">
						</div>

						<div class="form-group col-md-3">
							<label>Tipo Cliente</label> <select class="form-control"
								id="estadoCivil" name="estadoCivil"
								value="<c:out value="${cliante.tipoCliente}"/>">
								<option>Cliente Final</option>
								<option>Parceiro</option>
							</select>
						</div>



						<div class="text-right">
							<input class="btn btn-success" type="submit"
								value="Cadastrar Passageiro" name="botao">
						</div>



					</form>
				</div>

				<h3>Lista de Passageiros</h3>
				<hr>
				<div class="bloco">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>C�digo</th>
								<th>Nome</th>
								<th>Endere�o</th>
								<th>CPF</th>
								<th>CNPJ</th>
								<th>E-Miail</th>
								<th>Telefone</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${passageiros}" var="passageiro">
								<tr>
									<td><c:out value="${passageiro.id}" /></td>
									<td><c:out value="${passageiro.pessoa.nome}" /></td>
									<td><c:out value="${passageiro.pessoa.endereco}" /></td>
									<td><c:out value="${passageiro.pessoa.cpf.numero}" /></td>
									<td><c:out value="${passageiro.pessoa.cnpj.numero}" /></td>
									<td><c:out value="${passageiro.pessoa.email}" /></td>
									<td><c:out value="${passageiro.pessoa.telefone}" /></td>
									<c:if test="teste">
										<td><c:out value="${passageiro.teste}" /></td>
									</c:if>
									<td><a class="btn btn-warning"
										href="Passageiro?acao=editar&codigo=<c:out value="${passageiro.id}"/>">Alterar</a></td>
									<td><a class="btn btn-success"
										href="Passageiro?acao=excluir&codigo=<c:out value="${passageiro.id}"/>">Remover</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>