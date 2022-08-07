package ex8_template2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/myProfile")
public class Update_form extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if (id != null && !id.equals("")) {
			DAO dao = new DAO();
			Template_join temp = dao.selectInfo(id);
			RequestDispatcher dispatcher =
					request.getRequestDispatcher("/ex4/myProfile.jsp");
			request.setAttribute("temp", temp);
			dispatcher.forward (request, response);	
		}else {
				session.invalidate();
				response.sendRedirect("login"); 
			}
}}
