package com.techelevator.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.ReportSqlDAO;
import com.techelevator.model.Report;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;


@RestController
@CrossOrigin
public class ReportController {
	

	private ReportSqlDAO ReportSqlDAO;
	
	public ReportController(ReportSqlDAO ReportSqlDAO) {
		this.ReportSqlDAO = ReportSqlDAO;
	}
	
	@RequestMapping(path = "/reports", method = RequestMethod.GET)
	public List<Report> getReports() {
		return ReportSqlDAO.listReports();
	}

}
