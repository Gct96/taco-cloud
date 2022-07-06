package tacos.security;

import lombok.Data;
import org.springframework.security.crypto.password.PasswordEncoder;
import tacos.User;

/**
 * @author keyboardhero
 * @create 2022-07-01 21:21
 */
@Data
public class RegistrationForm {
    private String username;
    private String password;
    private String fullname;
    private String street;
    private String city;
    private String State;
    private String zip;
    private String phone;

    public User toUser(PasswordEncoder passwordEncoder){
        return new User(username,passwordEncoder.encode(password),fullname,street,city,State,zip,phone);
    }

}
