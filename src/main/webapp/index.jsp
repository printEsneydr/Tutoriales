<%@page import="com.umariana.conexion.listarCat"%>
<%@page import="com.umariana.conexion.Categoria"%>
<%@page import="com.umariana.conexion.listarTuto"%>
<%@page import="com.umariana.conexion.gestionarTutoriales"%>
<%@page import="java.util.List"%>
<%@page import="com.umariana.conexion.Tutorial"%>
<!-- include para incluir un archivo dentro de otro, en este caso el header.  -->
<%@include file="templates/header.jsp"%>



<nav class="navbar navbar-expand-lg" style="background-color: #f5f5f5;">
    <div class="container-fluid">
        <label class="navbar-brand" style="color: #black; background-color: E2E2E2; font-family:  times new roman; font-size: 40px " >Tutoriales</label>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" style="font-family: times new roman; font-size: 20px" aria-current="page" href="index1.jsp">Inicio</a>
                <a class="nav-link active btn warning custom-button" style="font-family: times new roman; font-size: 20px" aria-current="page" href="index.jsp">Agregar tutorial</a>
                <a class="nav-link active" style="font-family: times new roman; font-size: 20px" aria-current="page" href="indexCat.jsp">Agregar categoria</a>

            </div>
        </div>
    </div>
</nav>



<!-- Agregar banner para interfaz principal -->
<nav class="navbar navbar-light bg-light">
    <a class="img-fluid mx-auto navbar-brand">
        <img src="img/tutorialimg.jpg" style="width: 70%; height: auto;" class="d-inline-block align-top" alt="banner">    
    </a>
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
                <form action ="svAgregarTutorial" method = "POST">
                    <h3 style="text-align: center">Agregar Tutorial</h3>                    
                    <!-- Label e input para el id-->
                    <div class="input-group mb-3">        
                        <label class="input-group-text" for="idTutorial">idTutorial</label>                          
                        <input type="number" name="idTutorial" class="form-control" placeholder="Ingrese el Id" aria-label="id" aria-describedby="basic-addon1" id="idTutorial" required>                          
                    </div>  
                    <!-- Label e input para el nombre-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="nombre">Nombre</label>
                        <input type="text" name="nombre" class="form-control" placeholder="Ingrese el nombre" aria-label="Ingrese el nombre" aria-describedby="basic-addon1" id="nombre" required="ingresa name">                                         
                    </div>  
                    <!-- Label e input para la prioridad-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="prioridad">Prioridad</label>
                        <select class="form-select" name="prioridad" id="prioridad" aria-label="Default select example" required>
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="1">1</option>
                            <option value="2">2</option>                                 
                            <option value="3">3</option>                                  
                            <option value="4">4</option>                                   
                            <option value="5">5</option>                                                                    
                            <option value="6">6</option>                                  
                            <option value="7">7</option>                                  
                            <option value="8">8</option>                                  
                            <option value="9">9</option>                                  
                            <option value="10">10</option>      
                        </select>                            
                    </div>         
                    <!-- Label e input para la raza-->
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="url">URL</label>
                        <input type="text" name="url" class="form-control" placeholder="Ingrese la URL" aria-label="Ingrese la URL" aria-describedby="basic-addon1" id="url" required>
                    </div>      
                    <!-- Label e input para la raza-->
                    <!--Label e inputnput para los puntos-->                   
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="estado">Estado</label>
                        <select class="form-select" name="estado" aria-label="Default select example" id="estado" required>
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="Revisado">Revisado</option>
                            <option value="Por revisar">Por revisar</option>                                 
                        </select>                            
                    </div>          
                    <!--Label e inputnput para los puntos-->                   
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="categoria">Categoria</label>
                        <select name="categoria">
                            <% 
                            List<Categoria> categorias = listarCat.listarCat();
                            for (Categoria categoria : categorias) {
                            %>
                            <option value="<%= categoria.getNombreCat()%>"><%= categoria.getNombreCat() %></option>
                            <% 
                            }
                            %>
                        </select>
                           
                    </div>                             
                    <!-- boton de agregar el tutorial -->                             
                    <div class="text-center">                            
                        <button type="submit" class="btn btn-success mx-auto">Agregar tutorial</button>    
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

                        <th>id</th>                          
                        <th>Nombre</th>                                                       
                        <th>Prioridad</th>                            
                        <th>URL</th>                            
                        <th>Estado</th>                             
                        <th>Categoria</th>                             
                        <th>Acciones</th>                                                                           
                    </tr>                                           
                </thead>        

                <tbody>                             
                    <!-- se toma el array creado en el POST para los datos de los perritos-->
                    <%
                        // Obtener la lista de tutoriales llamando al método estático listarTuto()
                        List<Tutorial> listaTutoriales = listarTuto.listarTuto();

                        // Verificar si la lista no está vacía
                        if (listaTutoriales != null && !listaTutoriales.isEmpty()) {
                            // Iterar sobre la lista de tutoriales para mostrar cada uno en la tabla
                            for (Tutorial miTutorial : listaTutoriales) {
                    %>



                    <tr id="tr" class="text-center">                                   
                        <!-- las extensiones para la sub tabla con los datos registrados en el form -->                                                                                             
                        <td><%= miTutorial.getIdTutorial()%></td>                                 
                        <td><%= miTutorial.getNombre()%></td>                                 
                        <td><%= miTutorial.getPrioridad()%></td>
                        <td><a href="<%= miTutorial.getUrl() %>" target="_blank">Abrir URL</a></td>
                        <td><%= miTutorial.getEstado()%></td> 
                        <td><%= miTutorial.getCategori()%></td>                                 

                        <!-- En la sección de la tabla en index.jsp -->
                        <td>

                            <a href="#" class="btn btn-primary btn-sm" onclick="mostrarTutorial('<%= miTutorial.getIdTutorial()%>', '<%= miTutorial.getNombre()%>', '<%= miTutorial.getPrioridad()%>', '<%= miTutorial.getUrl()%>', '<%= miTutorial.getEstado()%>', '<%= miTutorial.getCategori()%>')">
                                <i class="fa fa-eye text-white"></i>
                            </a>
                            <!-- Botón para editar tutorial -->
                                <button class="btn btn-warning btn-sm" onclick="obtenerDatosParaEdicion(<%= miTutorial.getIdTutorial()%>, '<%= miTutorial.getNombre()%>', '<%= miTutorial.getPrioridad()%>', '<%= miTutorial.getUrl()%>', '<%= miTutorial.getEstado()%>', '<%= miTutorial.getCategori()%>')">
    <i class="fa fa-pencil-alt text-white"></i>
</button>

                            <!-- Botón para eliminar tutorial -->
                            <form action="svEliminarTutorial" method="post" style="display: inline;">
                                <input type="hidden" name="idTutorial" value="<%= miTutorial.getIdTutorial()%>">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('¿Está seguro de que desea eliminar este tutorial?');">
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
                <td colspan="7" class="no-tutorials">No se encontraron tutoriales.</td>
            </tr>
            <%
                }
            %>            

        </div>
    </div>          
</div>


<!-- Modal de edición de tutorial -->
<!-- Modal de edición de tutorial -->
<div class="modal fade" id="editarTutorialModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Tutorial</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="svEditarTutorial" method="POST" id="formEditarTutorial" enctype="multipart/form-data">
                    <!-- Campo oculto para almacenar el ID del tutorial -->
                    <input type="hidden" name="idTutorialEdit" id="idTutorialEdit">
                    <!-- Campo de edición para el nombre -->
                    <div class="mb-3">
                        
                        <label for="nombreEdit" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombreEdit" name="nombre" placeholder="Nombre del tutorial" required>
                    </div>
                    <!-- Campo de edición para la prioridad -->
                    <div class="mb-3">
                        <label for="prioridadEdit" class="form-label">Prioridad</label>
                        <select class="form-select" id="prioridadEdit" name="prioridad" placeholder="Prioridad del tutorial" required>
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="1">1</option>
                            <option value="2">2</option>                                 
                            <option value="3">3</option>                                  
                            <option value="4">4</option>                                   
                            <option value="5">5</option>                                                                    
                            <option value="6">6</option>                                  
                            <option value="7">7</option>                                  
                            <option value="8">8</option>                                  
                            <option value="9">9</option>                                  
                            <option value="10">10</option>
                        </select>
                    </div>
                    <!-- Campo de edición para la URL -->
                    <div class="mb-3">
                        <label for="urlEdit" class="form-label">URL</label>
                        <input type="text" class="form-control" id="urlEdit" name="url" placeholder="URL del tutorial" required>
                    </div>
                    <!-- Campo de edición para el estado -->
                    <div class="mb-3">
                        <label for="estadoEdit" class="form-label">Estado</label>
                        <select class="form-select" id="estadoEdit" name="estado" required>
                            <option value="Revisado">Revisado</option>
                            <option value="Por revisar">Por revisar</option>
                        </select>
                    </div>
                    <!-- Campo de edición para la categoría -->
                    <!-- Campo de edición para la categoría -->
<div class="mb-3">
    <label for="categoriaEdit" class="form-label">Categoría</label>
    <select class="form-select" id="categoriaEdit" name="categoria" required>
        <%
        for (Categoria categoria : categorias) {
        %>
        <option value="<%= categoria.getNombreCat()%>"><%= categoria.getNombreCat() %></option>
        <% 
        }
        %>
    </select>
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
<script>
    function editarTutorial(idTutorial) {
        // Establecer el valor del ID del tutorial en el campo oculto del formulario de edición
        document.getElementById("idTutorialEdit").value = idTutorial;
        // Mostrar el modal de edición
        var editarTutorialModal = new bootstrap.Modal(document.getElementById('editarTutorialModal'), {
            keyboard: false
        });
        editarTutorialModal.show();
    }
</script>
<!-- Modal para mostrar la informacion del tutorial-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Detalles del Tutorial</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <h4 style='color: #1c1c1c; text-align: center;'>
                    <p><strong>ID<br></strong> <span style='color: #555555' id="tutorialId"></span></p>
                    <p><strong>Nombre<br></strong> <span style='color: #555555' id="tutorialNombre"></span></p>
                    <p><strong>Prioridad<br></strong> <span style='color: #555555' id="tutorialPrioridad"></span></p>
                    <p><strong>URL<br></strong> <span style='color: #555555' id="tutorialUrl"></span></p>
                    <p><strong>Estado<br></strong> <span style='color: #555555' id="tutorialEstado"></span></p>
                    <p><strong>Categoría<br></strong> <span style='color: #555555' id="tutorialCategoria"></span></p>
                </h4>
                <div class="text-center">
                    <button type="button" class="btn btn-danger btn-success mx-2" data-bs-dismiss="modal">Cancelar</button>
                </div>       </div>   
        </div>
    </div>
</div>

<script>
    function mostrarTutorial(id, nombre, prioridad, url, estado, categoria) {
        // Actualiza el contenido de la ventana modal con los datos del tutorial
        document.getElementById('tutorialId').innerText = id;
        document.getElementById('tutorialNombre').innerText = nombre;
        document.getElementById('tutorialPrioridad').innerText = prioridad;
        document.getElementById('tutorialUrl').innerText = url;
        document.getElementById('tutorialEstado').innerText = estado;
        document.getElementById('tutorialCategoria').innerText = categoria;

        // Muestra la ventana modal
        var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
        modal.show();
    }
</script>

<div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlerta" style="display: none;">
  <strong>El ID del tutorial ya existe, ingresa un ID diferente.</strong> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
    Boolean userActionError = (Boolean) session.getAttribute("userActionError");
    // Verificar si el error proviene de una acción del usuario
    if (userActionError != null && userActionError) {
%>
<script>
    // Mostrar la alerta de error en la ventana modal
    var errorAlerta = document.getElementById('errorAlerta');
    errorAlerta.style.display = 'block';
</script>
<%
    // Limpiar la bandera después de mostrar la alerta
    session.removeAttribute("userActionError");
}
%>
<script>
        // Ocultar la alerta después de 4 segundos 
        setTimeout(function () {
            $('#errorAlerta').alert('close');
        }, 4000);
</script>
<script>
    function obtenerDatosParaEdicion(idTutorial, nombre, prioridad, url, estado, categoria) {
        // Pasa los datos del tutorial a la función editarTutorial()
        editarTutorial(idTutorial, nombre, prioridad, url, estado, categoria);
    }

    function editarTutorial(idTutorial, nombre, prioridad, url, estado, categoria) {
        // Establece los valores de los campos de la ventana modal con los datos del tutorial
        document.getElementById("idTutorialEdit").value = idTutorial;
        document.getElementById("nombreEdit").value = nombre;
        document.getElementById("prioridadEdit").value = prioridad;
        document.getElementById("urlEdit").value = url;
        document.getElementById("estadoEdit").value = estado;
        document.getElementById("categoriaEdit").value = categoria;

        // Muestra la ventana modal de edición
        var editarTutorialModal = new bootstrap.Modal(document.getElementById('editarTutorialModal'), {
            keyboard: false
        });
        editarTutorialModal.show();
    }
</script>

<!-- include para incluir un archivo dentro de otro, en este caso el footer qque tomara los scripts realizados en esa clase.  -->
<%@include file= "templates/footer.jsp"%>