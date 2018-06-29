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
import DAO.FileDAO;
import DAO.PostDAO;
import VO.AreaVO;
import VO.CityVO;
import VO.CountryVO;
import VO.FileVO;
import VO.LoginVO;
import VO.PostVO;
import VO.StateVO;

import java.awt.FileDialog;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class postController
 */
@WebServlet("/PostController")
@MultipartConfig
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String flag = request.getParameter("flag");
		System.out.println("flag : " + flag);

		if (flag.equals("loadCountry")) {
			loadCountry(request, response);
		} else if (flag.equals("countinc")) {
			countfun(request, response);
		} else if (flag.equals("loadState")) {
			loadState(request, response);
		} else if (flag.equals("loadCity")) {
			loadCity(request, response);
		} else if (flag.equals("loadArea")) {
			loadArea(request, response);
		} else if (flag.equals("search")) {
			search(request, response);
		}
	}

	

	private void countfun(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List<PostVO> ls = new ArrayList();
		List ls1 = new ArrayList();
		int a = Integer.parseInt(request.getParameter("id"));
		PostVO postVO = new PostVO();
		postVO.setPostId(a);
		PostDAO postDAO = new PostDAO();
		ls = postDAO.increment(postVO);
		int p1 = ls.get(0).getAreaVO().getAreaId();
		AreaVO areaVO = new AreaVO();
		areaVO.setAreaId(p1);
		postVO.setAreaVO(areaVO);
		int p2 = ls.get(0).getCityVO().getCityid();
		CityVO cityVO = new CityVO();
		cityVO.setCityid(p2);
		postVO.setCityVO(cityVO);
		int p3 = ls.get(0).getStateVO().getSid();
		StateVO stateVO = new StateVO();
		stateVO.setSid(p3);
		postVO.setStateVO(stateVO);
		int p4 = ls.get(0).getCountryVO().getCid();
		CountryVO countryVO = new CountryVO();
		countryVO.setCid(p4);
		postVO.setCountryVO(countryVO);

		String p5 = ls.get(0).getDesc();
		postVO.setDesc(p5);

		int p6 = ls.get(0).getLoginVO().getLoginId();
		LoginVO loginVO = new LoginVO();
		loginVO.setLoginId(p6);
		postVO.setLoginVO(loginVO);

		int p8 = ls.get(0).getCount();
		p8 = p8 + 1;
		postVO.setCount(p8);

		postDAO.update(postVO);

		ls1 = postDAO.increment(postVO);
		HttpSession hs = request.getSession();
		hs.setAttribute("postList", ls1);
		System.out.print(ls1);
		response.sendRedirect("admin/JSON/loadCounter.jsp");
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("inside search");
		List ls = new ArrayList();
		HttpSession hs = request.getSession();
		FileVO fileVO = new FileVO();
		int s5 = (int) hs.getAttribute("postId");
		System.out.println("post id::::::::::::::" + s5);
		PostVO postVO = new PostVO();
		postVO.setPostId(s5);
		/* fileVO.setPostVO(postVO); */
		FileDAO fileDAO = new FileDAO();
		ls = fileDAO.search(fileVO);
		System.out.println("search :::::::::::size" + ls.size());

		hs.setAttribute("list", ls);
		response.sendRedirect("user/index.jsp");

	}

	private void loadArea(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		int cityId = Integer.parseInt(request.getParameter("cityId"));

		System.out.println("cityID:::::::: :" + cityId);
		CityVO cityVO = new CityVO();
		cityVO.setCityid(cityId);

		AreaDAO areaDAO = new AreaDAO();
		list = areaDAO.loadArea(cityVO);

		HttpSession s = request.getSession();
		s.setAttribute("areaList", list);
		response.sendRedirect("admin/JSON/loadArea.jsp");

	}

	private void loadCity(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		int stateId = Integer.parseInt(request.getParameter("stateId"));

		System.out.println("sID:::::::: :" + stateId);
		StateVO stateVO = new StateVO();
		stateVO.setSid(stateId);

		AreaDAO areaDAO = new AreaDAO();
		list = areaDAO.loadCity(stateVO);

		System.out.println("cityList size : " + list.size());

		HttpSession s = request.getSession();
		s.setAttribute("cityList", list);
		response.sendRedirect("admin/JSON/loadcity.jsp");

	}

	private void loadState(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// TODO Auto-generated method stub
		int countryId = Integer.parseInt(request.getParameter("countryId"));

		System.out.println("cID :" + countryId);

		CountryVO countryVO = new CountryVO();
		countryVO.setCid(countryId);

		AreaDAO areaDAO = new AreaDAO();
		List list = areaDAO.loadState(countryVO);

		System.out.println("stateList size : " + list.size());

		HttpSession s = request.getSession();
		s.setAttribute("stateList", list);
		response.sendRedirect("admin/JSON/loadstate.jsp");

	}

	private void loadCountry(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub

		CountryDAO cdao = new CountryDAO();
		CountryVO cvo = new CountryVO();

		List ls = cdao.search(cvo);

		HttpSession hs = request.getSession();
		hs.setAttribute("list", ls);

		response.sendRedirect("user/index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		System.out.println("flag : " + flag);

		if (flag.equals("insert")) {
			insert(request, response);
		}

		for (Part filePart : request.getParts()) {
			if (filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().equals("")) {
				Part filePart1 = request.getPart("fileName"); // Retrieves
																// <input
																// type="file"
																// name="file">
				String fileName = filePart1.getSubmittedFileName();
				InputStream fileContent = filePart1.getInputStream();
				// ... (do your job here)

				System.out.println("filePart :: " + filePart1);
				System.out.println("file Name :: " + fileName);

				System.out.println("File Content :: " + fileContent);

				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);

				String filePath = getServletContext().getRealPath(request.getServletPath());

				int path = filePath.lastIndexOf('\\');
				String path1 = filePath.substring(0, path) + "\\doc\\";

				/*
				 * File targetFile = new File(path1+fileName); OutputStream
				 * outStream = new FileOutputStream(targetFile);
				 * outStream.write(buffer);
				 */
				String encryptFileName = encryptFileName(fileName);
				File targetEncryptFile = new File(path1 + encryptFileName);
				OutputStream outStream1 = new FileOutputStream(targetEncryptFile);
				outStream1.write(buffer);

				System.out.println("File Output Path :: " + path1 + fileName);

				outStream1.close();

				FileVO fileVO = new FileVO();
				fileVO.setFileName(fileName);
				fileVO.setFencName(encryptFileName);
				fileVO.setFilePath(filePath);
				HttpSession hs = request.getSession();
				int s6 = (int) hs.getAttribute("postId");
				int s7 = (int) hs.getAttribute("areaId");
				PostVO postVO = new PostVO();
				postVO.setPostId(s6);

				fileVO.setPostVO(postVO);
				AreaVO areaVO = new AreaVO();
				areaVO.setAreaId(s7);

				fileVO.setAreaVO(areaVO);

				FileDAO fileDAO = new FileDAO();
				fileDAO.insert(fileVO);

				response.sendRedirect("user/index.jsp");

			}
		}

		
	}

	

	private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		// TODO Auto-generated method stub

		HttpSession hs = request.getSession();

		int s1 = Integer.parseInt(request.getParameter("countryName"));
		int s2 = Integer.parseInt(request.getParameter("stateName"));
		int s3 = Integer.parseInt(request.getParameter("cityName"));
		int s4 = Integer.parseInt(request.getParameter("areaName"));
		int s5 = (int) hs.getAttribute("loginID");
		String s6 = request.getParameter("desc");
		System.out.println("id..." + s5);

		CountryVO countryVO = new CountryVO();
		countryVO.setCid(s1);
		StateVO stateVO = new StateVO();
		stateVO.setSid(s2);
		CityVO cityVO = new CityVO();
		cityVO.setCityid(s3);
		AreaVO areaVO = new AreaVO();
		areaVO.setAreaId(s4);
		LoginVO loginVO = new LoginVO();
		loginVO.setLoginId(s5);

		PostVO postVO = new PostVO();
		postVO.setCountryVO(countryVO);
		postVO.setStateVO(stateVO);
		postVO.setAreaVO(areaVO);
		postVO.setCityVO(cityVO);
		postVO.setLoginVO(loginVO);
		postVO.setDesc(s6);
		postVO.setCount(0);

		PostDAO postDAO = new PostDAO();
		postDAO.insert(postVO);

		int a1 = postVO.getPostId();
		hs.setAttribute("postId", a1);
		hs.setAttribute("areaId", s4);

		System.out.println("Post Id :: " + a1);
	}

	private String encryptFileName(String fileName) {

		Random r = new Random();
		String file[] = fileName.split("\\.");

		byte[] unencodedFile = file[0].getBytes();
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
		}
		md.reset();
		md.update(unencodedFile);
		byte[] encodedFile = md.digest();
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < encodedFile.length; i++) {
			if (((int) encodedFile[i] & 0xff) < 0x10) {
				buf.append("0");
			}
			buf.append(Long.toString((int) encodedFile[i] & 0xff, 16));
		}

		String encryptedFileName = (buf.toString()).concat(String.valueOf(r.nextInt()));

		return encryptedFileName + "." + file[file.length - 1];
	}

}
