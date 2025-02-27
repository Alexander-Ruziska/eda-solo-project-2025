import React from 'react';
import { useNavigate } from 'react-router-dom';

function Landing() {
  const navigate = useNavigate();

  return (
    <div>
      <h1>Welcome to the Monster Dashboard</h1>
      <button onClick={() => navigate('/create-monster')}>Create a New Monster!</button>
      <button onClick={() => navigate('/create-campaign')}>Create a Campaign</button>
      <button onClick={() => navigate('/library')}>Go to Your Library</button>
    </div>
  );
}

export default Landing;
