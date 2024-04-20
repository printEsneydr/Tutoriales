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
                // Verificar si el ID del tutorial ya existe en la base de datos
                if (gestionar.existeTutorial(idTutorial)) {
                    request.setAttribute("error", true);
                    // Redireccionar al formulario de agregar tutorial
                    request.getSession().setAttribute("userActionError", true);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }
                CallableStatement stmt = conn.prepareCall("{call agregarTutorial(?, ?, ?, ?, ?, ?)}");
                
                String nombre = request.getParameter("nombre");               
                String prioridad = request.getParameter("prioridad");
                String url = request.getParameter("url");
                
                // Validar la URL
    try {
        new URL(url).toURI();
    } catch (MalformedURLException | URISyntaxException e) {
        // La URL no es válida, puedes mostrar un mensaje de error o realizar alguna acción adecuada
        e.printStackTrace();
        response.getWriter().println("La URL ingresada no es válida.");
        return;
    }
                String estado = request.getParameter("estado");           
                String cat=request.getParameter("categori");
                
                stmt.setString(1, idTutorial);
                stmt.setString(2, nombre);                
                stmt.setString(3, prioridad);
                stmt.setString(4, url);
                stmt.setString(5, estado);
                stmt.setString(6, cat);   
                
                System.out.println(idTutorial);
                System.out.println(nombre);
                System.out.println(prioridad);
                System.out.println(url);
                System.out.println(estado);
                System.out.println(cat);

                stmt.execute();
                conn.close();

                response.sendRedirect("index.jsp");              
                System.out.println("conexion exitosa Tutorial");
            } catch (SQLException e)
            {
                e.printStackTrace(); 
                response.getWriter().println("error");
            }
        } else 
        {
            response.getWriter().println("No se pudo establecer una conexión a la base de datos.");
        }
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
