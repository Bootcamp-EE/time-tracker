import React from 'react';
import './App.css';
import axios from "axios";

class App extends React.Component {
    state = {
        greeting: ""
    }
    getGreeting = async () => {
        const res = await axios.get("http://localhost:9700/");
        this.setState({ greeting: res.data.message });
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
