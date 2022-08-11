package co.comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.comment.db.Comment;
import co.comment.db.CommentDAO;
import co.community.ActionForward;

public class CommentReply implements co.community.Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommentDAO dao = new CommentDAO();
		Comment co = new Comment();
		
		co.setId(request.getParameter("id"));
	    co.setContent(request.getParameter("content"));
	    co.setComment_re_lev(Integer.parseInt(request.getParameter("comment_re_lev")));
	    co.setComment_board_num(Integer.parseInt(request.getParameter("comment_board_num")));
	    co.setComment_re_seq(Integer.parseInt(request.getParameter("comment_re_seq")));
	    co.setComment_re_ref(Integer.parseInt(request.getParameter("comment_re_ref")));
	    int ok = dao.commentsReply(co);
	    response.getWriter().print(ok);
		return null;
	}

}