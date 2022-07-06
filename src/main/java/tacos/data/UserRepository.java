package tacos.data;

import org.springframework.data.repository.CrudRepository;
import tacos.User;

/**
 * @author keyboardhero
 * @create 2022-07-01 20:23
 */
public interface UserRepository extends CrudRepository<User,Long> {
    User findByUsername(String username);
}
