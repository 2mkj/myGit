package ex8_template2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8088/JSP/templatetest
@WebServlet("/logout")
public class Logout extends HttpServlet {
		private static final long serialVersionUID = 1L;
		public Logout() {
			super();
		}
		protected void doGet(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException{
			request.getSession().invalidate();
			
			request.getSession().setAttribute("logout_message", "로그아웃되었습니다.");
			response.sendRedirect("main");
			
		}
	}

