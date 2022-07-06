package tacos.data;

import org.springframework.data.repository.CrudRepository;
import tacos.Ingredient;

/**
 * @author keyboardhero
 * @create 2022-06-06 20:17
 */
public interface IngredientRepository extends CrudRepository<Ingredient,String>{
}
