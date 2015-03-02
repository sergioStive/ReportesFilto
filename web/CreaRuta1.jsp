<%-- 
    Document   : CreaRuta
    Created on : Jan 21, 2015, 9:23:56 AM
    Author     : Andres Felipe Guerrero Rodriguez
--%>
<%@page import="co.sena.edu.booking.DAO.estadorutasDAO"%>
<%@page import="co.sena.edu.booking.DAO.conductoresDAO"%>
<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="co.sena.edu.booking.DAO.tipovehiculosDAO"%>
<%@page import="co.sena.edu.booking.DTO.tipovehiculosDTO"%>

<!doctype html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
	<script  src="jquery/jquery.js"></script>
	<script src="jquery/jquery.validate.js"></script>
	<script src="jquery/additional-methods.js"></script>
<meta charset="utf-8">
<title>..::Booking Routers::..</title>
<link rel="shortcut icon" href="img/br.ico" />
</head>
<body>
<div class ="contenedor">
<div class="banner"> 
<p><a href="Index.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="100%" height="150" title="Forget the rest, call the best"  /></a></p>
</div>
<nav>
<ul id="main">
    <li><a href="Index.html">Home</li></a>
       <li><a align="center" href="#">Bookings</a>
                            <ul class="submain">
                                <li><a href="reserva.jsp">New Application </a></li>
                                <li><a href="mreserva.html">My Bookings</a> </li>
                                </ul>
                        </li>
        <li><a align="center" href="#">Route Management</a>
                            <ul class="submain">
                                <li><a href="CreaRuta.jsp?msj=">Creating Routes</a></li>
                                <li><a href="ModRuta.jsp?msj=">Modification of Routes</a> </li>
                                </ul>
                        </li>
                         <li><a align="center" href="#">My Account</a>
                            <ul class="submain">
                                <li><a href="actualizarDatos1.jsp">My Dates</a></li>
                                <li><a href="cambiarContraseña.jsp">Change Password</a> </li>
                                </ul>
                        </li>
      
        </ul>

</nav>
<br>

<%
    HttpSession misesion = request.getSession(false);

    if (misesion.getAttribute("logueado") != null) {
        personasDTO pdto = null;
        personasDTO persona = null;
        personasDAO pdao = new personasDAO();
        tipovehiculosDAO TVDao = new tipovehiculosDAO();
        reserDAO  RDao= new reserDAO();
        conductoresDAO conDAO = new conductoresDAO();
        estadorutasDAO estadoDAO =new estadorutasDAO();
        pdto = (personasDTO) misesion.getAttribute("logueado");
        persona = pdao.ListarUnaPersona(pdto.getIdPersona());                                       
%>
<div>
<form name="CreaRuta"  action="CreaRuta" method="post" >
    <div  style="background: #0C4391; height: 70px; margin-top: 10px; padding-top: 5px; border-radius: 15px; color: #e2c60f">
            <h2>
                <center>Creating Routes</center>
            </h2>
        </div>
    <center> 
    <table id="Crea">
        <tr>
            <td>
                <br>
                <strong>Vehicle Plate</strong><font color="#FF0000">*</font>
                <br>
            </td>
            <td><input id="Placa" name="Placa" type="text" style="width:250px; height:30px " autofocus  placeholder="Enter plate" required class="form-control inputtext"  /> </td>
        </tr>
        <tr>
            <td>
                 <br>
               <strong>Vehicle Type </strong><font color="#FF0000">*</font> 
                <br>
            </td>
            <td> 
                <select id="Tipo" name="Tipo" type="text" style="width:250px; height:30px " autofocus  required class="form-control inputtext"  >
                    <%= 
                        TVDao.getHTMLAll("0")
                    %>
                </select>
            </td>
        </tr>
        <br>
        <tr>
            <td>
                 <br>
              <strong>Customer </strong><font color="#FF0000">*</font>  
               <br>
            </td>
            <td>
                <select id="Cliente" name ="Cliente" type="text" style="width:250px; height:30px " autofocus   required class="form-control inputtext" >
                    <%= 
                       pdao.getHTMLAll("0")
                    %>
                </select>
            </td>
        </tr>
        <tr>
        <br>
            <td>
                 <br>
                <strong>Driver </strong><font color="#FF0000">*</font>
                 <br>
            </td>
                <td> 
                <select id="Conductor" name="Conductor" type="text" style="width:250px; height:30px " autofocus   required class="form-control inputtext"  >
                    <%= 
                     conDAO.getHTMLAll("0")
                    %>
                </select>
            </td>
    </tr>
        <tr>
            <td> 
                 <br>
               <strong>Booking</strong><font color="#FF0000">*</font> 
                <br>
            </td>
                <td> 
                <select id="Reserva" name="Reserva" type="text" style="width:250px; height:30px " autofocus  required class="form-control inputtext" >
                    <%= 
                        RDao.getHTMLAll("0")
                    %>
                </select>
            </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-success" name="btnCrea" type="submit" value="Create Route" /> 
        </td>
    </tr>
     <tr>
        <td colspan="2">
            <% if(request.getParameter("msj") != null) {%>
            <% if(!request.getParameter("msj").equals("")) { %> 
            <div class="alert alert-success" role="alert">
            <%= request.getParameter("msj") %>
            </div>
             <% }%>   
              <% }%> 
        </td>
    </tr>
    </table>
    </center>            
</form>
</div>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left">
    <img src="imagenes/dddd.png"><a href="CreaRuta1.jsp">English</a> ||  <img src="imagenes/original.jpg"><a href="CreaRuta.jsp">Spanish</a>
</div>
 <%
   }
 %>
</body>
</html>
