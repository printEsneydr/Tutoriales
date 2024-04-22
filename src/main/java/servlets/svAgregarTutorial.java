package servlets;

import com.umariana.conexion.Tutorial;
import com.umariana.conexion.gestionarTutoriales;
import com.umariana.conexion.listarTuto;
import static com.umariana.conexion.listarTuto.listarTuto;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author esney
 */
@WebServlet(name = "svAgregarTutorial", urlPatterns = {"/svAgregarTutorial"})
public class svAgregarTutorial extends HttpServlet {

            gestionarTutoriales gestionar = new gestionarTutoriales();
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  
    }
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);                                    
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    Connection conn = gestionar.establecerConexion();

    if (conn != null) {
        try {
            String idTutorial = request.getParameter("idTutorial");
            if (gestionar.existeTutorial(idTutorial)) {
                    request.setAttribute("errorTuto", true);
                    // Redireccionar al formulario de agregar tutorial
                    request.getSession().setAttribute("userActionError", true);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }
            
            // Obtener los parámetros del formulario de edición
            String nombre = request.getParameter("nombre");
            String url = request.getParameter("url");
            String estado = request.getParameter("estado");
            String prioridad = request.getParameter("prioridad");

            // Obtener la categoría seleccionada del formulario
            String nombreCat = request.getParameter("categoria");

            CallableStatement stmt = conn.prepareCall("{call agregarTutorial(?, ?, ?, ?, ?, ?)}");
            stmt.setString(1, idTutorial);
            stmt.setString(2, nombre);
            stmt.setString(3, prioridad);
            stmt.setString(4, url);
            stmt.setString(5, estado);
            stmt.setString(6, nombreCat); // Agregar la categoría al tutorial

            // Ejecutar la consulta para agregar el tutorial
            stmt.execute();
            conn.close();

            response.sendRedirect("index.jsp");
            System.out.println("Conexion exitosa Tutorial");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al agregar tutorial: " + e.getMessage());
        }
    } else {
        response.getWriter().println("No se pudo establecer una conexión a la base de datos.");
    }
}


}
