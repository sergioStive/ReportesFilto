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
<p><a href="Index.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
    <nav>
<ul id="main">
    <li><a href="Index.html" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</li></a>
        <li><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a>
                            <ul class="submain">
                                <li><a href="reserva.jsp" style="text-decoration: none;">Solicita Reserva</a></li>
                                <li><a href="CancelarR.jsp" style="text-decoration: none;">Cancelar Reservas</a> </li>
                                <li><a href="ModificarReservas.jsp" style="text-decoration: none;">Modificar Reserva</a> </li>
                                </ul>
                        </li>
                          <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span> Mi Cuenta</a>
                            <ul class="submain">
                                <li><a href="actualizarDatos1.jsp" style="text-decoration: none;">Mis Datos</a></li>
                                <li><a href="cambiarContraseņa.jsp" style="text-decoration: none;">Cambiar Contraseņa</a> </li>
                                </ul>
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
      <h1>Reservas</h1>
      </div>
     <table border="6" class="paginated" id="divTabla">
    <tr>
        <th style="background: #0C4391;">idReserva</th>
       
        <th style="background: #0C4391;">idServicio</th>
        <th style="background: #0C4391;">idTrasnporteLlegada</th>
        <th style="background: #0C4391;">responsable</th>
        <th style="background: #0C4391;">fechaReserva</th>
        <th style="background: #0C4391;">horaReserva</th>
        <th style="background: #0C4391;">direccionDestino</th>
        <th style="background: #0C4391;">Eliminar</th>
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
        
        <td><a href="Controlador?idReserva=<%=so.getIdReserva()%>"><img src="imagenes/Eliminar.png" align="middle" width="32" height="32" title="Eliminar"></a></td>
    
    </tr>
    <%
    }
    %>
</table>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left">
    <img src="imagenes/dddd.png"><a href="CancelarR1.jsp">English</a> ||  <img src="imagenes/original.jpg"><a href="CancelarR.jsp">Spanish</a>

</div>

</table>
</main>

</body>
</html>
