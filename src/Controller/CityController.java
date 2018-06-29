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

import DAO.CountryDAO;
import DAO.StateDAO;
import VO.CityVO;
import VO.CountryVO;
import VO.StateVO;

import DAO.CityDAO;

/**
 * Servlet implementation class CityController
 */
@WebServlet("/CityController")
public class CityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		if(flag.equals("LoadCountry"))
		{
			LoadCountry(request,response);
		}
		else if(flag.equals("loadState"))
		{
			loadState(request,response);
		}
		else if(flag.equals("reg"))
		{
				insert(request,response);
		}
		else if(flag.equals("search"))
		{
			search(request,response);
		}
		else if(flag.equals("delete"))
		{
			delete(request,response);
		}
		else if(flag.equals("edit"))
		{
			edit(request,response);
		}
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List ls1= new ArrayList();
		CityVO cityVO=new CityVO();
		
		cityVO.setCityid(Integer.parseInt(request.getParameter("id")));
		CityDAO cityDAO=new CityDAO();
		ls1=cityDAO.edit(cityVO);
		//CityVO list=(CityVO)ls1.get(0);
		
		HttpSession hs=request.getSession();
		hs.setAttribute("editlist", ls1);
		
		CountryDAO cdao=new CountryDAO();
		CountryVO cvo=new CountryVO();
		
		List ls = cdao.search(cvo);
		
		
		hs.setAttribute("List",ls);
		StateVO stateVO=new StateVO();
		StateDAO stateDAO=new StateDAO();
		List ls2=stateDAO.Search(stateVO);
		
		hs.setAttribute("stateedit", ls2);
		
		
		
		
		response.sendRedirect("admin/editCity.jsp");
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List ls=new ArrayList();
		CityVO cityVO=new CityVO();
		cityVO.setCityid(Integer.parseInt(request.getParameter("id")));
		CityDAO cityDAO=new CityDAO();
		cityDAO.delete(cityVO);
		ls=cityDAO.search(cityVO);
		HttpSession hs=request.getSession();
		hs.setAttribute("list", ls);
		response.sendRedirect("admin/searchCity.jsp");
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List ls= new ArrayList();
		CityVO cityVO=new CityVO();
		CityDAO cityDAO=new CityDAO();
		ls=cityDAO.search(cityVO);
		HttpSession hs=request.getSession();
		hs.setAttribute("list", ls);
		response.sendRedirect("admin/searchCity.jsp");
		
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("inside insert method");
		int cid = Integer.parseInt(request.getParameter("countryId"));
		int sid = Integer.parseInt(request.getParameter("stateselect"));
		String s1 = request.getParameter("cityName");
		String s2 = request.getParameter("cityDesc");
		CountryVO countryVO=new CountryVO();
		countryVO.setCid(cid);
		
		StateVO stateVO=new StateVO();
		stateVO.setSid(sid);
		
		CityVO cityVO=new CityVO();
		cityVO.setCountryVO(countryVO);
		cityVO.setStateVO(stateVO);
		cityVO.setCityname(s1);
		cityVO.setCitydesc(s2);
		
		CityDAO cityDAO=new CityDAO();
		cityDAO.insert(cityVO);
		response.sendRedirect("admin/addCity.jsp");
	}

	private void loadState(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int countryId= Integer.parseInt(request.getParameter("countryId"));
		
		System.out.println("cID :"+countryId);
		
		CountryVO countryVO=new CountryVO();
		countryVO.setCid(countryId);
		
		CityDAO cityDAO=new CityDAO();
		List list = cityDAO.loadState(countryVO);
		
		System.out.println("stateList size : "+list.size());
		
		HttpSession s=request.getSession();
		s.setAttribute("stateList",list);
		response.sendRedirect("admin/JSON/loadstate.jsp");
			
	}

	private void LoadCountry(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		

List ls=new ArrayList();
		
		CountryDAO cdao=new CountryDAO();
		CountryVO cvo=new CountryVO();
		
		 ls = cdao.search(cvo);
		
		HttpSession hs=request.getSession();
		hs.setAttribute("list",ls);
		//json file below
		response.sendRedirect("admin/addCity.jsp");
		 
			
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
	

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		
		
		System.out.println("...............");
		int id=Integer.parseInt(request.getParameter("id"));
		//System.out.println("..............."+id);
		int s2 =Integer.parseInt(request.getParameter("countryId")); 
		int s1 =Integer.parseInt(request.getParameter("stateselect"));
		
		String s3= request.getParameter("cityName");
		String s4= request.getParameter("cityDesc");
		System.out.println("............");
		
		
		
		CountryVO countryVO=new CountryVO();
		countryVO.setCid(s2);
		StateVO stateVO=new StateVO();
		stateVO.setSid(s1);
		
		CityVO cityVO=new CityVO();
		cityVO.setCityid(id);
		cityVO.setCityname(s3);
		cityVO.setCitydesc(s4);
		cityVO.setCountryVO(countryVO);
		cityVO.setStateVO(stateVO);
		
        CityDAO cityDAO=new CityDAO();
        
		cityDAO.update(cityVO);
		
		search(request,response);
		
		
	}

}
