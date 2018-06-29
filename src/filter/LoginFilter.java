package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import DAO.CountryDAO;
import DAO.FileDAO;
import DAO.LoginDAO;
import VO.CountryVO;
import VO.FileVO;
import VO.LoginVO;

@WebFilter("/*")
public class LoginFilter implements Filter {

	public LoginFilter() {
	}

	public void destroy() {
	}	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession hs =((HttpServletRequest) request).getSession();
		RequestDispatcher requestDispatcher;
		String flag = request.getParameter("flag");
		//System.out.println("Filter :: Flag :: "+flag);

		String uri = ((HttpServletRequest)request).getRequestURI();
		//System.out.println("Before :::: "+ uri);
		if(uri.contains("loadstate.jsp") ||uri.contains("PostController") ||uri.contains("loadArea.jsp") ||uri.contains("loadcity.jsp") ||uri.contains("register") || uri.contains("/css") || uri.contains("/js") && !uri.contains("jsp") || uri.contains("/img")|| uri.contains("/fonts") ||uri.contains("/register.jsp") || uri.contains("RegisterController") )
		{
		//	System.err.println("URI passed :: "+uri);
			
			/*CountryDAO cdao=new CountryDAO();
			CountryVO cvo=new CountryVO();
			
			List ls= cdao.search(cvo);
			
			HttpSession hs1=((HttpServletRequest) request).getSession();
			hs1.setAttribute("List",ls);
			requestDispatcher = request.getRequestDispatcher("/user/register.jsp");  
			requestDispatcher.forward(request,response);
*/
			chain.doFilter(request,response);

		}
		else if(flag!=null && flag.equals("login"))
		{
			//System.out.println("2");
			List list= new ArrayList();
			List ls1= new ArrayList();
			String s1=request.getParameter("userName");
			String s2=request.getParameter("password");
			//System.out.println("unPwd :: "+s1+"/"+s2);

			LoginVO loginVO=new LoginVO();
			loginVO.setUserName(s1);
			loginVO.setPassword(s2);

			LoginDAO loginDAO=new LoginDAO();
			list=loginDAO.authentication(loginVO);

			if(list != null && list.size()>=1){
				LoginVO user=(LoginVO)list.get(0);
				int id= user.getLoginId();
				
				hs.setAttribute("loginID", id);

				String uType=user.getUserType();
				hs.setAttribute("userType", uType);
				hs.setAttribute("userName", s1);
					
				if(uType.equalsIgnoreCase("admin"))
				{
					requestDispatcher = request.getRequestDispatcher("/admin/index.jsp");  
					requestDispatcher.forward(request,response);
				}
				else if(uType.equalsIgnoreCase("user"))
				{
					//it's for country dropdown in post
					CountryDAO cdao=new CountryDAO();
					CountryVO cvo=new CountryVO();
					
					List ls= cdao.search(cvo);
					
					HttpSession hs1=((HttpServletRequest) request).getSession();
					hs1.setAttribute("List1",ls);
					
					//for photos
					
				/*	FileDAO fileDAO=new FileDAO();
					FileVO fileVO=new FileVO();
					ls1=fileDAO.search(fileVO);
					hs1.setAttribute("List",ls1);*/
					
					
					
					requestDispatcher=request.getRequestDispatcher("/user/index.jsp");
					requestDispatcher.forward(request, response);
				}
				else
				{
					
					requestDispatcher=request.getRequestDispatcher("/user/login.jsp");
					requestDispatcher.forward(request, response);
				}
			}
			else{
				requestDispatcher=request.getRequestDispatcher("/user/login.jsp");
				requestDispatcher.forward(request, response);
			}
		}



		else if(flag!=null && flag.equals("logout"))
		{
			//System.out.println("3");
			hs.invalidate();
			requestDispatcher = request.getRequestDispatcher("/user/login.jsp");
			requestDispatcher.forward(request, response);
		}

		else if(hs.getAttribute("loginID") != null)
		{
			//System.out.println("4");
			String h = (String)hs.getAttribute("userType");

			//System.out.println("lId :: "+hs.getAttribute("loginID")+" // usertype :: "+h);

			if(h!=null && h.equals("admin")){

				//System.out.println("admin>>");
				chain.doFilter(request,response);
			}

			else if(h!=null && h.equals("user"))
			{
				//System.out.println("chain");
				chain.doFilter(request, response);
			}
			else
			{
				requestDispatcher= request.getRequestDispatcher("/user/error.jsp");  
				requestDispatcher.forward(request,response);
			}
		}
		else
		{
			requestDispatcher=request.getRequestDispatcher("/user/login.jsp");
			requestDispatcher.forward(request,response);
		}
		//	chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
