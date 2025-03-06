import React from 'react';
import { useNavigate } from 'react-router-dom';
import "./Landing.css"; 

function Landing() {
  const navigate = useNavigate();

  return (
    <form className="input-form" >
      <h1 style={{ marginTop: '100px' }}>Welcome to the Monster Dashboard</h1>
      <button className="btn btn-dark mt-3" onClick={() => navigate('/generate-monster')}>Create a New Monster</button>
      {/* <button className="btn btn-dark mt-3" onClick={() => navigate('/create-campaign')}>Create a Campaign</button> */}
      <button className="btn btn-dark mt-3" onClick={() => navigate('/library')}>Go to Your Library</button>
    </form>
  );
}

export default Landing;
