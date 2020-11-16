package com.mvp.config;

import com.mvp.security.CustomUserDetailsService;
import com.mvp.security.LoginSuccessHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter, CsrfFilter.class);

        http.authorizeRequests()
                .antMatchers("/ws/**", "/app/**", "/topic/**").permitAll()
                .antMatchers("/mvp/sign", "/mvp/signUp").access("isAnonymous()")
                .antMatchers("/mvp/admin/**").hasRole("ADMIN")
                .and()
                .csrf().disable().authorizeRequests()
                .antMatchers("/audio/testscrolldown", "/history_like/like").permitAll()
                .and()
                .formLogin()
                .loginPage("/mvp/sign")
                .loginProcessingUrl("/loginProcess")
                .failureUrl("/mvp/sign?error=true")
                .successHandler(successHandler())
                .usernameParameter("login_id")
                .passwordParameter("login_pwd")
                .permitAll()
                .and()
                .logout()
                .logoutUrl("/logout")
                .invalidateHttpSession(true)
                .logoutSuccessUrl("/")
                .deleteCookies("JSESSIONID", "remember-me")
                .and()
                .rememberMe()
                .key("mvpKey")
                .rememberMeParameter("remember-me")
                .tokenValiditySeconds(86400)
                .and()
                .exceptionHandling()
                .accessDeniedPage("/denied")
                .and()
                .sessionManagement()
                .maximumSessions(1)
                .expiredUrl("/mvp/home")

        ;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(cuds()).passwordEncoder(passwordEncoder());
    }

/*    public CustomAuthenticationProvider provider() {
        CustomAuthenticationProvider provider = new CustomAuthenticationProvider();
        return provider;
    }*/

    @Bean
    public CustomUserDetailsService cuds() {
        CustomUserDetailsService cuds = new CustomUserDetailsService();
        return cuds;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }

    @Bean
    public AuthenticationSuccessHandler successHandler() {
        return new LoginSuccessHandler("/mvp/home");
    }

}
