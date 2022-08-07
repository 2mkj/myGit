package ex8_template2;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8088/Movieit/main
@WebServlet("/main")
public class MainServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException{
			String go = request.getParameter("page");
			if(go==null) {
				go="newitem";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ex4/main.jsp");//View
			request.setAttribute("pagefile", go);
			dispatcher.forward(request,response);
		}
	}

