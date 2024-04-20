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

@WebServlet(name = "svEditarTutorial", urlPatterns = {"/svEditarTutorial"})
public class svEditarTutorial extends HttpServlet {

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
                String idTutorial = request.getParameter("idTutorialEdit");
                String nombre = request.getParameter("nombre");
                String url = request.getParameter("url");
                String estado = request.getParameter("estado");
                String categoria = request.getParameter("categoria");

                // Validar y convertir la prioridad a entero
                String p = request.getParameter("prioridad");
                int prioridad = 0; // Valor predeterminado si la cadena es nula
                if (p != null && !p.isEmpty()) {
                    prioridad = Integer.parseInt(p);
                }

                // Preparar la sentencia SQL para actualizar el tutorial
                String sql = "UPDATE tutorial SET Nombre=?, Prioridad=?, Url=?, Estado=?, Categori=? WHERE idTutorial=?";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombre);
                pstmt.setInt(2, prioridad);
                pstmt.setString(3, url);
                pstmt.setString(4, estado);
                pstmt.setString(5, categoria);
                pstmt.setString(6, idTutorial);

                // Ejecutar la consulta de actualización
                pstmt.executeUpdate();

                // Cerrar la conexión
                conn.close();

                // Redireccionar al usuario de vuelta a la página index.jsp
                response.sendRedirect("index.jsp");

                System.out.println("Tutorial editado exitosamente");
            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                response.getWriter().println("Error al editar tutorial: " + e.getMessage());
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
