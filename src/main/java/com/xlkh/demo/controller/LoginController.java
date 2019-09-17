package com.xlkh.demo.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author Lucas
 */
@Controller
public class LoginController {

    @GetMapping("/login/{username}/{password}")
    public void login(@PathVariable String username, @PathVariable String password){

        Subject subject = SecurityUtils.getSubject();

    }


}
