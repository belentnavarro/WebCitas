<%-- 
    Document   : controladorLogin
    Created on : 18-oct-2020, 19:22:47
    Author     : belen
--%>

<%@page import="Modelo.Email"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Persona"%>
<%@page import="Modelo.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            /*******************************************************************
             * ******************* BOTON LOGIN - index.jsp *********************
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón aceptar, se busca al usuario dentro de 
             * la lista de usuarios y se devuelve, guardando su información en una variable de sesión. 
             */
            if (request.getParameter("aceptar") != null){
                String email = request.getParameter("email");
                String passwd = request.getParameter("passwd");
                
                ConexionEstatica.nueva();
                Persona usuario = ConexionEstatica.login(email, passwd);
                
                if(usuario != null){
                    // Si el usuario está activo, se guarda al usaurio en una variable de sesion
                    if(usuario.isActivo()){
                        session.setAttribute("usuario", usuario);

                        // Si el usuario es administrador se cargan la lista de usuarios de la BD y se guarda en una variable de sesión
                        if(usuario.getRol() == "administrador"){
                            LinkedList <Persona> listaUsuarios = ConexionEstatica.getUsers();
                            session.setAttribute("listaUsuarios", listaUsuarios);

                            if(usuario.isPreferenciasOk()){
                                // Si el usuario tiene las preferencias, se manda a la ventana para elegir si quiere entrar como administrador o como usuario
                                response.sendRedirect("Vistas/opcionAdmin.jsp");
                            } else {
                                // Si el usuario no tiene las preferencias, se le manda a la ventana para registrar sus gustos personales
                                response.sendRedirect("Vistas/preferencias.jsp");
                            }
                        
                            //Si el usuario no es administrador
                        } else {
                            if(usuario.isPreferenciasOk()){
                                // Si el usuario tiene las preferencias, se manda a la portada principal de la aplicación
                                response.sendRedirect("Vistas/portada.jsp");
                            } else {
                                // Si el usuario no tiene las preferencias, se le manda a la ventana para registrar sus gustos personales
                                response.sendRedirect("Vistas/preferencias.jsp");
                            }
                        }
                    } else {
                        // Si el usuario no ha iniciado todavía sesión, se guarda un mensaje de error en una variable de sesión y se vuelve al login
                        session.setAttribute("error-mensaje", "La cuenta todavía no ha sido activada.");
                        response.sendRedirect("../index.jsp");
                    }
                }
            }
            
            /*******************************************************************
             * ************ BOTON ENVIAR EMAIL - passwdOlvidada.jsp ************
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón aceptar, se busca al usuario dentro de 
             * la lista de usuarios y se devuelve, guardando su información en una variable de sesión. 
             */
            
            if(request.getParameter("enviarEmail") != null){
                boolean conseguido = false;
                int az = (int) (Math.random() * 99999);
                
                Email email = new Email();
                
                String de = "auxiliardaw2@gmail.com";
                String clave = "Chubaca20";
                String para = request.getParameter("emailPasswd");
                String mensaje = "Nueva contraseña para entrar en su cuenta: " + az;
                String asunto = "Recuperar contraseña";
                email.sendEmail(de, clave, para, mensaje, asunto);
                
                ConexionEstatica.nueva();
                conseguido = ConexionEstatica.changePasswd(para, az);
                ConexionEstatica.cerrarBD();
                
                if(conseguido){
                    response.sendRedirect("Vistas/emailEnviado.jsp");
                } else {
                    session.setAttribute("error-mensaje", "No se ha podido enviar la nueva contraseña a la dirección.");
                    response.sendRedirect("../index.jsp");
                }
            }
        %>
    </body>
</html>
