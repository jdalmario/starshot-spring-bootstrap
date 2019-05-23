package com.starshot.login;

import com.starshot.service.AuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("name")
public class AuthenticationController {

    @Autowired
    AuthenticationService authenticationService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String handleUserLogin(ModelMap model, @RequestParam String name,
                                  @RequestParam String password, HttpSession httpSession) {
        if (!authenticationService.performLogin(name, password)) {
            model.put("errorMessage", "Invalid Credentials");
            return "login";
        }
        httpSession.setAttribute("username", name);
        return "redirect:/timeRecord";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String handleUserLogout(HttpSession httpSession) {
        httpSession.removeAttribute("username");
        return "redirect:/login";
    }
}
