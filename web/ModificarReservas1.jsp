<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 	 	<!doctype html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
<script src="scripts/registro.js" type="text/javascript"></script>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />

<title>..::Booking Routers::..</title>
</head>
<body>
    <div class ="contenedor">
<div class="banner"> 
<p><a href="Index1.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
        <nav>  
        <ul id="main">
<li>
 <div align="center"> <a href="Index1.html" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Home </a>
</li>
         </ul>
            </nav> 
        <center>
    <%reserDTO  per= new reserDTO();
      reserDAO pers = new reserDAO(); 
      ArrayList<reserDTO> misReservas= new ArrayList();      
      misReservas =(ArrayList<reserDTO>) pers.listarReservas();

      
      
      
      %>    
<div class="ba">
      <h1> My Reservations</h1>
</div>
<table border="6" class="paginated" id="divTabla">
    <tr>
        <th style="background: #0C4391;">id Reserve</th>
     
        <th style="background: #0C4391;">id Service</th>
        <th style="background: #0C4391;">id TransportArrival</th>
        <th style="background: #0C4391;">Responsible</th>
        <th style="background: #0C4391;">Date Reserve</th>
        <th style="background: #0C4391;">Time Reserve</th>
        <th style="background: #0C4391;">Direction Destination</th>
        <th style="background: #0C4391;">Remove</th>
    </tr>
    <%
      for(reserDTO so: misReservas){
          
      
    %>
    <tr>
        <td><%=so.getIdReserva()%></td>
        
        <td><%=so.getIdServicio()%></td>
        <td><%=so.getIdTransporteLlegada()%></td>
        <td><%=so.getResponsable()%></td>
        <td><%=so.getFechaReserva()%></td>
        <td><%=so.getHoraReserva()%></td>
        <td><%=so.getDireccionDestino()%></td>
        
        <td><a href="modificarReserva1.jsp"><img src="imagenes/Modificar.png" align="middle" width="32" height="32" title="Verificar"></td></a>
    
    </tr>
    <%
    }
    %>
</table>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left">
    <img src="imagenes/dddd.png"><a href="ModificarReservas1.jsp">English</a> ||  <img src="imagenes/original.jpg"><a href="ModificarReservas.jsp">Spanish</a>
</div>

</table>
</main>

</body>
</html>
