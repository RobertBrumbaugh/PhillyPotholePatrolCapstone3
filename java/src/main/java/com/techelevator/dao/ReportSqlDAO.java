package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.techelevator.model.Report;
import com.techelevator.model.User;

@Service
public class ReportSqlDAO implements ReportDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	public ReportSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
	
	@Override
	public List<Report> listReports() {
		
		List<Report> reports = new ArrayList<>();
		String sql = "select * from reports";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
		while(results.next()) {
			Report report = mapRowToReport(results);
			reports.add(report);
		}
		
		return reports;
	}
	
	
	
	// helper method
	
	private Report mapRowToReport(SqlRowSet rs) {
        Report report = new Report();
        report.setReport_id(rs.getInt("report_id"));
        report.setUser_id(rs.getInt("user_id"));
        report.setLocation_id(rs.getInt("location_id"));
        report.setReported(rs.getDate("reported"));
        report.setInspected(rs.getDate("inspected"));
        report.setRepaired(rs.getDate("repaired"));
        report.setStatus(rs.getInt("status"));
        report.setSeverity(rs.getInt("severity"));
        report.setImg(rs.getString("img"));
        return report;
    }

}
