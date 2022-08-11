package net.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.MemberDAO2;


public class MemberEmailCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO2 dao = new MemberDAO2();
		int result = dao.isId(request.getParameter("email"));
		response.getWriter().append(Integer.toString(result));
		System.out.println(result);
		return null;
	}

}
