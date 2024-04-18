<!-- importacion del boostrap para los estilos -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>       
<!-- se inician las creaciones de los scripts -->
<!-- este script es para la funcion de mostrar detalles del perrito-->
<script>
    // funcion para mostrar los datos en la ventana modal
    $('#exampleModal').on('show.bs.modal', function (event) {
        // Bot�n que desencaden� el evento
        var button = $(event.relatedTarget); 
        // Obt�n el nombre del perro
        var nombre = button.data('nombre'); 
        // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
        $.ajax({
            // Cambia 'id' por el nombre del par�metro que esperas en tu servlet
            url: 'svCaninos?nombre=' + nombre, 
            method: 'GET',
            success: function (data) {
        // Actualiza el contenido del modal con los detalles del perro                    
        $('#perro-details').html(data);            
    },
            error: function () {
        // Maneja errores aqu� si es necesario
        console.log('Error al cargar los detalles del perro.');
    }
        });
    });
</script>   
<!-- Este script es para mostrar en una modal el perrito mas vieejo de la lista-->
<script>
    $(document).ready(function() {       
        // Bot�n para mostrar el perro m�s viejo       
        $('#btnMostrarPerroMasViejo').click(function() {       
        // Inicializamos variables para realizar un seguimiento del perro m�s viejo       
        var edadMasViejo = -Infinity; // Inicialmente, configuramos una edad muy baja como referencia       
        var filaMasViejo = null;           
        // Iteramos a trav�s de las filas para encontrar el perro m�s viejo           
        $('tr').each(function() {            
        var edad = parseInt($(this).find('td:nth-child(5)').text()); // Suponiendo que la columna de edad es la quinta (�ndice 4)            
        if (!isNaN(edad) && edad > edadMasViejo) {           
            edadMasViejo = edad;           
            filaMasViejo = $(this);          
        }          
    });                 
        if (filaMasViejo !== null) {                
        // Obtenemos todos los datos del perro m�s viejo                        
        var nombrePerroMasViejo = filaMasViejo.find('td:nth-child(1)').text(); // Nombre               
        var razaPerroMasViejo = filaMasViejo.find('td:nth-child(2)').text(); // Raza                
        var edadPerroMasViejo = filaMasViejo.find('td:nth-child(5)').text(); // Edad               
        var puntosPerroMasViejo = filaMasViejo.find('td:nth-child(4)').text(); // Puntos                
        var fotoPerroMasViejo = filaMasViejo.find('td:nth-child(3)').text(); // Foto (ubicaci�n)            
        // Actualizamos los elementos en la ventana modal con los datos del perro             
        $('#nombreMayorPuntaje').text(nombrePerroMasViejo);              
        $('#razaMayorPuntaje').text(razaPerroMasViejo);              
        $('#edadMayorPuntaje').text(edadPerroMasViejo);               
        $('#puntosMayorPuntaje').text(puntosPerroMasViejo);               
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMasViejo); // Cambia aqu� la ruta seg�n tu estructura de directorios               
        // Mostramos la ventana modal                       
        $('#modalMayorPuntaje').modal('show');              
    }   else    {                           
        // En caso de que no haya perros en la lista            
        alert('No hay perros en la lista.');         
    }    
});
});
</script>                        
<!-- Este script es para hacer un resaltado al perrito perdedor o con menor puntaje-->
<script>
    $(document).ready(function() {        
        // Bot�n para mostrar el perro con menor puntaje       
        $('#btnMostrarMenorPuntaje').click(function() {        
        // Inicializamos variables para realizar un seguimiento del perro con el menor puntaje          
        var menorPuntaje = Infinity; // Inicialmente, configuramos un puntaje muy alto como referencia        
        var filaMenorPuntaje = null;
        // Iteramos a trav�s de las filas para encontrar el perro con el menor puntaje           
        $('tr').each(function() {               
        var puntaje = parseInt($(this).find('td:nth-child(4)').text()); // Suponiendo que la columna de puntaje es la cuarta (�ndice 3) 
        if (!isNaN(puntaje) && puntaje < menorPuntaje) {   
            menorPuntaje = puntaje;               
            filaMenorPuntaje = $(this);             
        }            
    });           
        if (filaMenorPuntaje !== null) {           
        // Obtenemos todos los datos del perro con menor puntaje             
        var nombrePerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(1)').text(); // Nombre              
        var razaPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(2)').text(); // Raza              
        var edadPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(5)').text(); // Edad                
        var puntosPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(4)').text(); // Puntos           
        var fotoPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(3)').text(); // Foto (ubicaci�n)            
        // Actualizamos los elementos en la ventana modal con los datos del perro                
        $('#nombreMayorPuntaje').text(nombrePerroMenorPuntaje);               
        $('#razaMayorPuntaje').text(razaPerroMenorPuntaje);
    
        $('#edadMayorPuntaje').text(edadPerroMenorPuntaje);                
        $('#puntosMayorPuntaje').text(puntosPerroMenorPuntaje);                
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMenorPuntaje); // Cambia aqu� la ruta seg�n tu estructura de directorios             
        // Mostramos la ventana modal              
        $('#modalMayorPuntaje').modal('show');           
    } else {            
        // En caso de que no haya perros en la lista            
        alert('No hay perros en la lista.');         
    }
});   
});
</script>

<!-- Este script es para hacer un resaltado al perrito que tiene mayor puntaje resaltandolo como el ganador-->
                                                                                    
<script>
    $(document).ready(function() {
        $('#btnMostrarMayorPuntaje').click(function() {           
        // Inicializamos variables para realizar un seguimiento del perro con el mayor puntaje           
        var mayorPuntaje = -1; // Inicialmente, no hay perro con mayor puntaje            
        var filaMayorPuntaje = null;           
        // Iteramos a trav�s de las filas para encontrar el perro con mayor puntaje            
        $('tr').each(function() {             
        var puntaje = parseInt($(this).find('td:nth-child(4)').text()); // Suponiendo que la columna de puntaje es la cuarta (�ndice 3)            
        if (!isNaN(puntaje) && puntaje > mayorPuntaje) {            
            mayorPuntaje = puntaje;                      
            filaMayorPuntaje = $(this);           
        }            
    });            
        if (filaMayorPuntaje !== null) {               
        // Obtenemos todos los datos del perro con mayor puntaje            
        var nombrePerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(1)').text(); // Nombre           
        var razaPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(2)').text(); // Raza                      
        var edadPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(5)').text(); // Edad              
        var puntosPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(4)').text(); // Puntos                
        var fotoPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(3)').text(); // Foto (ubicaci�n)              
        // Actualizamos los elementos en la ventana modal con los datos del perro                
        $('#nombreMayorPuntaje').text(nombrePerroMayorPuntaje);               
        $('#razaMayorPuntaje').text(razaPerroMayorPuntaje);                
        $('#edadMayorPuntaje').text(edadPerroMayorPuntaje);              
        $('#puntosMayorPuntaje').text(puntosPerroMayorPuntaje);      
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMayorPuntaje); // Cambia aqu� la ruta seg�n tu estructura de directorios             
        // Mostramos la ventana modal              
        $('#modalMayorPuntaje').modal('show');           
    } else {           
        // En caso de que no haya perros en la lista            
        alert('No hay perros en la lista.');            
    }
});
});
</script>
<!-- Este script es para poder eliminar un perrito con su informacion-->             
<script>
    function eliminarPerro(nombrePerro) {
                       
        if (confirm("          �Est�s seguro de que quieres eliminar a " + nombrePerro + "?" + "\n" +                        
                "\n" +                         
                "                          Esta acci�n no se puede cancelar.")) {                                 
            // Env�a una solicitud AJAX al servidor para eliminar el perro                                
            $.ajax({                                
                type: 'GET',                                                
                url: 'svCaninos?eliminar=' + nombrePerro,                                        
                success: function (data) {                                                                                           
        // Actualiza la tabla en la p�gina sin recargarla                                       
        location.reload();                                    
    },                                   
                error: function () {                                   
        console.log('Error al eliminar el perro.');                                 
    }                             
            });                             
        }
    }
</script> 

<!-- Este script es para ordenar la lista de los perritos por su nombre en este caso se uso de la A a la Z-->

<script>  
    function ordenarPorNombre() {
        // Obt�n la tabla de perritos    
        var table = document.querySelector("table tbody");    
        // Obt�n las filas de la tabla excluyendo la primera (encabezado)      
        var rows = Array.from(table.rows);
        // Ordena las filas por nombre en orden alfab�tico    
        rows.sort(function (a, b) {     
        var nombreA = a.cells[0].textContent.toLowerCase();     
        var nombreB = b.cells[0].textContent.toLowerCase();     
        return nombreA.localeCompare(nombreB);  
    });    
        // Elimina todas las filas existentes de la tabla    
        while (table.rows.length > 1) {    
        table.deleteRow(1);    
    }
        // Agrega las filas ordenadas de nuevo a la tabla    
        rows.forEach(function (row) {          
        table.appendChild(row);    
    });
}
</script>

<!-- Este script es para ordenar la lista de perros por edad, mostrando los perros con mayor edad inicialmente -->
<script>
     
    function ordenarPorEdadDescendente() { 
        // Obt�n la tabla de perritos   
        var table = document.querySelector("table tbody");   
        // Obt�n las filas de la tabla excluyendo la primera (encabezado)        
        var rows = Array.from(table.rows);   
        // Ordena las filas por edad en orden descendente    
        rows.sort(function (a, b) {
        var edadA = parseInt(a.cells[4].textContent);   
        var edadB = parseInt(b.cells[4].textContent);
        return edadB - edadA;    
    });    
        // Elimina todas las filas existentes de la tabla    
        while (table.rows.length > 1) {      
        table.deleteRow(1);    
    }    
        // Agrega las filas ordenadas de nuevo a la tabla    
        rows.forEach(function (row) {       
        table.appendChild(row);
    });
}
</script>

<!-- Este script es para ordenar la lista de perros segun cantidad de puntos -->
<script>
    function ordenarPorPuntos() {
        // Recuperar la tabla de la p�gina
        var table = document.querySelector("table tbody");
        // Obtener todas las filas de la tabla
        var rows = Array.from(table.rows);
        // Ordenar las filas por puntos (aseg�rate de que los puntos sean n�meros)
        rows.sort(function (a, b) {           
        var puntosA = parseInt(a.cells[3].textContent);           
        var puntosB = parseInt(b.cells[3].textContent);         
        return puntosB - puntosA;        
    });              
    // Limpiar la tabla    
        table.innerHTML = "";
        // Agregar las filas ordenadas de nuevo a la tabla         
        rows.forEach(function (row) {     
        table.appendChild(row);        
    });
}
</script>

<!-- Este script es para notificar con una modal emergente sobre el nombre existente de un perrito y asi evitar errores-->
<script>
    // Verifica si se debe mostrar el modal de nombre duplicado cuando se ingresa un perrito con el mismo nombre
    <% if (request.getAttribute("nombreDuplicado") != null) { %>                            
    $(document).ready(function() {                           
        $('#nombreDuplicadoModal').modal('show');                           
    });                          
    <% } %>
</script>
<!--Este script es para buscar al perrito por su nombre-->
<script>
    $(document).ready(function() {
  
        $('#btnBuscar').click(function() {
        var nombreABuscar = $('#nombrePerroABuscar').val().trim();
        var modalTitle = $('#modalBusqueda').find('.modal-title'); // Encuentra el elemento del t�tulo de la modal
        if (nombreABuscar === '') {          
            // Mostrar la modal con t�tulo de error si el campo de b�squeda est� vac�o           
            modalTitle.text('Error');
            $('#alertaBusquedaVacia').show();
            // Limpiar el contenido de la modal para eliminar la informaci�n del perro anteriormente buscado
            $('#perro-detailss').html('');
            return; // Salir de la funci�n y evitar la b�squeda vac�a
        } else {
            // Ocultar el mensaje de alerta si se ingres� un nombre v�lido
            $('#alertaBusquedaVacia').hide();
        }        
        // Restaurar el t�tulo predeterminado de la modal
        modalTitle.text('�Este es el perrito que buscabas?');               
        // Realizar una solicitud AJAX al servidor para buscar el perro por nombre       
        $.ajax({          
            type: 'GET',
            //se uso "nombre" para recorrerlo y simplificar, no hay motivos de sancion por este hecho          
            url: 'svCaninos?nombre=' + nombreABuscar,            
            success: function(data) {                
        // Verificar si se encontraron resultados antes de mostrar la modal                
        if (data.trim() !== '') {         
            // Actualizar la tabla de resultados con los detalles del perro                   
            $('#perro-detailss').html(data);               
        } else {                
            // Mostrar un mensaje si no se encontraron resultados  
            alert('No se encontraron resultados para el nombre de perro ingresado.');                
            // Limpiar el contenido de la modal para eliminar la informaci�n del perro anteriormente buscado               
            $('#perro-detailss').html('');             
        }     
    },            
            error: function() {              
        // Manejar errores aqu� si es necesario             
        console.log('Error al buscar el perro.');           
    }         
        });
    });
});               
</script>

<!-- Este script es para poder editar la informacion del perrito seleccionado-->
<script>
   
    function abrirFormularioEdicion(nombrePerro, razaPerro, puntosPerro, edadPerro, fotoPerro) {
    
        // Rellena el formulario de edici�n con los datos actuales del perro    
        document.getElementById("editDogNombre").value = nombrePerro;    
        document.getElementById("nuevoNombre").value = nombrePerro;
    
        document.getElementById("editDogRaza").value = razaPerro;    
        document.getElementById("nuevaRaza").value = razaPerro;
    
        // Para la foto, estableciendo la imagen actual del perrito    
        var imgElement = document.getElementById("fotoActual");    
        imgElement.src = "<%= request.getContextPath() %>/foto/" + fotoPerro;         
        
        document.getElementById("editDogPuntos").value = puntosPerro;
        document.getElementById("nuevosPuntos").value = puntosPerro;
       
        document.getElementById("editDogEdad").value = edadPerro;
        document.getElementById("nuevaEdad").value = edadPerro;  
    // Abre la ventana modal de edici�n   
    $('#editModal').modal('show');
}
</script>
</body>
</html>
<!--cerramos el html, o sea el codigo-->