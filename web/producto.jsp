<%@page import="cl.entities.Producto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="cl.entities.*"%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.model.ServicioLocal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ServicioLocal servicio;%>
<%
    InitialContext ctx = new InitialContext();
    servicio = (ServicioLocal) ctx.lookup("java:global/GestionVentaEMG/Servicio!cl.model.ServicioLocal");
    List<Categoria> lista = servicio.getCategorias();
    List<Producto>listap = servicio.getProductos();
%>
<c:set scope="page" var="lista" value="<%=lista%>"/>
<c:set scope="page" var="listap" value="<%=listap%>"/>

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
                    <h3> PRODUCTOS </h3>
                    <form action="control.do" method="POST">
                        
                        <div class="input-field">
                            <input id="nombre" type="text" name="nombre">
                            <label for="nombre">Nombre</label>
                        </div>
                        <div class="input-field">
                            <input id="precio" type="text" name="precio">
                            <label for="precio">Precio</label>
                        </div>
                        <div class="input-field">
                            <input id="stock" type="text" name="stock">
                            <label for="stock">Stock</label>
                        </div>
                        
                        <select class="browser-default" name="codcat" >
                            <c:forEach items="${lista}" var="c">
                                <option value="${c.codigocategoria}">${c.nombre}</option>
                            </c:forEach>
                        </select>
                        <br><br>

                        <button class="btn black" name="bt" value="addprod" type="submit">Guardar</button>    

                    </form>
                    <br>
                    ${msg}
                    <br>

                    <button onclick="if(document.getElementById('spoiler') .style.display=='none') 
                        {document.getElementById('spoiler') .style.display=''}else{document.getElementById('spoiler') .style.display='none'}" 
                            title="Click para Mostrar" type="button" class="waves-light btn red"><i class="material-icons left">sort</i>Ver Productos</button>
                    <br><br>
                    <div id="spoiler" style="display: none;">
                        <table class="bordered">
                            <tr>
                                <td>CODIGO</td>
                                <td>NOMBRE</td>
                                <td>PRECIO</td>
                                <td>STOCK</td>
                                <td>ESTADO</td>
                                <td></td>
                                <td></td>

                            </tr>

                            <c:forEach items="${listap}" var="p">
                                <tr>
                                    <td>${p.codigoproducto}</td>
                                    <td>${p.nombre}</td>
                                    <td>${p.precio}</td>
                                    <td>${p.stock}</td>
                                    <td>
                                        <c:if test="${p.estado eq 1}">
                                            ACTIVADO                                            
                                        </c:if>
                                        <c:if test="${p.estado eq 0}">
                                            DESACTIVADO                                            
                                        </c:if>
                                    </td>  
                                    <td>
                                        <c:if test="${p.estado eq 1}">
                                            <a href="control.do?bt=editprodes&codigo=${p.codigoproducto}&estado=0&precio=${p.precio}" class="btn-floating red">
                                                <i class="material-icons">check</i>
                                            </a>
                                        </c:if>
                                        <c:if test="${p.estado eq 0}">
                                            <a href="control.do?bt=editprodes&codigo=${p.codigoproducto}&estado=1&precio=${p.precio}" class="btn-floating blue">
                                                <i class="material-icons">clear</i>
                                            </a>
                                        </c:if> 
                                    </td> 
                                    <!--<td>
                                        <a href="testiarproducto.jsp?codigo=${p.codigoproducto}&nombre=${p.nombre}&precio=${p.precio}&stock=${p.stock}&estado=${p.estado}" 
                                           class="btn">Editar</a> 
                                    </td> --> 

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
      <script type="text/javascript" src="js/materialize.min.js">document.addEventListener('DOMContentLoaded', function() {
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
