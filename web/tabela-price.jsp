<%-- 
    Document   : tabela-price.jsp
    Created on : 08/03/2020, 17:57:09
    Author     : Antoní Mario
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <h1>Tabela Price - Sistema de Amortizacao Frances (SAF)</h1>
        <br/>
        <form>
            <label>Valor do Empréstimo:</label><br>
            <input type="text" id="empVal" placeholder="Ex: 50000"><br>
            <label>Quantos meses(parcelas):</label><br>
            <input type="text" id="mQtd" placeholder="Ex: 120">
            <label>% de juros ao mês:</label><br>
            <input type="text" id="jAm" placeholder="Ex: 1,5">

            <%
                String empVal = request.getParameter("empVal");
                String mQtd = request.getParameter("mQtd");
                String jAm = request.getParameter("jAm");
                                
                if ((empVal != "" && empVal != null) || (mQtd != "" && mQtd != null) || (jAm != "" && jAm != null)){
                    try {                       
                        float valEmprest = Float.parseFloat(empVal);
                        int qtdMeses = Integer.parseInt(mQtd);
                        float jurAM = Float.parseFloat(jAm);
                        float jUnit = jurAM / 100;
                        double calcPotenci = Math.pow((1 + jUnit), qtdMeses);
                        double calcTotalPotenc = (((calcPotenci) * jUnit) / ((calcPotenci) - jUnit));
                        
                        double parcVal = (valEmprest * calcTotalPotenc);
                        double totalDevido = parcVal * qtdMeses;
                        
                        double presTotal = 0;
                        double jurTotal = 0;
                        double amortTotal = 0;
                                                
                        double saldoDev, juros, amort; 
                        saldoDev = valEmprest;

                         if ((valEmprest >= 1) && (qtdMeses >= 1) && (jurAM >= 1)) {                             
                            %>
                                    <%try {%>
                                            <%int n = Integer.parseInt(request.getParameter("n"));%>
                                            
                                            <table>
                                                <thead>
                                                    <tr><th>Índice</th><th>Número</th></tr>
                                                </thead>
                                                <%for (int i = 1; i <= n; i++) {%>
                                                    <tbody>
                                                        <tr>
                                                            <th><%= i%></th>
                                                            <td><%= (int) (Math.random() * 1000)%></td>
                                                        </tr>
                                                    </tbody>
                                                <%}%>
                                            </table>
                                    <%} catch (Exception ex) {%>

                                        <%}%>
                                        
                                          <table>
                                            <thead>
                                                <tr>
                                                    <th> Período </th>
                                                    <th> Parcela </th>
                                                    <th> Juros </th>
                                                    <th> Amortização </th>
                                                    <th> Saldo Devedor </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <th>0</th>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(saldoDev)%></td>
                                                    <td></td>                                  
                                                </tr>
                                                    <%
                                                        for (int i = 1; i <= qtdMeses; i++) {
                                                            juros = (saldoDev * (jurAM/100));
                                                            amort = parcVal - juros;
                                                            saldoDev = saldoDev - amort;    
                                                            presTotal = presTotal + parcVal;
                                                            jurTotal = jurTotal + juros;
                                                            amortTotal = amortTotal + amort;
                                                        if (saldoDev < 0) {
                                                            saldoDev = 0;
                                                        }
                                                    %>
                                                <tr>
                                                    <th><%= i%></th>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(parcVal)%></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(juros)%></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(amort)%></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(saldoDev)%></td>
                                                </tr>
                                                    <%}
                                                    %>
                                                <tr>
                                                    <th><%="TOTAL"%></th>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(presTotal)%></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(jurTotal)%></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(amortTotal)%></td>
                                                    
                                                </tr>
                                                    
                                            </tbody>
                                        </table>
                            <%          
                                     }
                                else
                                    JOptionPane.showMessageDialog(null, "Opção Invalida");
                                        }
        catch(NumberFormatException e) {
        JOptionPane.showMessageDialog(null, "Opção Invalida");    
                                                    }
}

                                
                            %> 


        </form>
    </body>
</html>
