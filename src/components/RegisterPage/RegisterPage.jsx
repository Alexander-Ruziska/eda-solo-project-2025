import { useState, useEffect } from 'react';
import useStore from '../../zustand/store';


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
    <>
      <h2 style={{ marginTop: '100px' }}>Register Page</h2>
      <form onSubmit={handleRegister}>
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
        <button className="btn btn-dark mt-3, col-sm-3 mt-3" type="submit">
          Register 
        </button>
      </form>
      { // Conditionally render registration error:
        errorMessage && (
          <h3>{errorMessage}</h3>
        )
      }
    </>
  );
}


export default RegisterPage;
