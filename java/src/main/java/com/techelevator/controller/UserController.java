package com.techelevator.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.UserDAO;
import com.techelevator.dao.UserSqlDAO;
import com.techelevator.model.User;

@RestController
public class UserController {
	
	private UserSqlDAO UserSqlDAO;
	
	public UserController(UserSqlDAO UserSqlDAO) {
		this.UserSqlDAO = UserSqlDAO;
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public List<User> getUsers() {
		return UserSqlDAO.findAll();
	}

}
