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

import DAO.AreaDAO;
import DAO.CityDAO;
import DAO.CountryDAO;
import DAO.StateDAO;
import VO.AreaVO;
import VO.CityVO;
import VO.CountryVO;
import VO.StateVO;

/**
 * Servlet implementation class AreaController
 */
@WebServlet("/AreaController")
public class AreaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AreaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag=request.getParameter("flag");
		if(flag.equals("LoadCountry"))
		{
			LoadCountry(request,response);
		}
		else if(flag.equals("loadState"))
		{
			loadState(request,response);
		}
		else if(flag.equals("loadCity"))
		{
			loadCity(request,response);
		}
		else if(flag.equals("reg"))
		{
			insert(request,response);
		}
		else if(flag.equals("search"))
		{
			search(request,response);
		}
		else if(flag.equals("edit"))
		{
			edit(request,response);
		}
		else if(flag.equals("delete"))
		{
			delete(request,response);
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List ls=new ArrayList();
		int s1= Integer.parseInt(request.getParameter("id"));
		AreaVO areaVO=new AreaVO();
		areaVO.setAreaId(s1);
		AreaDAO areaDAO=new AreaDAO();
		areaDAO.delete(areaVO);
		ls=areaDAO.search(areaVO);
		HttpSession hs=request.getSession();
		hs.setAttribute("list", ls);
		response.sendRedirect("admin/searchArea.jsp");
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List ls1= new ArrayList();
		List ls2= new ArrayList();
		List ls3= new ArrayList();
		List ls4= new ArrayList();
		
		int s1= Integer.parseInt(request.getParameter("id"));
		AreaVO areaVO=new AreaVO();
		areaVO.setAreaId(s1);
		AreaDAO areaDAO=new AreaDAO();
		ls1 = areaDAO.edit(areaVO);
		HttpSession hs1=request.getSession();
		hs1.setAttribute("editlist",ls1);
		
		CountryVO countryVO=new CountryVO();
		CountryDAO countryDAO=new CountryDAO();
		ls2= countryDAO.search(countryVO);
		HttpSession hs2=request.getSession();
		hs2.setAttribute("countrylist",ls2);
		
		StateVO stateVO=new StateVO();
		StateDAO stateDAO=new StateDAO();
		ls3= stateDAO.Search(stateVO);
		HttpSession hs3=request.getSession();
		hs3.setAttribute("statelist",ls3);
		
		CityVO cityVO= new CityVO();
		CityDAO cityDAO= new CityDAO();
		ls4=cityDAO.search(cityVO);
		HttpSession hs4=request.getSession();
		hs4.setAttribute("citylist",ls4);
		
		response.sendRedirect("admin/editArea.jsp");
		
}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List list=new ArrayList();
		AreaVO areaVO=new AreaVO();
		AreaDAO areaDAO=new AreaDAO();
		list=areaDAO.search(areaVO);
		HttpSession hs=request.getSession();
		hs.setAttribute("list",list);
		response.sendRedirect("admin/searchArea.jsp");
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Ato-generated method stub
		int s1=Integer.parseInt(request.getParameter("countryId"));
		int s2=Integer.parseInt(request.getParameter("stateselect"));
		int s3=Integer.parseInt(request.getParameter("cityselect"));
		String s4=request.getParameter("areaId");
		String s5=request.getParameter("areaDesc");
		CountryVO countryVO=new CountryVO();
		countryVO.setCid(s1);
		StateVO stateVO=new StateVO();
		stateVO.setSid(s2);
		CityVO cityVO=new CityVO();
		cityVO.setCityid(s3);
		AreaVO areaVO=new AreaVO();
		areaVO.setCityVO(cityVO);
		areaVO.setCountryVO(countryVO);
		areaVO.setStateVO(stateVO);
		areaVO.setAreaName(s4);
		areaVO.setAreaDesc(s5);
		
		AreaDAO areaDAO=new AreaDAO();
		areaDAO.insert(areaVO);
		
		response.sendRedirect("admin/addArea.jsp");
		
	}

	private void loadCity(HttpServletRequest request, HttpServletResponse response)throws IOException {
		// TODO Auto-generated method stub
		List list= new ArrayList();
		int stateId = Integer.parseInt(request.getParameter("stateId"));
		
		System.out.println("sID:::::::: :"+stateId);
		StateVO stateVO = new StateVO();
		stateVO.setSid(stateId);
		
		AreaDAO areaDAO= new AreaDAO();
		 list = areaDAO.loadCity(stateVO);
		
		System.out.println("cityList size : "+list.size());
		
		HttpSession s=request.getSession();
		s.setAttribute("cityList",list);
		response.sendRedirect("admin/JSON/loadcity.jsp");
		
		
	}

	private void loadState(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int countryId= Integer.parseInt(request.getParameter("countryId"));
		
		System.out.println("cID :"+countryId);
		
		CountryVO countryVO=new CountryVO();
		countryVO.setCid(countryId);
		
		AreaDAO areaDAO= new AreaDAO();
		List list = areaDAO.loadState(countryVO);
		
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
		response.sendRedirect("admin/addArea.jsp");
		 

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
		int s1=Integer.parseInt(request.getParameter("countryId"));
		int s2=Integer.parseInt(request.getParameter("stateselect"));
		int s3=Integer.parseInt(request.getParameter("cityselect"));
		int s4=Integer.parseInt(request.getParameter("id"));
		String s5=request.getParameter("areaId");
		String s6=request.getParameter("areaDesc");
		
		CountryVO countryVO= new CountryVO();
		countryVO.setCid(s1);
		StateVO stateVO= new StateVO();
		stateVO.setSid(s2);
		CityVO cityVO=new CityVO();
		cityVO.setCityid(s3);
		AreaVO areaVO=new AreaVO();
		areaVO.setCountryVO(countryVO);
		areaVO.setStateVO(stateVO);
		areaVO.setCityVO(cityVO);
		areaVO.setAreaId(s4);
		areaVO.setAreaName(s5);
		areaVO.setAreaDesc(s6);
		
		AreaDAO areaDAO=new AreaDAO();
		areaDAO.update(areaVO);
		search(request,response);
		
		
		
		
	}

}
