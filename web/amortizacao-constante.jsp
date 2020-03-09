<%-- 
    Document   : amortizacao-constante
    Created on : 08/03/2020, 20:37:27
    Author     : Felipe Navarro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Amortização constante</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="estilo/main.css" />
    <body>
       <%@include file="WEB-INF/jspf/header.jspf" %>
       <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
       
        <section id="one" class="wrapper">
            <div class="inner">
                <div class="">
                    <h2>Amortização constante</h2>
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
                    <% } else{ 
                        try {
                        double i=0, qtdParcelas=0, valorDivida=0, amortizacao=0, juros=0, totalAmortizacao=0, totalJuros=0, prestacao=0,totalPrestacao=0;                        
                        i = Double.parseDouble(request.getParameter("taxa"))/100;
                        valorDivida = Double.parseDouble(request.getParameter("valorDivida"));
                        qtdParcelas = Double.parseDouble(request.getParameter("qtdParcelas"));
                        amortizacao = valorDivida / qtdParcelas;%>
                     
                    <table>
                        <thead>
                            <tr>
                                <th>Período</th>
                                <th>Prestação</th>
                                <th>Juros</th>
                                <th>Amortização</th>
                                <th>Saldo Devedor</th>
                            </tr>
                        </thead>
                        <tr >
                            <td> 0 </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>R$ <%=valorDivida%></td>
                             <%for (int x = 1; x <= qtdParcelas; x++) {                                
                                juros = valorDivida * i;
                                prestacao = amortizacao + juros;
                                totalPrestacao = prestacao + totalPrestacao;
                                
                                totalJuros= juros + totalJuros;
                                totalAmortizacao = amortizacao + totalAmortizacao;
                                valorDivida = valorDivida - amortizacao;
                             %>
                        </tr>
                        <tr>
                            <td><%=x%></td>
                            
                            <td>R$ <%=prestacao%></td>
                            <td>R$ <%=juros%></td>
                            <td>R$ <%=amortizacao%></td>
                            <td>R$ <%=valorDivida%></td>
                        </tr>
                        <%}%>
                        <tr>
                            <td> Total</td>
                            <td >R$ <%=totalPrestacao%></td>
                            <td >R$ <%=totalJuros%></td>
                            <td >R$ <%=totalAmortizacao%></td>
                            <td ></td>

                        </tr>
                    </table>
                    <% } catch (Exception ex) { %>
                         <h3>Erro ao realizar o cálculo</h3>
                    <%}
                    }%>
                </div>
            </div>
        </section>
                <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</head>
</html>

