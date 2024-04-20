<%@page import="com.umariana.conexion.listarCat"%>
<%@page import="com.umariana.conexion.Categoria"%>
<%@page import="com.umariana.conexion.gestionarTutoriales"%>
<%@page import="java.util.List"%>
<!-- include para incluir un archivo dentro de otro, en este caso el header.  -->
<%@include file="templates/header.jsp"%>
<!-- Agregar banner para interfaz principal -->
<nav class="navbar navbar-light bg-light">
    <a class="img-fluid mx-auto navbar-brand">
        <img src="img/tutorialimg.jpg" style="width: 70%; height: auto;" class="d-inline-block align-top" alt="banner">    
    </a>
</nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light" text="center">
  <div class="container-fluid" style="font-family: 'Archivo Black';" > 
    <a class="navbar-brand" href="index.jsp">Regresar a tutoriales</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#indexCat.jsp" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>
<!-- clase contenedora -->    
<!-- Clase container-fluid para que el contenedor se extienda a toda la pantalla -->
<div style="font-family: 'Archivo Black';" class="container-fluid">
    <!-- Clase max-width para establecer un ancho máximo para el contenedor -->
    <div class="row max-width">       
        <!-- clase division por 4 columnas -->
        <!-- Clase mx-auto para centrar el contenedor horizontalmente -->
        <div class="col-md-4 mx-auto">         
            <div class="card card-body"> 
                <!-- tarjeta de trabajo o formulario, enctype que permite enviar archivos medidos en bytes, img-->
                <form action ="svAgregarCategoria" method = "POST">
                    <h3 style="text-align: center">Agregar Categoria</h3>                                          
                    <!-- Label e input para el nombre-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="idCat">idCategoria</label>
                        <input type="number" name="idCat" class="form-control" placeholder="Ingrese la categoria" aria-label="Ingrese el nombre" aria-describedby="basic-addon1" id="idCat" required="ingresa categoria">                                         
                    </div> 
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="nombreCat">Nombre</label>
                        <input type="text" name="nombreCat" class="form-control" placeholder="Ingrese el nombre" aria-label="Ingrese el nombre de categoria" aria-describedby="basic-addon1" id="nombreCat" required="ingresa name">                                         
                    </div>                                                                       
                    <!-- boton de agregar el tutorial -->                             
                    <div class="text-center">                            
                        <button type="submit" class="btn btn-success mx-auto" href="indexCat.jsp">Agregar categoria</button>    
                    </div>                           
                </form>                                        
            </div>                         
        </div>  

        <!-- Tabla de datos, agregamos diseño gris en table-light -->
        <div class="col-md-8">                                  
            <table style="font-family: 'Archivo Black';" class="table  table-bordered table-light"> 
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/[email protected]/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta1/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xM6B5z6W5" crossorigin="anonymous"></script>
                <!-- Barra de navegación con botones -->
                <div class="navbar-nav">

                </div>
                <thead>
                    <tr class="text-center">  
                        <th>idCategoria</th>
                        <th>Categoria</th>                             
                        <th>Acciones</th>                                                                           
                    </tr>                                           
                </thead>        

                <tbody>                             
                    <!-- se toma el array creado en el POST para los datos de los perritos-->
                    <%
    // Obtener la lista de tutoriales llamando al método estático listarTuto()
    List<Categoria> listaCategoria = listarCat.listarCat();

    // Verificar si la lista no está vacía
    if (listaCategoria != null && !listaCategoria.isEmpty()) {
        // Iterar sobre la lista de tutoriales para mostrar cada uno en la tabla
        for (Categoria miCategoria : listaCategoria) {
%>



                    <tr id="tr" class="text-center"> 
                        <td><%= miCategoria.getIdCategoria()%></td>
                <td><%= miCategoria.getNombreCat()%></td>                                 
                                                                    
                        <!-- En la sección de la tabla en index.jsp -->
                        <td>
                            <!-- Botón para editar cat -->
                            <button class="btn btn-warning btn-sm" onclick="editarCategoria(<%= miCategoria.getIdCategoria() %>)">
                                <i class="fa fa-pencil-alt text-white"></i>
                            </button>
                            <!-- Botón para eliminar tutorial -->
                            <form action="svEliminarCategoria" method="post" style="display: inline;">
                                <input type="hidden" name="idCategoria" value="<%= miCategoria.getIdCategoria() %>">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('¿Está seguro de que desea eliminar esta categoria?');">
                                    <i class="fa fa-trash text-white"></i>
                                </button>
                            </form>
                        </td>

                    </tr>
                    <!-- cierre de el ciclo-->
                    <%
        }
    } else {
%>

                </tbody>
            </table>  

        <!-- Mensaje si no se encontraron tutoriales -->
        <tr>
            <td colspan="7" class="no-tutorials">No se encontraron categorias.</td>
        </tr>
<%
    }
%>            

        </div>
    </div>          
</div>


<!-- Modal de edición de tutorial -->
<div class="modal fade" id="editarCatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar categoria</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="svEditarCategoria" method="POST" id="formEditarCat">
                    <!-- Campo oculto para almacenar el ID del tutorial -->
                    <input type="hidden" name="idCatEdit" id="idCatEdit">
                    <!-- Campo de edición para el nombre -->
                    <div class="mb-3">
                        <label for="nombreEdit" class="form-label">Categoria</label>
                        <input type="text" class="form-control" id="nombreCatEdit" name="nombreCatEdit" placeholder="Nombre de la categoria" required>
                    </div>
                    <!-- Botón para enviar el formulario de edición -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                        <button type="button" class="btn btn-danger btn-success mx-2" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Script para manejar la apertura del modal y enviar el ID del tutorial -->
<!-- Script para manejar la apertura del modal y enviar el ID del tutorial -->
<script>
    function editarCategoria(idCat) {
        // Establecer el valor del ID del tutorial en el campo oculto del formulario de edición
        document.getElementById("idCatEdit").value = idCat;
        // Mostrar el modal de edición
        var editarTutorialModal = new bootstrap.Modal(document.getElementById('editarCatModal'), {
            keyboard: false
        });
        editarTutorialModal.show();
    }
</script>


<div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert" style="display: none;">
  <strong>El ID de la categoria ya existe, ingrese un ID diferente.</strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
    Boolean userActionError = (Boolean) session.getAttribute("userActionError");
    // Verificar si el error proviene de una acción del usuario
    if (userActionError != null && userActionError) {
%>
<script>
    // Mostrar la alerta de error en la ventana modal
    var errorAlert = document.getElementById('errorAlert');
    errorAlert.style.display = 'block';
</script>
<%
    // Limpiar la bandera después de mostrar la alerta
    session.removeAttribute("userActionError");
}
%>
<script>
        // Ocultar la alerta después de 4 segundos 
        setTimeout(function () {
            $('#errorAlert').alert('close');
        }, 4000);
</script>
<!-- include para incluir un archivo dentro de otro, en este caso el footer qque tomara los scripts realizados en esa clase.  -->
<%@include file= "templates/footer.jsp"%>