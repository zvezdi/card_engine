import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Sockette from 'sockette' 

class App extends Component {

  constructor(props) {
    super(props);
  
    const ws = new Sockette('ws://localhost:4000/ws', {
      timeout: 5e3,
      maxAttempts: 10,
      onopen: e => console.log('Connected!', e),
      onmessage: e => console.log('Received:', e),
      onreconnect: e => console.log('Reconnecting...', e),
      onmaximum: e => console.log('Stop Attempting!', e),
      onclose: e => console.log('Closed!', e),
      onerror: e => console.log('Error:', e)
    });
  
    
    // Reconnect 10s later
    setTimeout(ws.reconnect, 10e3);
    this.state = {
      ws: ws
    };
  }
  
  register(event) {
    this.state.ws.json({"action": "register_room", "arguments": {"name": "Room 1"}});
  }
  
  list(event) {
    this.state.ws.json({"action": "list_rooms"})
  }
  
  render() {
    return (
      <div className="App">
        <button onClick={this.register.bind(this)}>
          Register
        </button>

        <button onClick={this.list.bind(this)}>
          List
        </button>
      </div>
    );
  }
}

export default App;
