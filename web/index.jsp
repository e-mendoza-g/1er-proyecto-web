<%-- 
    Document   : index
    Created on : 18-06-2018, 19:07:19
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <div class="container">
            <div class="row">
                <div class="col s6 offset-s3">
                    <div class="card">
                        <div class="card-image">
                            <img src="img/venta-autos.jpg">
                            <span class="card-title center "><h4>Iniciar Sesion</h4></span>
                        </div>
                        <div class="card-content">
                            <form action="control.do" method="POST">
                                <div class="input-field">
                                    <input id="rut" type="text" name="rut">
                                    <label for="rut">Rut</label>
                                </div>
                                <div class="input-field">
                                    <input id="clave" type="password" name="clave">
                                    <label for="clave">Clave</label>
                                </div>
                                <br>
                                <button class="btn" name="bt" value="iniciar" type="submit">LOGIN</button> 
                                <br>
                            </form>
                        </div>
                            
                        <center><h5 style="color: red">${msg}</h5></center>
                        
                    </div>
                    
                    
                    
                    
                    
                </div>
       
            </div>
            
        </div>
        
        
      <!--JavaScript at end of body for optimized loading-->
      <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
  </html>
