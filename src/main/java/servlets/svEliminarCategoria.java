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

@WebServlet(name = "svEliminarCategoria", urlPatterns = {"/svEliminarCategoria"})
public class svEliminarCategoria extends HttpServlet {

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
                // Obtener el ID del tutorial a eliminar desde los parámetros de la solicitud
                String idCategoria = request.getParameter("idCategoria");

                // Sentencia SQL para eliminar el tutorial
                String sql = "DELETE FROM categoria WHERE idCategoria = ?";

                // Preparar la declaración SQL
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, idCategoria);

                // Ejecutar la consulta
                pstmt.executeUpdate();

                // Cerrar la conexión
                conn.close();

                // Redireccionar al usuario de vuelta a la página index.jsp
                response.sendRedirect("indexCat.jsp");
                
                System.out.println("Categoria eliminado exitosamente");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error al eliminar la categoria: " + e.getMessage());
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
