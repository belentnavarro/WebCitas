<%-- 
    Document   : controladorRegistro
    Created on : 19-oct-2020, 7:46:54
    Author     : belen
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(request.getParameter("aceptar") != null){
                String dni = request.getParameter("dni");
                String email = request.getParameter("email");
                String nombre = request.getParameter("nombre");
                String passwd = request.getParameter("password");
                String passwd2 = request.getParameter("password2");
                int edad = Integer.parseInt(request.getParameter("edad"));
                String sexo = request.getParameter("sexo");
                String ocupacion = request.getParameter("ocupacion");
                
                if(passwd.equals(passwd2)){
                    // La persona no estará activada hasta que el administrador la active.
                    Persona p = new Persona(dni, email, passwd, nombre, edad, sexo, ocupacion, false, false);
                    boolean conseguido = ConexionEstatica.insertUser(p);
                    
                    if(conseguido){
                        // Una vez que el usuario se registra, regresará a la pantalla de inicio para entrar.
                        response.sendRedirect("../login.jsp");
                    }
                } else {
                    // En caso de que no haya escrito bien la contraseña, le regidirá otra vez a la ventana de 
                    // registro avisando de que ha sufrido un problema
                    response.sendRedirect("Vistas/registro.jsp");
                }
                
            }
        %>
    </body>
</html>
