package servlets;

import com.umariana.conexion.gestionarTutoriales;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "svEditarCategoria", urlPatterns = {"/svEditarCategoria"})
public class svEditarCategoria extends HttpServlet {

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
                // Obtener los parámetros del formulario de edición
                String idCat = request.getParameter("idCatEdit");
                String nombreCat = request.getParameter("nombreCatEdit");
                // Validar y convertir la prioridad a entero                

                // Preparar la sentencia SQL para actualizar la categoría
                String sql = "UPDATE categoria SET nombreCat=? WHERE idCategoria=?";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, idCat);
                pstmt.setString(2, nombreCat);

                // Ejecutar la consulta de actualización
                pstmt.executeUpdate();

                // Cerrar la conexión
                conn.close();

                // Redireccionar al usuario de vuelta a la página index.jsp
                response.sendRedirect("indexCat.jsp");

                System.out.println("Categoria editada exitosamente");
            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                response.getWriter().println("Error al editar categoria: " + e.getMessage());
            }
        } else {
            response.getWriter().println("No se pudo establecer una conexión a la base de datos.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
