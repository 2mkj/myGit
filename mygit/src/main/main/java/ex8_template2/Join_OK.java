package ex8_template2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/join_ok")
public class Join_OK extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Join_OK() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");

		String pass = request.getParameter("pass");

		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String jumin = jumin1 + "-" + jumin2;

		String email = request.getParameter("email") + "@" + request.getParameter("domain");
		String gender = request.getParameter("gender");
		
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = hobbys[0];
		for (int num = 1; num < hobbys.length; num++) {
			hobby += "," + hobbys[num];
		}

		String post1 = request.getParameter("post1");
		String address = request.getParameter("address");
		String intro = request.getParameter("intro");
		
		Template_join join = new Template_join();
		join.setId(id); join.setPassword(pass);join.setJumin(jumin);join.setEmail(email);
		join.setGender(gender);join.setHobby(hobby);join.setPost(post1);join.setAddress(address);
		join.setIntro(intro);

		DAO dao = new DAO();
		int result=dao.insert(join);
		
		HttpSession session = request.getSession();
		session.setAttribute("join_result", result);
		response.sendRedirect("main");
		
	}

}
