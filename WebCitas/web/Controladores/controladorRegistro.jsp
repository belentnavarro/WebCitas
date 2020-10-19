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
            /*******************************************************************
             * ***************** BOTON ACEPTAR - registro.jsp ******************
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón aceptar, se recogen todos los datos
             * del formulario de registro y se inserta el nuevo usuario en la base de datos.
             */
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
                        response.sendRedirect("../Vistas/usuarioRegistrado.jsp");
                    }
                }                
            }
            
            /*******************************************************************
             * *************** BOTON CERRAR SESIÓN - preferencias.jsp **********
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón cerrar sesión, se invalidan los datos
             * de la sesión y volvemos a la ventana de login.
             */
            
             if(request.getParameter("cerrarSesion") != null){
                session.invalidate();
                response.sendRedirect("../index.jsp");
             }
             
            /*******************************************************************
             * ********** BOTON RELLENAR PREFERENCIAS - preferencias.jsp *******
             * *****************************************************************
             * 
             * Cuando el usuario presiona el botón cerrar sesión, se rellenan sus
             * preferencias tanto en el usuario como en la base de datos.
             */
            
             if(request.getParameter("rellenarPreferencias") != null){
                boolean conseguido = false;
                Persona usuario = (Persona) session.getAttribute("usuario");
                String relacion = request.getParameter("relacion");
                int deporte = Integer.parseInt(request.getParameter("deporte"));
                int arte = Integer.parseInt(request.getParameter("arte"));
                int politica = Integer.parseInt(request.getParameter("politica"));
                String tieneHijos = request.getParameter("tieneHijos");
                String quiereHijos = request.getParameter("quiereHijos");
                String interesMujeres = request.getParameter("interesMujeres");
                String interesHombres = request.getParameter("interesHombres");
                
                if(relacion.equals("relacionSeria")){
                    usuario.setRelacionSeria(true);
                }
                usuario.setDeportes(deporte);
                usuario.setArtes(arte);
                usuario.setPolitica(politica);
                if (tieneHijos != null) {
                    usuario.setTieneHijos(true);
                }
                if (quiereHijos != null) {
                    usuario.setQuiereHijos(true);
                }
                if (interesMujeres != null) {
                    usuario.setInteresMujeres(true);
                }
                if (interesHombres != null) {
                    usuario.setInteresHombres(true);
                }
                
                ConexionEstatica.nueva();
                conseguido = ConexionEstatica.setLikes(usuario);
                conseguido = ConexionEstatica.doneLikes(usuario);
                ConexionEstatica.cerrarBD();
                
                if(conseguido){
                    response.sendRedirect("../Vistas/portada.jsp");
                }
             }
        %>
    </body>
</html>
