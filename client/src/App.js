import './css/App.css';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import LoginForm from './components/LoginForm';
import Main from './components/Main';

function App() {
  return (
    <div className="App">
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
