package tacos.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author keyboardhero
 * @create 2022-05-22 16:43
 */
@Controller
public class HomeController {
    @GetMapping("/")
    public String home(){
        return "home";
    }
}
