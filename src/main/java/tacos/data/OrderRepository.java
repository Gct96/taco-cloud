package tacos.data;

import org.springframework.data.repository.CrudRepository;
import tacos.Order;

/**
 * @author keyboardhero
 * @create 2022-06-07 15:39
 */
public interface OrderRepository extends CrudRepository<Order,Long> {

}
