<%-- 
    Document   : emailEnviado
    Created on : 18-oct-2020, 22:26:30
    Author     : belen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva contraseña enviada</title>
        <link rel="stylesheet" type="text/css" href="Estilos/estilosGenerales.css">
        <link rel="icon" type="image/png" href="Images/favicon-webcitas.png">
    </head>
    <body>
        <header class = "row">
            <div class = "col-l-4 col-m-2"></div>
            <div class = "col-l-4 col-m-2">
                <!-- IMAGEN DE LOGIN <img src = ""/> -->
            </div>
            <div class = "col-l-4 col-m-2"></div>
        </header>
        <main class = "row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
                <h1>Correo enviado</h1>
                <p>
                    Se ha enviado una nueva contraseña al correo que ha introducido.
                    Por favor, introduzcala al iniciar sesión otra vez.
                </p>
                <a href="../index.jsp"><button type="submit" name="volver" value="Volver" class="boton">Volver</button></a>
            </div>
            <div class="col-m-4"></div>
        </main>
        <footer class="row">
            <p class="col-m-12 col-l-12">© Belén Trujillo Navarro</p>
        </footer>
    </body>
</html>
