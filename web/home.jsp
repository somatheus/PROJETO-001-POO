<%-- 
    Document   : home
    Created on : 07/03/2020, 13:18:06
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilo/main.css" />
        <title>Home</title>
    </head>
    <body>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
            
            <section id="one" class="wrapper">
                <div class="inner">
                    <div class="flex flex-3">
                        <article>
                            <header>
                                <h3>Amortização constante</h3>
                            </header>
                            <p> É uma forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo</p>
                            <footer>
                                <a href="amortizacao-constante.jsp" class="button special">Calcular</a>
                            </footer>
                        </article>
                        <article>
                            <header>
                                <h3>Amortização americana</h3>
                            </header>
                            <p>É um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor</p>
                            <footer>
                                <a href="amortizacao-americana.jsp" class="button special">Calcular</a>
                            </footer>
                        </article>
                        <article>
                            <header>
                                <h3>Tabela price</h3>
                            </header>
                            <p>É um método usado em amortização de empréstimo cuja principal característica é apresentar prestações iguais</p>
                            <footer>
                                <a href="#" class="button special">Calcular</a>
                            </footer>
                        </article>
                    </div>
                </div>
            </section>
           
        
         <section id="two" class="wrapper style1 special">
            <div class="inner">
                <header>
                    <h2>Integrantes do Grupo</h2>
                </header>
                <div class="flex flex-4">
                    <div class="box person">
                        <div class="image round">
                            <img src="imagens/antoni.jpeg" alt="Person 1" />
                        </div>
                        <h3>Antoní Mario Gomes dos Santos</h3>
                        <p>Estudante de Análise e Desenvolvimento de Sistemas</p>
                    </div>
                    <div class="box person">
                        <div class="image round">
                            <img src="imagens/dario.jpg" />
                        </div>
                        <h3>Dario Rodrigues de Melo</h3>
                        <p>Estudante de Análise e Desenvolvimento de Sistemas</p>
                    </div>
                    <div class="box person">
                        <div class="image round">
                            <img src="imagens/felipe.jpg" alt="Person 3" />
                        </div>
                        <h3>Felipe Navarro Ferreira</h3>
                        <p>Estudante de Análise e Desenvolvimento de Sistemas</p>
                    </div>
                    <div class="box person">
                        <div class="image round">
                            <img src="imagens/matheus.jpg"/>
                        </div>
                        <h3>Matheus Oliveira Santos</h3>
                        <p>Estudante de Análise e Desenvolvimento de Sistemas</p>
                    </div>
                    <div class="box person">
                        <div class="image round">
                            <img src="imagens/rodrigo.jpg" alt="Person 4" />
                        </div>
                        <h3>Rodrigo Alves Fondello</h3>
                        <p>Estudante de Análise e Desenvolvimento de Sistemas</p>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
