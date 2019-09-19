package com.xlkh.demo.jwt;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @author Lucas
 */
public class JwtToken implements AuthenticationToken {
    private String token;
    private Object principal;

    public JwtToken(String token) {
        this.token = token;
    }

    public JwtToken(Object principal) {
        this.principal = principal;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }

}
