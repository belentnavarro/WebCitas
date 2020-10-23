<%-- 
    Document   : passwdOlvidada
    Created on : 18-oct-2020, 19:22:20
    Author     : belen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contraseña olvidada</title>
        <link rel="stylesheet" type="text/css" href="Estilos/estilosGenerales.css">
        <link rel="icon" type="image/png" href="Images/favicon-webcitas.png">
        <script src="JS/validacionLogin.js"></script>
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
            <form name="passwdOlvidada" action="../Controladores/controladorLogin.jsp" class="col-m-4">
                <p>
                    <label for="email">Introduce tu email:</label>
                    <input name="emailPasswd" id="emailPasswd" required/>
                    <span class="error" aria-live="polite"></span>
                </p>
                <p>
                    <input type="submit" name="enviarEmail" value="Enviar nueva contraseña" class="boton"/>
                </p>
                <p>
                    <a href="../index.jsp">Volver al login</a>
                </p>
            </form>
            <div class="col-m-4"></div>
        </main>
        <footer class="row">
            <p class="col-m-12 col-l-12">© Belén Trujillo Navarro</p>
        </footer>
    </body>
</html>
