package mainpage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.Member;
import member.MemberDAO;

public class UpdateProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String realFolder = "";
		
		// webapp아래에 꼭 폴더 생성하세요
		String saveFolder = "memberupload";
		
		int fileSize = 5 * 1024 * 1024; // 업로드할 파일의 최대 사이즈 입니다. 5MB
		
		// 실제 저장 경로를 지정합니다.
		ServletContext sc = request.getServletContext();
		realFolder = sc.getRealPath(saveFolder);
		System.out.println("realFolder=[ " + realFolder);
		
		try {
		MultipartRequest multi = new MultipartRequest (request, realFolder, fileSize, "utf-8",
				new DefaultFileRenamePolicy());
		String id =	multi.getParameter("id");
		String name = multi.getParameter("name");
		String gender = multi.getParameter("gender");
		String memberfile = multi.getFilesystemName("memberfile");
		Member m = new Member();
		m. setGender(gender);
		m.setId(id);       m.setName(name);     m.setMemberfile(memberfile);
		
		 MemberDAO mdao = new MemberDAO();
		 int result = mdao.update(m);
		 
		 response.setContentType("text/html;charset=utf-8");
		 PrintWriter out = response.getWriter();
		 out.println("<script>");
		 //삽입이 된 경우
		 if(result == 1) {
			 out.println("alert('프로필 수정이 완료되었습니다.');");
			 out.println("location.href='myProfile.net';");
		 } else {
			 out.println("alert('프로필 수정 사항이 없습니다');");
			 out.println("history.back()"); //비밀번호를 제외한 다른 데이터는 유지되어있습니다.
		 }
		 out.println("</script>");
		 out.close();
		 return null;
		}catch (IOException ex) {
			ActionForward forward = new ActionForward();
			forward.setPath("error/error.jsp");
			request.setAttribute("message", "프로필 사진 업로드 실패입니다.");
			forward.setRedirect(false);
			return forward;
		}//catch end
	}//execute end

}
