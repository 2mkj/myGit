package net.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.MemberDAO2;

public class MemberIdpwOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDAO2 mdao = new MemberDAO2();
		String result = mdao.isIDPW(name, phone);
		System.out.println("결과는 " + result);
		
	
		return null;
	}
}
