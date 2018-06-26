
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
    <div class="nav-wrapper grey darken-4">
        <a href="#" class="brand-logo">
            <c:if test="${not empty admin}">
                Bienvenido ${admin.nombre} ${admin.apellido}
            </c:if>
            <c:if test="${not empty vendedor}">
                    Bienvenido ${vendedor.nombre} ${vendedor.apellido}
            </c:if> 
            <c:if test="${not empty cliente}">
                Bienvenido ${cliente.nombre} 
            </c:if>        
        </a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
          <c:if test="${not empty admin}">
              <li><a href="producto.jsp">Productos</a></li>
              <li><a href="usuario.jsp">Usuarios</a></li>
              <li><a href="categoria.jsp">Categorias</a></li>
              <li><a href="venta.jsp">Ventas</a></li>
              <c:if test="${carro.size()>0}">
              <li><a href="detallecarro.jsp">Carrito(${carro.size()})</a></li>
              </c:if>
              <li><a href="salir.jsp">Salir</a></li>
          </c:if> 
          <c:if test="${not empty vendedor}">
              <li><a href="venta.jsp">Venta</a></li>
              <li><a href="salir.jsp">Salir</a></li>
              
          </c:if> 
          <c:if test="${not empty cliente}">
              <li><a href="clienteclave.jsp">Cambiar clave</a></li>
              <li><a href="salir.jsp">Salir</a></li>
          </c:if>     
        
        
      </ul>
    </div>
  </nav>