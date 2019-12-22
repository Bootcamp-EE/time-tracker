import axios, { AxiosInstance, AxiosRequestConfig } from 'axios';

const config: AxiosRequestConfig = {
   baseURL: process.env.REACT_APP_API_BASE_URL,
   responseType: 'json',
   headers: {
      'Content-Type': 'application/json'
   }
}

const apiClient: AxiosInstance = axios.create(config);

export default apiClient;
