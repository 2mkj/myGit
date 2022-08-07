package ex8_template2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8088/JSP/templatetest
@WebServlet("/Detail")
public class Detail extends HttpServlet {
		private static final long serialVersionUID = 1L;
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException{
			DAO dao = new DAO();
			Template_join temp = dao.selectInfo(request.getParameter("id"));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ex4/detail.jsp");
			request.setAttribute("temp", temp);
			dispatcher.forward(request, response);
		}
	}

