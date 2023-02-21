package tacos.data;

import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import tacos.Order;
import tacos.User;

import java.util.List;

/**
 * @author keyboardhero
 * @create 2022-06-07 15:39
 */
public interface OrderRepository extends CrudRepository<Order,Long> {
    List<Order> findByUserOrderByPlacedAtDesc(User user, Pageable pageable);
}
