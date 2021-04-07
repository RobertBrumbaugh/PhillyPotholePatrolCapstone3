package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseStatus;

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

	@Override
	public void addReport(Report report) {

		String sql = "INSERT INTO reports "
				+ "(username, lat, lng, reported, status)"
				+ "VALUES (?,?,?,?,?)";

		jdbcTemplate.update(sql, report.getUsername(), report.getLat(), 
				report.getLng(), report.getReported(), 1);
	}

	@Override
	public void deleteReportByReportId(int report_id) {

		String sql = "DELETE FROM reports WHERE report_id = ?";
		jdbcTemplate.update(sql, report_id);

	}

	@Override
	public void updateStatusByReportId(int report_id, int status_id) {

		String sql = "UPDATE reports SET status = ? WHERE report_id = ?";
		jdbcTemplate.update(sql, status_id, report_id);
	}

	@Override
	public void updateSeverityByReportId(int report_id, int severity_id) {

		String sql = "UPDATE reports SET severity = ? WHERE report_id = ?";
		jdbcTemplate.update(sql, severity_id, report_id);
	}

	@Override
	public void updateInspectedByReportId(int report_id, String inspected_date) {

		String sql = "UPDATE reports SET inspected = ? WHERE report_id = ?";
		jdbcTemplate.update(sql, inspected_date, report_id);
	}

	@Override
	public void updateRepairedByReportId(int report_id, String repaired_date) {

		String sql = "UPDATE reports SET repaired = ? WHERE report_id = ?";
		jdbcTemplate.update(sql, repaired_date, report_id);
	}

	// helper method

	private Report mapRowToReport(SqlRowSet rs) {
		Report report = new Report();
		report.setReport_id(rs.getInt("report_id"));
		report.setUsername(rs.getString("username"));
		report.setLat(rs.getBigDecimal("lat"));
		report.setLng(rs.getBigDecimal("lng"));
		report.setReported(rs.getString("reported"));
		report.setInspected(rs.getString("inspected"));
		report.setRepaired(rs.getString("repaired"));
		report.setStatus(rs.getInt("status"));
		report.setSeverity(rs.getInt("severity"));
		report.setImg(rs.getString("img"));
		return report;
	}

}
