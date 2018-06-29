package DAO;

import VO.CountryVO;
import VO.StateVO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import VO.AreaVO;
import VO.CityVO;
import VO.CountryVO;

public class AreaDAO implements Serializable {

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
	public List loadCity(StateVO stateVO) {
		List list = new ArrayList();
		try {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Query query = session.createQuery("from CityVO as c where c.stateVO='"+stateVO.getSid()+"'");

			list = query.list();

		} catch (Exception exception) {

			exception.printStackTrace();

		}
		return list;
	}
	public void insert(AreaVO areaVO) {
		// TODO Auto-generated method stub
		try{

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			session.save(areaVO);
			tr.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}
	public List search(AreaVO areaVO) {
		// TODO Auto-generated method stub
		List ls=new ArrayList();
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from AreaVO");
		    ls= q.list();
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
		
	}
	public List edit(AreaVO areaVO) {
		// TODO Auto-generated method stub
		List ls=new ArrayList();
		try{
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
		    Query q=session.createQuery("from AreaVO where id="+areaVO.getAreaId());
		    ls= q.list();
			}
		     catch(Exception e)
		     {
			     e.printStackTrace();
		     }
		return ls;
		
	}
	public void update(AreaVO areaVO) {
		// TODO Auto-generated method stub
		
		try{

			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction tr = session.beginTransaction();

			session.saveOrUpdate(areaVO);
			tr.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}
	public void delete(AreaVO areaVO) {
		// TODO Auto-generated method stub
		try{
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();
			Transaction tr = session.beginTransaction();

			session.delete(areaVO);
			
			tr.commit();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		
	}
	public List loadArea(CityVO cityVO) {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		try {
			SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

		
			Query query = session.createQuery("from AreaVO as c where c.cityVO='"+cityVO.getCityid()+"'");

			list = query.list();

		} catch (Exception exception) {

			exception.printStackTrace();

		}
		return list;
	}
	
}