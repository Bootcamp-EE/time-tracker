import React, { useEffect, useState } from 'react';
import { AxiosResponse } from 'axios';
import apiClient from './apiClient';
import './App.css';

export interface Message {
  message: string;
}

const App: React.FC = (): JSX.Element => {
  const [greeting, setGreeting] = useState('');

  useEffect(() => {
    (async () => {
      const result: AxiosResponse<Message> = await apiClient.get('/hello');
      setGreeting(result.data.message);
    })();
  }, []);

  return <div className="App">{greeting}</div>;
};

export default App;
