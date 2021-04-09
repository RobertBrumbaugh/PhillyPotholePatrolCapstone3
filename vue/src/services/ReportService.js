import axios from 'axios'; 

/* const http = axios.create({
  baseURL: "http://localhost:8080"
}); */

export default {

    list() {
        return axios.get('/reports');
    },

    addReport(report) {
      return axios.post('/reports', report);
    },

    deleteReport(report_id) {
      return axios.delete(`/reports/${report_id}`)
    },

    updateReport(report) {
      return axios.put('/reports', report);
    },
    
    updateStatus(report_id, status_id) {
      return axios.put(`/reports/${report_id}/status/${status_id}`)
    },

    updateInspected(report_id, inspected_date) {
      return axios.put(`/reports/${report_id}/inspected/${inspected_date}`)
    },

    updateRepaired(report_id, repaired_date) {
      return axios.put(`/reports/${report_id}/repaired/${repaired_date}`)
    },

    updateSeverity(report_id, severity_id) {
      return axios.put(`/reports/${report_id}/severity/${severity_id}`)
    }

}