<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <div class="row">
            <div class="col s6 offset-s3">
                <div class="card-panel">
                    <form action="control.do" method="post">
                        <h5>Detalle de Compra</h5>
                        <button class="btn-floating right pulse" type="submit" name="bt" value="compra">
                            <i class="material-icons">shopping_cart</i>
                        </button>
                        <input type="text" name="rut" placeholder="Rut del cliente"/>
                        <br>
                        <table class="bordered">
                            <tr>
                                <td>NOMBRE</td>
                                <td>PRECIO</td>
                                <td>UNIDADES</td>
                                <td></td>
                            </tr>
                            
                            <c:forEach items="${carro}" var="p">
                                <tr>
                                <td>${p.nombre}</td>
                                <td>${p.precio}</td>
                                <td>
                                    <select class="browser-default" name="unidades${p.codigoproducto}">
                                        <option value="" disable selected>Escoge la cantidad</option>
                                        <c:forEach begin="1" end="${p.stock}" var="i">
                                            <option value="i">${i}</option>
                                        </c:forEach>
                                    </select>
                                    
                                </td>
                                <td>
                                    <a href="control.do?bt=deletecar&codigo=${p.codigoproducto}"
                                       class="btn-floating red">
                                        <i class="material-icons">delete</i>
                                    </a>
                                       <br><br>
                                </td>
                                </tr>
                            </c:forEach>                                    
                        </table>
                        <br>
                        ${msg}
                    </form>  
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