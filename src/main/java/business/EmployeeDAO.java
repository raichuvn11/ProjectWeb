package business;

import data.DBUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class EmployeeDAO {

    public static Employee getEmployeeById(int id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try{
            Employee employee = em.find(Employee.class, id);
            return employee;
        }
        finally{
            em.close();
        }
    }

    public static void insert(Employee employee) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try{
            em.persist(employee);
            trans.commit();
        }
        catch(Exception e){
            trans.rollback();
            System.out.println(e);
        }
        finally{
            em.close();
        }
    }

    public static void update(Employee employee) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(employee); //merge = update
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void delete(Employee employee) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(employee)); //remove = delete
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Employee> getAllEmployees() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String query = "SELECT e FROM Employee e";
        return em.createQuery(query, Employee.class).getResultList();
    }

    public static List<Employee> getEmployeeByName(String empName) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String query = "SELECT e FROM Employee e where e.empName=:empName";
        return em.createQuery(query, Employee.class).setParameter("empName", "%" + empName + "%").getResultList();
    }



}
