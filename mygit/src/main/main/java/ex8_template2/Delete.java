package ex8_template2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//http://localhost:8088/JSP/templatetest
@WebServlet("/delete")
public class Delete extends HttpServlet {
		private static final long serialVersionUID = 1L;
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException{
			String id = request.getParameter("id");
			DAO dao = new DAO();
			int result = dao.delete(id);
			
			HttpSession session = request.getSession();
			session.setAttribute("del_result", result);
			response.sendRedirect("list");
		}
	}

