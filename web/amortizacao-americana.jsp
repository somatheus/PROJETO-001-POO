<%-- 
    Document   : amortizacao-americana
    Created on : 08/03/2020, 19:04:00
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
        <link rel="stylesheet" href="estilo/main.css" />
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <section id="one" class="wrapper">
            <div class="inner">
                <div class="">
                    <h2>Amortização americana</h2>
                    <% if (request.getParameter("calcular") == null) { %>
                    <form>
                        <article>
                            <b>Valor da Divida: 
                            <br/><input type="number" name="valorDivida"/>
                        </article>
                        
                        <article>
                            <b>Quantidade de Parcelas: 
                            <br/><input type="number" name="qtdParcelas"/>
                        </article>
                        
                        <article>
                            <b>Taxa: 
                            <br/><input type="number" step="0.01" name="taxa"/>
                        <article/>
                        
                        <br/>
                            <input type="submit" name="calcular" value="Calcular"/>
                        
                    </form>
                    
                    <% } else {
                        try {
                            double valorDivida = Double.parseDouble(request.getParameter("valorDivida"));
                            double qtdParcelas = Double.parseDouble(request.getParameter("qtdParcelas"));
                            double taxa = Double.parseDouble(request.getParameter("taxa"));
                            double parcela = 0;
                            double montante = 0;%>
                    <table border="1">
                        <tr>
                            <th> N° Parcelas</th> 
                            <th>Amortização</th>
                            <th>Juros (<%=taxa%> de <%=valorDivida%>)</th>
                            <th>Dívida</th>
                            <th>Montante</th>
                        </tr>
                        <% for (int i = 0; i <= qtdParcelas + 1; i++) {%>
                        <tr>
                            <td >
                                <% if (i <= qtdParcelas) {%>
                                <%=i%>  
                                <%} else {%> -----
                                <% }%>
                            </td>
                            <td>
                                <% if (i < qtdParcelas) {%>
                                0
                                <%} else if (i == qtdParcelas) {%>
                                <%= valorDivida%>
                                <%} else {%> -----
                                <% }%>
                            </td>
                            <td>
                                <% if (i == 0) {%>0 <%} else if (i < qtdParcelas + 1) { 
                                parcela = (valorDivida / 100) * taxa; %>
                                <%=parcela%>
                                <% montante = montante + parcela;%>
                                <% } else { %> -----
                                <% }%>
                            </td>
                            <td>
                                <% if (i < qtdParcelas) {%>
                                <%=valorDivida%>
                                <% } else if (i == qtdParcelas) {%>Total pago em juros:
                                <% } else {%> Total quitado:
                                <% }%>
                            </td>
                            <td>
                                <% if (i < qtdParcelas) {%>   
                                <%=montante%>
                                <%} else if (i == qtdParcelas) {%>
                                <%=montante%>
                                <%} else { %>
                                <% montante = montante + valorDivida;%>
                                <%=montante%>
                                </b>
                                <%}%>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                    <a href="amortizacao-americana.jsp" class="button special">Novo cálculo</a>
                <%} catch (Exception ex) {%>
                   <h3>Erro ao realizar o cálculo</h3>
                <%}%>

                <% }%>
                </div>
            </div>
        </section>
        
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
