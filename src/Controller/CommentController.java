package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import VO.CommentVO;
import VO.LoginVO;
import VO.PostVO;

/**
 * Servlet implementation class CommentController
 */
@WebServlet("/CommentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		System.out.println("flag : "+flag);
		
		if (flag.equals("comment")) {
			comment(request, response);
		}
	}

	private void comment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// TODO Auto-generated method stub
		int postid=Integer.parseInt(request.getParameter("id"));
		String comment=request.getParameter("comment");
		System.out.println("comment description"+ postid);
		PostVO postVO=new PostVO();
		postVO.setPostId(postid);
		
		int s5 = (int)request.getSession().getAttribute("loginID");
		LoginVO loginVO=new LoginVO();
		loginVO.setLoginId(s5);
		
		CommentVO commentVO=new CommentVO();
		commentVO.setCommentDesc(comment);
		commentVO.setPostVO(postVO);
		commentVO.setLoginVO(loginVO);
		
		CommentDAO commentDAO=new CommentDAO();
		commentDAO.insert(commentVO);
		List ls=commentDAO.search();
		
		request.getSession().setAttribute("comments",ls);
		
		response.sendRedirect("user/comment.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
