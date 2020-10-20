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
                Persona usuario = ConexionEstatica.login1(email, passwd);
                
                if(usuario != null){
                    // Si el usuario está activo, se guarda al usaurio en una variable de sesion
                    if(usuario.isActivo()){
                        session.setAttribute("usuario", usuario);

                        // Si el usuario es administrador se cargan la lista de usuarios de la BD y se guarda en una variable de sesión
                        if(usuario.getRol().equals("administrador")){
                            LinkedList <Persona> listaUsuarios = ConexionEstatica.getUsers();
                            session.setAttribute("listaUsuarios", listaUsuarios);

                            if(usuario.isPreferenciasOk()){
                                // Si el usuario tiene las preferencias, se manda a la ventana para elegir si quiere entrar como administrador o como usuario
                                response.sendRedirect("../Vistas/opcionAdmin.jsp");
                            } else {
                                // Si el usuario no tiene las preferencias, se le manda a la ventana para registrar sus gustos personales
                                response.sendRedirect("../Vistas/preferencias.jsp");
                            }
                        
                            //Si el usuario no es administrador
                        } else {
                            if(usuario.isPreferenciasOk()){
                                // Si el usuario tiene las preferencias, se manda a la portada principal de la aplicación
                                response.sendRedirect("../Vistas/portada.jsp");
                            } else {
                                // Si el usuario no tiene las preferencias, se le manda a la ventana para registrar sus gustos personales
                                response.sendRedirect("../Vistas/preferencias.jsp");
                            }
                        }
                    } else {
                        // Si el usuario no ha iniciado todavía sesión, se guarda un mensaje de error en una variable de sesión y se vuelve al login
                        session.setAttribute("error-mensaje", "La cuenta todavía no ha sido activada.");
                        response.sendRedirect("../index.jsp");
                    }
                } else {
                    // Si el usuario no existe, se manda un mensaje y se vuelve al login.
                    session.setAttribute("error-mensaje", "Error al iniciar la sesión, datos incorrectos.");
                    response.sendRedirect("../index.jsp");
                }
            }
            
            /*******************************************************************
             * ************ BOTON ENVIAR EMAIL - passwdOlvidada.jsp ************
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón enviar email, se crea una nueva contraseña
             * que es un número aleatorio y se le envía un correo electrónico con la nueva contraseña.
             * 
             * Al mismo tiempo, se actualiza dicha contraseña en la BD.
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
                conseguido = ConexionEstatica.changePassword(para, az);
                ConexionEstatica.cerrarBD();
                
                if(conseguido){
                    response.sendRedirect("../Vistas/emailEnviado.jsp");
                } else {
                    session.setAttribute("error-mensaje", "No se ha podido enviar la nueva contraseña a la dirección.");
                    response.sendRedirect("../index.jsp");
                }
            }
            
            /*******************************************************************
             * *************** BOTON ENTRAR ADMIN - opcionAdmin.jsp ************
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón entrar como administrador en la ventana
             * de opción del administrador, le mandamos a la vista del CRUD de usuarios.
             */
            
             if(request.getParameter("entrarAdmin") != null){
                response.sendRedirect("../Vistas/CRUDUsuarios.jsp");
             }
             
             /******************************************************************
             * ************** BOTON ENTRAR USUARIO - opcionAdmin.jsp ***********
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón entrar como usuario en la ventana
             * de opción del administrador, le mandamos a la vista de portada como un usuario común.
             */
            
             if(request.getParameter("entrarUsuario") != null){
                response.sendRedirect("../Vistas/portada.jsp");
             }
             
             /******************************************************************
             * *************** BOTON CERRAR SESIÓN - opcionAdmin.jsp ***********
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón cerrar sesión, se invalidan los datos
             * de la sesión y volvemos a la ventana de login.
             */
            
             if(request.getParameter("cerrarSesion") != null){
                session.invalidate();
                response.sendRedirect("../index.jsp");
             }
        %>
    </body>
</html>
