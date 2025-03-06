import { useState, useEffect } from 'react';
import useStore from '../../zustand/store';
import "./LoginPage.css"; 


function LoginPage() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const logIn = useStore((state) => state.logIn)
  const errorMessage = useStore((state) => state.authErrorMessage);
  const setAuthErrorMessage = useStore((state) => state.setAuthErrorMessage);

  useEffect(() => {
    // Clear the auth error message when the component unmounts:
    return () => {
      setAuthErrorMessage('');
    }
  }, [])

  const handleLogIn = (event) => {
    event.preventDefault();

    logIn({
      username: username,
      password: password,
    })
  };

  return (
    <>
      <h2 style={{ marginTop: '100px' }}>Login Page</h2>
      <form onSubmit={handleLogIn}>
        <div className="col-sm-3">
        <label htmlFor="username">Username:</label>
        <input
        className="form-control"
          type="text"
          id="username"
          required
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <label htmlFor="password">Password:</label>
        <input 
        className="form-control"
          type="password"
          id="password"
          required
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        </div>
        <button className="btn btn-dark mt-3, col-sm-3 mt-3" type="submit">
          Log In
        </button>
      </form>
      { // Conditionally render login error:
        errorMessage && (
          <h3>{errorMessage}</h3>
        )
      }
    </>
  );
}


export default LoginPage;
