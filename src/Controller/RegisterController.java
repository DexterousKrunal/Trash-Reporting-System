package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LoginDAO;
import DAO.RegisterDAO;
import VO.AreaVO;
import VO.CityVO;
import VO.CountryVO;
import VO.LoginVO;
import VO.RegisterVO;
import VO.StateVO;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
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
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String s1 = request.getParameter("firstName");
		System.out.println(s1);
		String s2 = request.getParameter("lastName");
		int s8=Integer.parseInt(request.getParameter("countryName"));
		int s9=Integer.parseInt(request.getParameter("stateName"));
		int s10=Integer.parseInt(request.getParameter("cityName"));
		int s11=Integer.parseInt(request.getParameter("areaName"));
		String s3 = request.getParameter("address");
		String s4 = request.getParameter("gender");
		String s5 = request.getParameter("emailId");
		String s6 = request.getParameter("userName");
		String s7 = request.getParameter("password");
		
		LoginVO loginVO=new LoginVO();
		loginVO.setUserName(s6);
		loginVO.setPassword(s7);
		loginVO.setUserType("user");
		
		
		LoginDAO loginDAO=new LoginDAO();
	
		
		RegisterVO registerVO=new RegisterVO();
		registerVO.setFirstName(s1);
		registerVO.setLastName(s2);
		registerVO.setAddress(s3);
		registerVO.setGender(s4);
		registerVO.setEmailId(s5);
		registerVO.setUserName(s6);
		registerVO.setPassword(s7);
		
		CountryVO countryVO=new CountryVO();
		countryVO.setCid(s8);
		
		StateVO stateVO=new StateVO();
		stateVO.setSid(s9);
		
		CityVO cityVO=new CityVO();
		cityVO.setCityid(s10);
		
		AreaVO areaVO=new AreaVO();
		areaVO.setAreaId(s11);
		
		registerVO.setCountryVO(countryVO);
		registerVO.setStateVO(stateVO);
		registerVO.setCityVO(cityVO);
		registerVO.setAreaVO(areaVO);
		RegisterDAO registerDAO= new RegisterDAO();
		registerDAO.insert(registerVO);
		int p1=registerVO.getRegisterId();
		registerVO.setRegisterId(p1);
		
		loginVO.setRegisterVO(registerVO);
		loginDAO.insert(loginVO);
		
		
		response.sendRedirect("user/register.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
