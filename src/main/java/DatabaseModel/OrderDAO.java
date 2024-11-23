package DatabaseModel;

import data.DBUtil;
import business.Order;

import javax.persistence.EntityManager;

public class OrderDAO {
    public static Order getOrderById(Long orderID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            return em.find(Order.class, orderID);
        } finally {
            em.close();
        }
    }
}
