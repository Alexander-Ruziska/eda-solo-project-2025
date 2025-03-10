import { useState, useEffect } from 'react';
import useStore from '../../zustand/store';
import "./Register.css";

function RegisterPage() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const register = useStore((state) => state.register)
  const errorMessage = useStore((state) => state.authErrorMessage);
  const setAuthErrorMessage = useStore((state) => state.setAuthErrorMessage);

  useEffect(() => {
    // Clear the auth error message when the component unmounts:
    return () => {
      setAuthErrorMessage('');
    }
  }, [])

  const handleRegister = (event) => {
    event.preventDefault();

    register({
      username: username,
      password: password,
    })
  };

  return (
    <div className="register-container">
      <h2><strong>Register Page</strong></h2>

      <form onSubmit={handleRegister} className="register-form">
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

        <button className="btn btn-dark register-button" type="submit">
          Register 
        </button>
      </form>

      {errorMessage && <h3 className="error-message">{errorMessage}</h3>}
    </div>
  );
}


export default RegisterPage;
