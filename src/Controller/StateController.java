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
import javax.websocket.Session;

import DAO.CountryDAO;
import DAO.StateDAO;
import VO.AreaVO;
import VO.CountryVO;
import VO.StateVO;

/**
 * Servlet implementation class StateController
 */
@WebServlet("/StateController")
public class StateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String flag=request.getParameter("flag");
		if(flag.equals("reg"))
		{
			insert(request,response);
		}
		else if(flag.equals("LoadCountry"))
		{
			loadCountry(request,response);
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
		List ls2= new ArrayList();
		int s1= Integer.parseInt(request.getParameter("id"));
		StateVO stateVO= new StateVO();
		stateVO.setSid(s1);
		StateDAO stateDAO= new StateDAO();
		ls1 = stateDAO.edit(stateVO);
		HttpSession hs1= request.getSession();
		hs1.setAttribute("editlist", ls1);
		
		CountryVO countryVO=new CountryVO();
		CountryDAO countryDAO= new CountryDAO();
		ls2 = countryDAO.search(countryVO);
		HttpSession hs2= request.getSession();
		hs2.setAttribute("countrylist", ls2);
		
		response.sendRedirect("admin/editState.jsp");
		
		
		
		
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List ls=new ArrayList();
		StateDAO sdao=new StateDAO();
		StateVO svo=new StateVO();
		
		ls=sdao.Search(svo);
		HttpSession hs=request.getSession();
		hs.setAttribute("List",ls);
		response.sendRedirect("admin/searchState.jsp");
		
		
	}

	private void loadCountry(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
        System.out.println("inside loadcountry :: controller");
		
		CountryDAO cdao=new CountryDAO();
		CountryVO cvo=new CountryVO();
		
		List ls = cdao.search(cvo);
		
		HttpSession hs=request.getSession();
		hs.setAttribute("List",ls);
		
		response.sendRedirect("admin/addState.jsp");
	
	 
		
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		int cid = Integer.parseInt(request.getParameter("countryId"));
		String s1 = request.getParameter("sName");
		String s2 = request.getParameter("sDesc");
		
		CountryVO countryVO = new CountryVO();
		countryVO.setCid(cid);
		
		StateVO svo = new StateVO();
		svo.setSn(s1);
		svo.setSd(s2);
		svo.setCountryVO(countryVO);
		
		StateDAO sdao = new StateDAO();
		sdao.insert(svo);
		
        response.sendRedirect("admin/addState.jsp");



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		if(flag.equals("update"))
		{
			update(request,response);
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response)throws IOException {
		// TODO Auto-generated method stub
		int s1= Integer.parseInt(request.getParameter("countryId"));
		int s2= Integer.parseInt(request.getParameter("id"));
		String s3=request.getParameter("sName");
		String s4=request.getParameter("sDesc");
		
		CountryVO countryVO= new CountryVO();
		countryVO.setCid(s1);
		StateVO stateVO=new StateVO();
		stateVO.setCountryVO(countryVO);
		stateVO.setSid(s2);
		stateVO.setSn(s3);
		stateVO.setSd(s4);
		
		StateDAO stateDAO=new StateDAO();
		stateDAO.update(stateVO);
		
		search(request,response);
		
	}

}
