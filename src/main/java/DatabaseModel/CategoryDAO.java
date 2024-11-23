package DatabaseModel;
import data.DBUtil;
import business.Category;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class CategoryDAO {

    // Lấy Category theo ID
    public Category getCategoryById(Long categoryId) {
        EntityManager entityManager = DBUtil.getEntityManager();
        try {
            // Sử dụng phương thức find của EntityManager để tìm Category theo ID
            return entityManager.find(Category.class, categoryId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            // Đảm bảo đóng EntityManager để tránh rò rỉ tài nguyên
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    // Lấy tất cả Category
    public List<Category> getAllCategories() {
        EntityManager entityManager = DBUtil.getEntityManager();
        try {
            String jpql = "SELECT c FROM Category c";

            TypedQuery<Category> query = entityManager.createQuery(jpql, Category.class);

            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            // Đảm bảo đóng EntityManager để tránh rò rỉ tài nguyên
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

}
