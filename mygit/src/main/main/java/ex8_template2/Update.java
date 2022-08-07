package ex8_template2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");

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
		System.out.println("�����ȣ : " + post1);
		String address = request.getParameter("address");
		String intro = request.getParameter("intro");
		
		Template_join join = new Template_join();
		join.setId(id); join.setPassword(pass);join.setJumin(jumin);join.setEmail(email);
		join.setGender(gender);join.setHobby(hobby);join.setPost(post1);join.setAddress(address);
		join.setIntro(intro);

		DAO dao = new DAO();
		int result = dao.update(join);
		String message="ȸ�� ���� ���� �����Դϴ�.";
		if(result == 1)
			message="ȸ�� ���� ���� �Ϸ��߽��ϴ�.";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ex4/templatetest.jsp");
		request.setAttribute("message", message);
		request.setAttribute("pagefile", "newitem");
		dispatcher.forward(request, response);
	}

}
