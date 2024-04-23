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
                <a class="nav-link active btn warning custom-button" aria-current="page" href="index1.jsp">Inicio</a>
                <a class="nav-link active" style="font-family: times new roman; font-size: 20px" aria-current="page" href="index.jsp">Agregar tutoriales</a>
                <a class="nav-link active" style="font-family: times new roman; font-size: 20px" aria-current="page" href="indexCat.jsp">Agregar categorias</a>

            </div>
        </div>
    </div>
</nav>

<!-- Agregar banner para interfaz principal -->
<nav class="navbar navbar-light bg-light">
    <a class="img-fluid mx-auto navbar-brand">
        <img src="img/tutorialimg.jpg" style="width: 90%; height: 100%;" class="d-inline-block align-top" alt="banner">    
    </a>
</nav>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tutoriales</title>   
    </head>

    <body>
        <div class="container" style="text-align: center; font-family: times new roman; font-size: 20px ">
            <h1><strong>Bienvenido al Gestor de Tutoriales<strong></h1>
                        <p>Este es un programa diseñado para agregar tuturiales y categorias de estos mismos</p><br>
                        <p>gestiona tus tutoriales de manera eficiente y organizada.</p>
                        <p>Pulsa <a href="index.jsp">Agregar Tutoriales</a> para agregar un nuevo tutorial, editarlo, visualizarlo y eliminarlo según tus necesidades.</p><br>
                        <p>Pulsa <a href="indexCat.jsp">Agregar Categoria</a> para agregar una nueva categoria, editarla y eliminarla según tus necesidades.</p><br><br><br>

                        <h3><strong>Disfruta este programa al maximo y aprovecha todos los beneficios que este ofrece<strong></h3>

                                    </div>
                                    </body>

                                    </html>
                                    <!-- include para incluir un archivo dentro de otro, en este caso el footer qque tomara los scripts realizados en esa clase.  -->
                                    <%@include file= "templates/footer.jsp"%>