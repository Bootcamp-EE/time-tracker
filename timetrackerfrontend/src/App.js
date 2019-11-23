import React from 'react';
import logo from './logo.svg';
import './App.css';
import axios from "axios";

class App extends React.Component {
    state = {
        greeting: ""
    }
    getGreeting = async () => {
        let res = await axios.get("http://localhost:8080/");
        this.setState({ greeting: res.data });
    };
    componentDidMount(){
        this.getGreeting()
    }
    render(){
        return (
            <div className="App">
                {this.state.greeting}
            </div>
        );
    }
}

export default App;
