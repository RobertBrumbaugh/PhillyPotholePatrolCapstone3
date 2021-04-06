package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Report;

public interface ReportDAO {
	
	public List<Report> listReports();
	
	public void addReport(Report report);
	
	public void updateStatusByReportId(int report_id, int status_id);
	
	public void updateSeverityByReportId(int report_id, int severity_id);
	
	public void updateInspectedByReportId(int report_id, String inspected_date);
	
	public void updateRepairedByReportId(int report_id, String repaired_date);
	
	public void deleteReportByReportId(int report_id);
	
}
