<%-- 
    Document   : CRUDUsuarios
    Created on : 19-oct-2020, 18:18:22
    Author     : belen
--%>

<%@page import="Modelo.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de administración</title>
        <link rel="stylesheet" type="text/css" href="Estilos/estilosGenerales.css">
        <link rel="icon" type="image/png" href="Images/favicon-webcitas.png">
    </head>
    <body>
        <header class="row">
            <div class="col-m-4"></div>
            <div class="col-m-4">
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
            </div>
            <div class="col-m-4"></div>
        </header>
        <main class="row">
            <div class="col-m-1"></div>
            <form name="crudUsuarios" action="../Controladores/controladorCRUD.jsp" method="POST" class="col-m-10 panelAdmin">
                <h1>Panel de adminsitración</h1>
                <%
                    LinkedList <Persona> listaUsuarios = (LinkedList) session.getAttribute("listaUsuarios");
                    String dni = "";
                    String nombreU = "";
                    String email = "";
                    String sexoU = "";
                    int edad = 0;
                    String adminTXT = "";
                    boolean preferencias = false;
                    String preferenciasTXT = "";
                    boolean activo = false;
                    String activoTXT = "";
                    
                    for (int i = 0; i < listaUsuarios.size(); i++) {
                        Persona p = (Persona) listaUsuarios.get(i);
                        dni = p.getDni();
                        nombreU = p.getNombre();
                        email = p.getEmail();
                        sexoU = p.getSexo();
                        edad = p.getEdad();
                        preferencias = p.isPreferenciasOk();
                        activo = p.isActivo();
                        
                        if(!activo){
                            activoTXT = "Cuenta desactivada";
                        } else {
                            activoTXT = "Cuenta activada";
                        }
                        
                        if(!preferencias){
                            preferenciasTXT = "Tiene preferencias";
                        } else {
                            preferenciasTXT = "No tiene preferencias";
                        }
                        
                        ConexionEstatica.nueva();
                        if(ConexionEstatica.isAdmin(p)){
                            adminTXT = "Es administrador";
                        } else {
                            adminTXT = "No es administrador";
                        }
                        ConexionEstatica.cerrarBD();
                        
                %>
                <p>
                    <input type="text" name="dni" value="<%=dni%>" readonly/>
                    <input type="text" name="nombre" value="<%=nombreU%>" readonly/>
                    <input type="text" name="email" value="<%=email%>" readonly/>
                    <input type="text" name="sexo" value="<%=sexoU%>" readonly/>
                    <input type="text" name="edad" value="<%=edad%>" readonly/>Me
                    <input type="text" name="activo" value="<%=activoTXT%>" readonly/>
                    <input type="text" name="preferencias" value="<%=preferenciasTXT%>" readonly/>
                    <input type="text" name="admin" value="<%=adminTXT%>" readonly/>
                </p>
                <input type="submit" name="<%=i%>" value="Activar cuenta" class="boton"/>
                <input type="submit" name="<%=i%>" value="Desactivar cuenta" class="boton"/>
                <input type="submit" name="<%=i%>" value="Otorgar privilegios administrador" class="boton"/>
                <input type="submit" name="<%=i%>" value="Quitar privilegios administrador" class="boton"/>
                <input type="submit" name="<%=i%>" value="Eliminar usuario" class="boton"/>
                <%
                    }
                    
                    
                %>
            </form>
            <div class="col-m-1"></div>
        </main>
        <footer class="row">
            <p class="col-m-12 col-l-12">© Belén Trujillo Navarro</p>
        </footer>
    </body>
</html>
