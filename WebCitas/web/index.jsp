<%-- 
    Document   : index
    Created on : 18-oct-2020, 18:31:09
    Author     : belen
--%>

<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="Estilos/estilosGenerales.css">
        <!--<link rel="icon" type="image/png" href="Images/favicon-webcitas.png">-->
        <script src="JS/validacionLogin.js"></script>
    </head>
    <body onload="validarLogin()">
        <header class = "row">
            <div class = "col-l-4 col-m-2"></div>
            <div class = "col-l-4 col-m-2">
                <!-- IMAGEN DE LOGIN <img src = ""/> -->
            </div>
            <div class = "col-l-4 col-m-2"></div>
        </header>
        <main class = "row">
            <div class = "col-m-4"></div>
            <form novalidate name="login" action="Controladores/controladorLogin.jsp" method="POST" class="col-m-4">
                <p>
                    <label for="email">Email:</label>
                    <input name="email" type="email" id="email" placeholder="ejemplo@ejemplo.com" required/>
                    <span class="error" aria-live="polite"></span>
                </p>
                <p>
                    <label for="passwd">Contraseña:</label>
                    <input name="passwd" type="password" id="passwd" placeholder="Introduce tu contraseña" required/>
                    <span class="error" aria-live="polite"></span>
                </p>
                <%
                    if(session.getAttribute("error-mensaje") != null){
                        String mensajeError = (String) session.getAttribute("error-mensaje");
                        
                %>
                <span name="error-mensaje"><%=mensajeError%></span>
                <%
                    }
                %>
                <p>
                    <input type="submit" name="aceptar" value="Login" class="boton"/>
                </p>
                <p><a href="Vistas/passwdOlvidada.jsp">He olvidado la contraseña.</a></p>
                <p><a href="Vistas/registro.jsp">Registrate aquí y encuentra a tu media naranja.</a></p>
            </form>
            <div class="col-l-4 col-m-2"></div>
        </main>
        <footer>
            <p>© Belén Trujillo Navarro</p>
        </footer>
    </body>
</html>
