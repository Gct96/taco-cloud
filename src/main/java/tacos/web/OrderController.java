// tag::baseClass[]
package tacos.web;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import tacos.Order;
import tacos.data.OrderRepository;

import javax.validation.Valid;

//end::baseClass[]
//tag::baseClass[]


@Controller
@RequestMapping("/orders")
@SessionAttributes("order")
public class OrderController {

  private OrderRepository orderRepo;

  public OrderController(OrderRepository orderRepo){
    this.orderRepo=orderRepo;
  }

  @GetMapping("/current")
  public String orderForm() {
    return "orderForm";
  }
  //end::orderForm[]

  /*
  //tag::handlePost[]
  @PostMapping
  public String processOrder(Order order) {
    log.info("Order submitted: " + order);
    return "redirect:/";
  }
  //end::handlePost[]
  */

  //tag::handlePostWithValidation[]
  @PostMapping
  public String processOrder(@Valid Order order, Errors errors,SessionStatus sessionStatus) {
    if (errors.hasErrors()) {
      return "orderForm";
    }

    orderRepo.save(order);
    sessionStatus.setComplete();
    return "redirect:/design";
  }
  //end::handlePostWithValidation[]

  //tag::baseClass[]
  
}
//end::baseClass[]
