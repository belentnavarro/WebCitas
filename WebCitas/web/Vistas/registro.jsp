<%-- 
    Document   : registro
    Created on : 18-oct-2020, 19:22:34
    Author     : belen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
        <link rel="stylesheet" type="text/css" href="Estilos/estilosGenerales.css">
        <!--<link rel="icon" type="image/png" href="Images/favicon-webcitas.png">-->
        <script src="../JS/validacionRegistro.js"></script>
        <script src="../JS/captchaRegistro.js"></script>
    </head>
    <body onload="validarRegistro(); captchaRegistro();">
        <header class = "row">
            <div class = "col-m-4"></div>
            <div class = "col-m-4">
                <!-- IMAGEN DE LOGIN <img src = ""/> -->
            </div>
            <div class = "col-m-4"></div>
        </header>
        <div class="col-m-4"></div>
        <form novalidate name="registro" action="../Controladores/controladorRegistro.jsp" method="POST" class="col-m-4">
            <p>
                <label for="dni">DNI:</label>
                <input name="dni" type="text" id="dni" length="9" pattern="[0-9]{8]\-[A-Z]{1}" required/>
                <span class="error" aria-live="polite"></span>
            </p>
            <p>
                <label for="nombre">Nombre:</label>
                <input name="nombre" type="text" id="nombre" required/>
                <span class="error" aria-live="polite"></span>
            </p>
            <p>
                <label for="email">Email:</label>
                <input name="email" type="email" id="email" placeholder="ejemplo@ejemplo.com" required/>
                <span class="error" aria-live="polite"></span>
            </p>
            <p>
                <label for="password">Contraseña:</label>
                <input name="password" type="password" id="password" pattern="" minlength="8" maxlength="15" pattern="" placeholder="Introduce tu contraseña" required/>
                <span class="error" aria-live="polite"></span>
            </p>
            <p>
                <label for="password2">Confirmar contraseña:</label>
                <input name="password2" type="password2" id="password2" pattern="" minlength="8" maxlength="15" pattern="" placeholder="Introduce otra vez tu contraseña" required/>
                <span class="error" aria-live="polite"></span>
            </p>
            <p>
                <label for="edad">Edad:</label>
                <input name="edad" type="number" id="edad" min="18" max="99"/>
                <span class="error" aria-live="polite"></span>
            </p>
            <p>
                <label for="sexo">Sexo:</label> 
                <select name="sexo" required>
                    <option value="mujer">Mujer</option>
                    <option value="hombre">Hombre</option>
                </select>
            </p>
            <p>
                <label for="ocupacion">Ocupacion:</label> 
                <input name="ocupacion" id="ocupacion" type="text" placeholder="Introduce tu ocupación"/>
                <span class="error" aria-live="polite"></span>
            </p>
            <div id="captchaRegistro">
                <canvas id="captcha"></canvas>
                <input type="button" id="refresh" value="Refrescar" onclick="captcha();"/>
                <input type="text" id="txtInputCaptcha"/>
                <input id="button" type="button" value="Confirmar" onclick="alert(validCaptcha('txtInput'));"/>
            </div>
            <p>
                <input type="submit" name="aceptar" value="Aceptar"/>
                <input type="refresh" name="refrescar" value="Refrescar"/>
            </p>
        </form>
        <div class="col-m-4"></div>
        <footer>
            <p>© Belén Trujillo Navarro</p>
        </footer>
    </body>
</html>
