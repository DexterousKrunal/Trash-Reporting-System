package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CityDAO;
import DAO.CountryDAO;
import VO.CityVO;
import VO.CountryVO;

/**
 * Servlet implementation class countryController
 */
@WebServlet("/CountryController")
public class CountryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountryController() {
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
		
		if (flag.equals("reg")) {
			insert(request, response);
		}
		else if(flag.equals("search"))
		{
			search(request,response);
		}
		else if(flag.equals("edit"))
		{
			edit(request,response);
		}
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List ls1= new ArrayList();
		int s1= Integer.parseInt(request.getParameter("id"));
		CountryVO countryVO= new CountryVO();
		countryVO.setCid(s1);
		CountryDAO countryDAO= new CountryDAO();
		ls1 = countryDAO.edit(countryVO);
		HttpSession hs1= request.getSession();
		hs1.setAttribute("editlist",ls1);
		
		response.sendRedirect("admin/editCountry.jsp");
		
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String s1 = request.getParameter("cName");
		String s2 = request.getParameter("cDesc");
		CountryVO cvo = new CountryVO();
		cvo.setCn(s1);
		cvo.setCd(s2);
		
		CountryDAO cdao = new CountryDAO();
		cdao.insert(cvo);
        response.sendRedirect("admin/addCountry.jsp");	
	}
	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
	
		System.out.println("inside search :: controller");
		
		CountryDAO cdao=new CountryDAO();
		CountryVO cvo=new CountryVO();
		
		List ls= cdao.search(cvo);
		
		HttpSession hs=request.getSession();
		hs.setAttribute("List",ls);
		
		response.sendRedirect("admin/searchCountry.jsp");
	
	}



	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag=request.getParameter("flag");
		if(flag.equals("update"))
		{
			update(request,response);
		}
		

}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int s1=Integer.parseInt(request.getParameter("id"));
		String s2=request.getParameter("cName");
		String s3=request.getParameter("cDesc");
		CountryVO countryVO=new CountryVO();
		countryVO.setCid(s1);
		countryVO.setCn(s2);
		countryVO.setCd(s3);
		
		CountryDAO countryDAO=new CountryDAO();
		countryDAO.update(countryVO);
		search(request,response);
	}
}
