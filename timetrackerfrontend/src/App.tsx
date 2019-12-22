import React, { useEffect, useState } from 'react';
import apiClient from './apiClient';
import './App.css';
import { AxiosResponse } from 'axios';

const App: React.FC = () => {
    const [greeting, setGreeting] = useState("");

    useEffect(() => {
        (async () => {
            const result: AxiosResponse = await apiClient.get('/hello');
            setGreeting(result.data.message)
        })();
    }, []);

    return (
        <div className="App">
            {greeting}
        </div>
    );
}

export default App;
