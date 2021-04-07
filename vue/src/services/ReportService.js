import axios from 'axios'; 

const http = axios.create({
  baseURL: "http://localhost:8080"
});

export default {

    list() {
        return http.get('/reports');
    },

    // I think we need to add a get id method

    addReport(report) {
      return http.post('/reports', report);
    },

    deleteReport(report_id) {
      return http.delete(`/reports/${report_id}`)
    },
    
    updateStatus(report_id, status_id) {
      return http.put(`/reports/${report_id}/status/${status_id}`)
    },

    updateInspected(report_id, inspected_date) {
      return http.put(`/reports/${report_id}/inspected/${inspected_date}`)
    },

    updateRepaired(report_id, repaired_date) {
      return http.put(`/reports/${report_id}/repaired/${repaired_date}`)
    },

    updateSeverity(report_id, severity_id) {
      return http.put(`/reports/${report_id}/severity/${severity_id}`)
    }

}