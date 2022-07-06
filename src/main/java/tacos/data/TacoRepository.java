package tacos.data;

import org.springframework.data.repository.CrudRepository;
import tacos.Taco;

/**
 * @author keyboardhero
 * @create 2022-06-07 15:38
 */
public interface TacoRepository extends CrudRepository<Taco,Long> {

}
