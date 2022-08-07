package ex8_template2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//http://localhost:8088/JSP/templatetest
@WebServlet("/login_ok")
public class Login_Ok extends HttpServlet {
		private static final long serialVersionUID = 1L;
		protected void doPost(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException{
			
			String id = request.getParameter("id");
			String password = request.getParameter("passwd");
			
			DAO dao = new DAO();
			int result = dao.isId(id, password);
			
			HttpSession session = request.getSession();
			if(result==1) {
				session.setAttribute("id", id);
				String message = id;
				
				String IDStore = request.getParameter("remember");
				Cookie cookie = new Cookie("id", request.getParameter("id"));
				//ID ����ϱ⸦ üũ�� ���
				if(IDStore != null && IDStore.equals("store")) {
					//cookie.setMaxAge(60 * 60 *24);//��Ű�� ��ȿ�ð��� 24�ð����� �����մϴ�.
					cookie.setMaxAge(2*60);
					//Ŭ���̾�Ʈ�� ��Ű���� �����մϴ�.
					response.addCookie(cookie);
				}else {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				String goPage = "/ex4/main.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(goPage);//View
				request.setAttribute("pagefile", "newitem" );
				request.setAttribute("message", message);
				dispatcher.forward(request,response);
			}else {
				session.setAttribute("login_result", result);
				response.sendRedirect("login");
			}
			
			
			
		}
	}

