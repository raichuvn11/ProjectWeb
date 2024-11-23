package DatabaseModel;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;
import business.Furniture;
import data.DBUtil;

public class FurnitureDAO {

    public List<Furniture> getAllFurniture() {
        EntityManager entityManager = DBUtil.getEntityManager();

        try {
            // Open a transaction if needed
            entityManager.getTransaction().begin();

            // Execute the query
            String jpql = "SELECT f FROM Furniture f";
            TypedQuery<Furniture> query = entityManager.createQuery(jpql, Furniture.class);
            List<Furniture> furnitureList = query.getResultList();

            // Commit the transaction (if necessary)
            entityManager.getTransaction().commit();

            return furnitureList;
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            e.printStackTrace();
            return null;
        } finally {
            entityManager.close(); // Always close the entity manager to avoid leaks
        }
    }
}
