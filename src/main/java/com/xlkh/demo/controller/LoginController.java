package com.xlkh.demo.controller;

import com.xlkh.demo.jwt.JwtToken;
import com.xlkh.demo.jwt.JwtUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Lucas
 */
@RestController
public class LoginController {

    @GetMapping("/login/{username}/{password}")
    public String login(@PathVariable String username, @PathVariable String password){

        Subject subject = SecurityUtils.getSubject();
        JwtToken token = new JwtToken(JwtUtil.sign(username,"$2a$10$012Kx2ba5jzqr9gLlG4MX.bnQJTD9UWqF57XDo2N3.fPtLne02u/m"));
        subject.login(token);
        return token.getCredentials().toString();
    }


}
