<%-- 
    Document   : preferencias
    Created on : 18-oct-2020, 19:59:07
    Author     : belen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preferencias del usuario</title>
        <link rel="stylesheet" type="text/css" href="Estilos/estilosGenerales.css">
        <!--<link rel="icon" type="image/png" href="Images/favicon-webcitas.png">-->
    </head>
    <body>
        <header class = "row">
            <div class = "col-m-4"></div>
            <div class = "col-m-4">
                <!-- IMAGEN DE LOGIN <img src = ""/> -->
            </div>
            <div class = "col-m-4"></div>
        </header>
        <div class="col-m-4"></div>
        <form name="preferencias" action="../Controladores/controladorRegistro.jsp" method="POST" class="col-m-4">
            <h1>Encuesta de preferencias y gustos del usuario</h1>
            <fieldset>
                <legend>Tipo de relación:</legend>
                <select name="relacion" required>
                    <option value="relacionSeria" selected>Relación seria</option>
                    <option value="relacionEsporadica">Relación esporádicae</option>
                </select>
            <fieldset>
            <p>
                <label for="deporte">Deporte:</label>
                <input name="deporte" type="number" min="0" max="100" required/>
            </p>
            <p>
                <label for="arte">Arte:</label>
                <input name="arte" type="number" min="0" max="100" required/>
            </p>
            <p>
                <label for="politica">Política:</label>
                <input name="politica" type="number" min="0" max="100" required/>
            </p>
            <fieldset>
                <legend>Interés en hijos:</legend>
                <input type="checkbox" value="tieneHijos"/>Tiene hijos</br>
                <input type="checkbox" value="quiereHijos"/>Quiere hijos
            <fieldset>
            <fieldset>
                <legend>Buscas conocer:</legend>
                <input type="checkbox" value="interesMujeres"/>Mujeres</br>
                <input type="checkbox" value="interesHombres"/>Hombres
            <fieldset>
            <p>
                <input type="submit" name="rellenarPreferencias" value="Aceptar" class="boton"/>
                <input type="submit" name="cerrarSesion" value="Cerrar sesíon" class="boton"/>
            </p>
        </form>
        <div class="col-m-4"></div>
        <footer>
            <p>© Belén Trujillo Navarro</p>
        </footer>
    </body>
</html>
