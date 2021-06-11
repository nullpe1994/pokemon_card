import './css/App.css';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import LoginForm from './components/LoginForm';
import Main from './components/Main';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src="pokemonTitle.png" className="App-logo" alt="logo" />
      </header>
      <main className="App-main">
        <Router>
          <Route exact path='/' component={LoginForm}/>
          <Route path='/Main' component={Main}/>
        </Router>
      </main>
    </div>
  );
}

export default App;
