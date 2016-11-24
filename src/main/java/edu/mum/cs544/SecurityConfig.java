package edu.mum.cs544;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.jms.annotation.EnableJms;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(new BCryptPasswordEncoder())
				.usersByUsernameQuery("select  username, password ,enabled as active from  user  where username=?")
				.authoritiesByUsernameQuery("select  username, role from user  where username=?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/css/**", "/js/**", "/", "/record/borrow/**", "/record/borrow/addItem/**",
						"/record/**", "/login", "/home", "/resources/**", "/item/**",
						"/item/detail/*")
				.permitAll().antMatchers("/item/add", "/logout").hasAnyAuthority("ROLE_ADMIN", "ROLE_USER")
				.antMatchers("/item/all").permitAll().antMatchers("/register").permitAll()
				// .antMatchers("/item/add").hasAuthority("ROLE_ADMIN")
				// .antMatchers("/item/add").hasRole("ROLE_ADMIN")
				.anyRequest().authenticated().and().formLogin().loginPage("/login")
				// .successForwardUrl("/item/all")
				.successForwardUrl("/postLogin").permitAll();
		http.csrf().disable();
	}
}