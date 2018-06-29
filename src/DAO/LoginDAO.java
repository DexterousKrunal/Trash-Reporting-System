package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import VO.CountryVO;
import VO.LoginVO;
import VO.RegisterVO;

public class LoginDAO {
	
	public List search(LoginVO loginVO)
	{
		List ls=new ArrayList();
		try{
			SessionFactory sessionFactory= new Configuration().configure().buildSessionFactory();
			Session session= sessionFactory.openSession();
			Query q = session.createQuery("from LoginVO");
			ls = q.list();
			
			System.out.println("list size ::dao : "+ls.size());
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
				
		}
		return ls;
			
		}

	public void insert(LoginVO loginVO) {
		// TODO Auto-generated method stub
		
			
			try{	
				SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

				Session session = sessionFactory.openSession();

				Transaction tr = session.beginTransaction();
				
				session.save(loginVO);
				tr.commit();

				
			}catch(Exception e)
			{
				e.printStackTrace();
			}
				
			}

	public List authentication(LoginVO loginVO) {
		// TODO Auto-generated method stub
		List ls=null;
		try{
			
			Session session = null;
			SessionFactory sessionfactory = new Configuration().configure()
					.buildSessionFactory();
			session = sessionfactory.openSession();
		
			
			Query  q =  session.createQuery("from LoginVO where userName='"+loginVO.getUserName()+"' and password='"+loginVO.getPassword()+"' "); 
			
			
			ls =  q.list();
			System.out.println(ls.size());
			System.out.println("Done");
		} catch (Exception e) 
		{
			e.printStackTrace();

		}
		return ls;
	}
	}
	


