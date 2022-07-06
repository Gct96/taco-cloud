// tag::all[]
// tag::allButValidation[]
package tacos;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

// end::allButValidation[]
// tag::allButValidation[]

@Data
@Entity
public class Taco {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;
  private Date createdAt;

  // end::allButValidation[]
  @NotNull
  @Size(min=5, message="Name must be at least 5 characters long")
  // tag::allButValidation[]
  private String name;
  // end::allButValidation[]
  @ManyToMany(targetEntity = Ingredient.class)
  @Size(min=1, message="You must choose at least 1 ingredient")
  // tag::allButValidation[]
  private List<Ingredient> ingredients;
  @PrePersist
  void createdAt(){
    this.createdAt=new Date();
  }

}
//end::allButValidation[]
//tag::end[]