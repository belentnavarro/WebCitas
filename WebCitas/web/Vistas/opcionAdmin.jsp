<%-- 
    Document   : opcionAdmin
    Created on : 18-oct-2020, 19:59:22
    Author     : belen
--%>

<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>¿Administrador o usuario?</title>
        <link rel="stylesheet" type="text/css" href="Estilos/estilosGenerales.css">
        <!--<link rel="icon" type="image/png" href="Images/favicon-webcitas.png">-->
    </head>
    <body>
        <header class = "row">
            <div class = "col-l-4 col-m-2"></div>
            <div class = "col-l-4 col-m-2">
                <!-- IMAGEN DE LOGIN <img src = ""/> -->
            </div>
            <div class = "col-l-4 col-m-2"></div>
        </header>
        <main class="row">
            <div class="col-m-4"></div>
            <form name="login" action="../Controladores/controladorLogin.jsp" method="POST" class="col-m-4">
                <%
                    Persona usuario = (Persona) session.getAttribute("usuario");
                    String nombre = usuario.getNombre();
                    String sexo = usuario.getSexo();
                    
                    if(sexo.equals("hombre")){
                    %>
                        <h1>Bienvenido, <%=nombre%></h1>
                    <%
                    } else if (sexo.equals("mujer")){
                    %>
                        <h1>Bienvenida, <%=nombre%></h1>
                    <%
                    }
                %>
                <p>¿Quieres entrar como usuario o como administrador?</p>
                <p>
                    <input name="entrarAdmin" type="submit" value="Entrar como administrador" class="boton">
                </p>
                <p>
                    <input name="entrarUsuario" type="submit" value="Entrar como usuario" class="boton">
                </p>
                <p>
                    <input name="cerrarSesion" type="submit" value="Cerrar sesión" class="boton"> 
                </p>
            </form>
                <div class="col-m-4"></div>
        </main>
    </body>
</html>
