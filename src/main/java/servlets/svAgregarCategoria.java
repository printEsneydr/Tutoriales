package servlets;

import com.umariana.conexion.gestionarTutoriales;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author esney
 */
@WebServlet(name = "svAgregarCategoria", urlPatterns = {"/svAgregarCategoria"})
public class svAgregarCategoria extends HttpServlet {

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
                
                String idCategoria = request.getParameter("idCat");
                // Verificar si el ID del tutorial ya existe en la base de datos
                if (gestionar.existeCat(idCategoria)) {
                    request.setAttribute("error", true);
                    // Redireccionar al formulario de agregar tutorial
                    request.getSession().setAttribute("userActionError", true);
                    request.getRequestDispatcher("indexCat.jsp").forward(request, response);
                    return;
                }
                
                CallableStatement stmt = conn.prepareCall("{call agregarCategoria(?, ?)}");
                String nombreCat = request.getParameter("nombreCat");               
                
                stmt.setString(1, idCategoria);
                stmt.setString(2, nombreCat);                
                
                System.out.println(idCategoria);
                System.out.println(nombreCat);

                stmt.execute();
                conn.close();

                response.sendRedirect("indexCat.jsp");              
                System.out.println("conexion exitosa Categoria");
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
