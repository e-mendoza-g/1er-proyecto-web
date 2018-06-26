<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            
        </c:if>
        <c:if test="${empty admin}">
            <div class="progress">
                <div class="indeterminate"></div>
            </div>
            Error en la pagina, ser� redireccionado en 5s
         <meta http-equiv="refresh" content="5;url=index.jsp">            
        </c:if>
        
        
        
        
        
        
        
      <!--JavaScript at end of body for optimized loading-->
      <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
  </html>