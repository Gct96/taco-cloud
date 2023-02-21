// tag::baseClass[]
package tacos.web;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import tacos.Order;
import tacos.User;
import tacos.data.OrderRepository;

import javax.validation.Valid;


//end::baseClass[]
//tag::baseClass[]


@Controller
@RequestMapping("/orders")
@SessionAttributes("order")
public class OrderController {

  private OrderRepository orderRepo;
  private OrderProps props;

  public OrderController(OrderRepository orderRepo, OrderProps props){
    this.orderRepo=orderRepo;
    this.props=props;
  }

  @GetMapping("/current")
  public String orderForm(@AuthenticationPrincipal User user, @ModelAttribute Order order)
  {
    if(order.getName()==null){
      order.setName(user.getFullname());
    }

    if(order.getStreet()==null){
      order.setStreet(user.getStreet());
    }

    if(order.getCity()==null){
      order.setStreet(user.getCity());
    }

    if(order.getState()==null){
      order.setState(user.getState());
    }

    if(order.getZip()==null){
      order.setZip(user.getZip());
    }

    return "orderForm";
  }




  //tag::handlePostWithValidation[]
  @PostMapping
  public String processOrder(@Valid Order order, Errors errors,SessionStatus sessionStatus,@AuthenticationPrincipal User user) {
    if (errors.hasErrors()) {
      return "orderForm";
    }
    order.setUser(user);
    orderRepo.save(order);
    sessionStatus.setComplete();
    return "redirect:/orders/past";
  }
  //end::handlePostWithValidation[]

  @GetMapping("/past")
  public String ordersForUser(@AuthenticationPrincipal User user, Model model){
    Pageable pageable= PageRequest.of(0,props.getPageSize());
    model.addAttribute("Orders",orderRepo.findByUserOrderByPlacedAtDesc(user,pageable));
    return "orderList";
  }
  
}
//end::baseClass[]
