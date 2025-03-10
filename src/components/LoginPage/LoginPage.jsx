import { useState, useEffect } from 'react';
import useStore from '../../zustand/store';
import "./LoginPage.css"; 

function LoginPage() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const logIn = useStore((state) => state.logIn);
  const errorMessage = useStore((state) => state.authErrorMessage);
  const setAuthErrorMessage = useStore((state) => state.setAuthErrorMessage);

  useEffect(() => {
    return () => {
      setAuthErrorMessage('');
    };
  }, []);

  const handleLogIn = (event) => {
    event.preventDefault();
    logIn({ username, password });
  };

  return (
    <div className="login-container">
      <h2><strong>Login Page</strong></h2>

      <form onSubmit={handleLogIn} className="login-form">
        <label style={{ color: 'white' }} htmlFor="username"><strong>Username:</strong></label>
        <input
          className="form-control"
          type="text"
          id="username"
          required
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />

        <label style={{ color: 'white' }} htmlFor="password"><strong>Password:</strong></label>
        <input 
          className="form-control"
          type="password"
          id="password"
          required
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />

        <button className="btn btn-dark login-button" type="submit">
          Log In
        </button>
      </form>

      {errorMessage && <h3 className="error-message">{errorMessage}</h3>}
    </div>
  );
}

export default LoginPage;
