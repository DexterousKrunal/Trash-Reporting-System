package DAO;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import VO.CityVO;
import VO.CountryVO;

public class CityDAO implements Serializable {

	public List loadState(CountryVO countryVO) {
		List list = new ArrayList();
		try {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Query query = session.createQuery("from StateVO as s where s.countryVO='"+countryVO.getCid()+"'");

			list = query.list();

		} catch (Exception exception) {

			exception.printStackTrace();

		}
		return list;
	}
	
	public void insert(CityVO cityVO) {
		try{

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			session.save(cityVO);
			tr.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}
	public List search(CityVO cityVO)
	{
		List ls=new ArrayList();
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from CityVO");
		    ls= q.list();
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
	}
	public List edit(CityVO cityVO)
	{
		 List ls1= new ArrayList();
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from CityVO where id="+cityVO.getCityid());
		    ls1= q.list();
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls1;
	}
	public void delete(CityVO cityVO)
  	{
		try{
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();

		session.delete(cityVO);
		
		tr.commit();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void update(CityVO cityVO)
	{
		try{
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
           
			Session session = sessionFactory.openSession();
			Transaction tr = session.beginTransaction();

			session.update(cityVO);
			System.out.println("krunal");
			tr.commit();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
	}
}
