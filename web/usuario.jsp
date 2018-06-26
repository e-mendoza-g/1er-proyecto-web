
<%@page import="cl.entities.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.model.ServicioLocal"%>

 <%! ServicioLocal servicio;%>
<%
    InitialContext ctx = new InitialContext();
    servicio = (ServicioLocal) ctx.lookup("java:global/GestionVentaEMG/Servicio!cl.model.ServicioLocal");
    List<Usuario> lista = servicio.getUsuarios();
%>
<c:set scope="page" var="lista" value="<%=lista%>"/>
<!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
         <c:if test="${not empty admin}">
            <c:import url="menu.jsp"/>
            
        <div class="container center-align">
            <div class="row">
                <div class="col s6">
                    <h3> USUARIOS </h3>
                    <form action="control.do" method="POST">
                        <div class="input-field">
                            <input id="rut" type="text" name="rut">
                            <label for="rut">Rut</label>
                        </div>
                        <div class="input-field">
                            <input id="nombre" type="text" name="nombre">
                            <label for="nombre">Nombre</label>
                        </div>
                        <div class="input-field">
                            <input id="apellido" type="text" name="apellido">
                            <label for="apellido">Apellido</label>
                        </div>
                        <div class="input-field">
                            <input id="email" type="text" name="email">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field">
                            <input id="clave" type="password" name="clave">
                            <label for="clave">Clave</label>
                        </div>
                        <select class="browser-default" name="tipo" >
                                <option>Vendedor</option>
                                <option>Cliente</option>
                                <option value="admin">Administrador</option>
                        </select>
                        <br><br>
                        
                        <button class="btn black" name="bt" value="adduser" type="submit">Guardar</button>    

                    </form>
                    <br>
                    ${msg}
                    <br>                    
                    <button onclick="if(document.getElementById('spoiler') .style.display=='none') 
                        {document.getElementById('spoiler') .style.display=''}else{document.getElementById('spoiler') .style.display='none'}" 
                        title="Click to Mostrar" type="button" class="waves-light btn red"><i class="material-icons left">account_circle</i>Ver Usuarios </button>
                        <br><br>
                        <div id="spoiler" style="display: none;">
                            <table class="bordered">
                                <tr>
                                    <td>RUT</td>
                                    <td>NOMBRE</td>
                                    <td>APELLIDO</td>
                                    <td>EMAIL</td>
                                    <td>CLAVE</td>
                                    <td>TIPO</td>

                                </tr>

                                <c:forEach items="${lista}" var="u">
                                    <tr>
                                        <td>${u.rut}</td>
                                        <td>${u.nombre}</td>
                                        <td>${u.apellido}</td>
                                        <td>${u.email}</td>
                                        <td>${u.clave}</td>  
                                        <td>${u.tipo}</td>  

                                    </tr>
                                </c:forEach>

                            </table>
                            <br>
                        </div>
                        


                </div>
            </div>
        </div>    
        
    </c:if> 
        
        <c:if test="${empty admin}">
            <div class="progress">
                <div class="indeterminate"></div>
            </div>
            Error en la pagina, será redireccionado en 5s
         <meta http-equiv="refresh" content="5;url=index.jsp">            
        </c:if>   
        
        

      <!--JavaScript at end of body for optimized loading-->
      <script type="text/javascript" src="js/materialize.min.js">
          document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('select').formSelect();
  });
      </script>
      <script type="text/javascript" >
           $(document).ready(function(){
            $('select').material_select();
        });

      </script>
      
    </body>
  </html>
