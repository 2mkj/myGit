package ex8_template2;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8088/JSP/templatetest
@WebServlet("/join")
public class Join extends HttpServlet {
		private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException{

			RequestDispatcher dispatcher = request.getRequestDispatcher("/ex4/join.jsp");//View
			dispatcher.forward(request,response);
		}
	}

