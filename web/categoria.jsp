
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="cl.entities.Categoria"%>
<%@page import="cl.entities.Categoria"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.model.ServicioLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%! ServicioLocal servicio;%>
<%
    InitialContext ctx = new InitialContext();
    servicio = (ServicioLocal) ctx.lookup("java:global/GestionVentaEMG/Servicio!cl.model.ServicioLocal");
    List<Categoria> lista = servicio.getCategorias();
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
                    <h3>CATEGORIAS</h3>
                    <form action="control.do" method="POST">
                        <div class="input-field">
                            <input id="nombre" type="text" name="nombre">
                            <label for="nombre">Nombre</label>
                        </div>
                        <div class="input-field">
                            <input id="desc" type="text" name="desc">
                            <label for="desc">Descripción</label>
                        </div>
                        <button class="btn black" name="bt" value="addcat" type="submit">Guardar</button>    

                    </form>
                    <br>
                    <button onclick="if(document.getElementById('spoiler') .style.display=='none') 
                        {document.getElementById('spoiler') .style.display=''}else{document.getElementById('spoiler') .style.display='none'}" 
                            title="Click para Mostrar" type="button" class="waves-light btn red"><i class="material-icons left">storage</i>Ver Categorias</button>
                    <br><br>
                    <div id="spoiler" style="display: none;">
                        <table class="bordered">
                            <tr>
                                <td>CODIGO</td>
                                <td>NOMBRE</td>
                                <td>ESTADO</td>
                                <td></td>
                            </tr>

                            <c:forEach items="${lista}" var="c">
                                <tr>
                                    <td>${c.codigocategoria}</td>
                                    <td>${c.nombre}</td>
                                    <td>
                                        <c:if test="${c.estado eq 1}">
                                            ACTIVADO
                                        </c:if>
                                        <c:if test="${c.estado eq 0}">
                                            DESACTIVADO
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${c.estado eq 1}">
                                            <a href="control.do?bt=editcat&codigo=${c.codigocategoria}&estado=0" class="btn-floating red">
                                                <i class="material-icons">check</i>
                                            </a>
                                        </c:if>
                                        <c:if test="${c.estado eq 0}">
                                            <a href="control.do?bt=editcat&codigo=${c.codigocategoria}&estado=1" class="btn-floating blue">
                                                <i class="material-icons">clear</i>
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
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
      <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
  </html>
