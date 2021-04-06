import axios from 'axios'; 

export default {

    list() {
        return axios.get('/reports');
      },
    
    get(id) {
        return axios.get(`/reports/${id}`);
      }


}