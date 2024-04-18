<%@page import="com.umariana.conexion.listarTuto"%>
<%@page import="com.umariana.conexion.gestionarTutoriales"%>
<%@page import="java.util.List"%>
<%@page import="com.umariana.conexion.Tutorial"%>
<!-- include para incluir un archivo dentro de otro, en este caso el header.  -->
<%@include file="templates/header.jsp"%>
<!-- Agregar banner para interfaz principal -->
<nav class="navbar navbar-light bg-light">
    <a class="img-fluid mx-auto navbar-brand">
        <img src="img/tutorialimg.jpg" style="width: 70%; height: auto;" class="d-inline-block align-top" alt="banner">    
    </a>
</nav>
<!-- clase contenedora -->    
<!-- Clase container-fluid para que el contenedor se extienda a toda la pantalla -->
<div style="font-family: 'Archivo Black';" class="container-fluid">
    <!-- Clase max-width para establecer un ancho m�ximo para el contenedor -->
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
                            <option value="1">Revisado</option>
                            <option value="2">Por revisado</option>                                 
                        </select>                            
                    </div>          
                    <!--Label e inputnput para los puntos-->                   
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="categoria">Categoria</label>
                        <select class="form-select" name="categoria" aria-label="Default select example" id="categoria" required>
                            <option value="" disabled selected>Seleccione...</option>
                            <option value="1">Logica de programacion</option>
                            <option value="2">Flutter</option>                                 
                            <option value="3">node.js</option>    
                        </select>                            
                    </div>                             
                    <!-- boton de agregar el tutorial -->                             
                    <div class="text-center">                            
                        <button type="submit" class="btn btn-success mx-auto">Agregar tutorial</button>    
                        <input type="submit" class="btn btn-primary" value="Agregar tutorial" >                     
                    </div>                           
                </form>                                        
            </div>                         
        </div>  

        <!-- Tabla de datos, agregamos dise�o gris en table-light -->
        <div class="col-md-8">                                  
            <table style="font-family: 'Archivo Black';" class="table  table-bordered table-light"> 
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/[email protected]/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta1/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xM6B5z6W5" crossorigin="anonymous"></script>
                <!-- Barra de navegaci�n con botones -->
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
    // Obtener la lista de tutoriales llamando al m�todo est�tico listarTuto()
    List<Tutorial> listaTutoriales = listarTuto.listarTuto();

    // Verificar si la lista no est� vac�a
    if (listaTutoriales != null && !listaTutoriales.isEmpty()) {
        // Iterar sobre la lista de tutoriales para mostrar cada uno en la tabla
        for (Tutorial miTutorial : listaTutoriales) {
%>



                    <tr id="tr" class="text-center">                                   
                        <!-- las extensiones para la sub tabla con los datos registrados en el form -->                                                                                             
                        <td><%= miTutorial.getIdTutorial() %></td>                                 
                <td><%= miTutorial.getNombre() %></td>                                 
                <td><%= miTutorial.getPrioridad() %></td>
                <td><%= miTutorial.getUrl() %></td>
                <td><%= miTutorial.getEstado() %></td> 
                <td><%= miTutorial.getCategoria() %></td>                                 
                                                                    
                        <td>

                            <!-- Actualiza el bot�n de edici�n en la tabla de perritos, para editar su informacion -->                                        
                            <a href="#editModal" class="btn btn-warning btn-sm" title="Editar"
                               onclick="">
                                <i class="fa fa-pencil-alt text-white"></i>
                            </a>                      
                            <!-- boton para eliminar el perrito modificado para usar jax -->
                            <button class="btn btn-danger btn-sm" onclick="">
                                <i class="fa fa-trash text-white"></i>
                            </button>                                               
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
<!-- include para incluir un archivo dentro de otro, en este caso el footer qque tomara los scripts realizados en esa clase.  -->
<%@include file= "templates/footer.jsp"%>