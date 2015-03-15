<%-- 
    Document   : Filtro
    Created on : 6/03/2015, 09:52:44 AM
    Author     : Usuraio
--%>

<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.listarPerDTO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/css.css">
        <link rel="shortcut icon" href="imagenes/br.ico" />
        <script src="scripts/registro.js" type="text/javascript"></script>
        <script src="scripts/ingreso.js" type="text/javascript"></script>
        <script src="scripts/bookasp.js" type="text/javascript"></script>

        <title>Filtro Multicriterio</title>

    </head>
    <body>

        <div class ="contenedor">
            <div class="banner"> 
                <p><a href="Index.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
            </div>
            <br>
            <center>
                <div class="col-md-6"><h2>Búsqueda de Usuarios</h2></div>

                <form action="buscarPersona" method="post">

                    <label>Pais</label>
                    <input type="text" name="nombre">
                    <label>Nombre</label>
                    <input type="text" name="pais"><br>
                    <label>Ciudad</label>
                    <input type="tex" name="ciudad">
                    <br>
                    <input type="submit" name="buscar" value="Buscar" class="btn btn-success">
                    <input type="submit" name="generar" value="Generar Reporte" class="btn btn-success">
                </form>
            </center>

               <%
      personasDTO  per= new personasDTO();
     personasDAO pers = new personasDAO(); 
     ArrayList<personasDTO> misPersonas= new ArrayList();
     int numreg = pers.contarRegistros();
     int numeroPg = numreg/5;  
     int pg =0; 
     if(request.getParameter("pg")==null){
     pg=1;
     }else{
     pg=Integer.valueOf(request.getParameter("pg"));
     }
     misPersonas =(ArrayList<personasDTO>) pers.Paginacion(pg,5);
     
     
            %>
            
            

            <%
                if (request.getAttribute("personas") != null) {
                    ArrayList<listarPerDTO> person = (ArrayList<listarPerDTO>) request.getAttribute("personas");
                    
                    if (person.size() == 0) {
            %>

            
            
            
            
            
            <br>
            <br>
            <div class="row text-right">
                <div class="col-md-6 alert alert-info"><h2 class="text-center">Lo sentimos, no hay resultados</h2></div>

            </div>    
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
                }
            %>

            <div class="pagination" id="">
     <%
     int adelanteA;
     if (request.getParameter("pg")==null) {
             adelanteA =1;
         }else{
     adelanteA =Integer.parseInt(request.getParameter("pg"));
     }
         
     %> 
    <a href="?pg=<%=adelanteA-1%>">&laquo</a>
    
    <%      
       for(int j=0;j<numeroPg+1;j++){
       %>  
       <a href="?pg=<%=j+1%>"><%=j+1 %></a>
 <%
     }
 %> 
<a href="?pg=<%=adelanteA+1%>">&raquo</a>
</div>
</center>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left">
    <img src="imagenes/dddd.png"><a href="verificarRegistro1.jsp">English</a> ||  <img src="imagenes/original.jpg"><a href="verificarRegistro.jsp">Spanish</a>
</div>
     

            
    </body>
</html>
