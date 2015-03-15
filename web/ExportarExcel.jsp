<%-- 
    Document   : Filtro
    Created on : 6/03/2015, 09:52:44 AM
    Author     : Usuraio
--%>

<%@page import="co.sena.edu.booking.DTO.listarPerDTO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
</head>
    <body>
        
 <%
            if (request.getAttribute("personas") != null) {
                ArrayList<listarPerDTO > person = (ArrayList<listarPerDTO>) request.getAttribute("personas");
                if (person.size() == 0) {
        %>

         
        <%
        } else {
        %>    
        <center>
        <div class="row text-right">
            <div class="col-md-6"><h2 class="text-center">Resultados de la búsqueda</h2></div>                         
        </div>
                </center>
            <br>
        <table class="table table-bordered table-striped table-hover"> 
            <thead>
            <td>Nombres</td>
            <td>apellidos</td>
            <td>Correo Electronico</td>
            <td>Ciudad</td>
            <td>Nacionalidad</td>
            <td>Idioma</td>
        </thead>
        <%
            for (listarPerDTO  nombre : person) {
        %>

        <tr>

            <td><%=nombre.getNombres()%></td>
            <td><%=nombre.getApellidos()%></td>
            <td><%=nombre.getCorreoElectronico()%></td>
            <td><%=nombre.getCiudad()%></td>
            <td><%=nombre.getNacionalidad()%></td>
            <td><%=nombre.getIdioma()%></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
            }
        String nombreArchivo = "Reporte Personas"+".xls";
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + nombreArchivo + "\"");
            
            }
    %>

</body>
</html>
