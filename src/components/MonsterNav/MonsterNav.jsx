import React from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import "./MonsterNav.css"; 

const MonsterNavigation = () => {
  // Get the current monster id from the URL
  const { id } = useParams();
  const navigate = useNavigate();
  const monsterId = parseInt(id, 10);

  // Handler for going to the previous monster
  const handlePrev = () => {
    if (monsterId > 1) { // Optionally prevent navigating to 0 or negative numbers
      navigate(`/monster/${monsterId - 1}`);
    }
  };

  // Handler for going to the next monster
  const handleNext = () => {
    navigate(`/monster/${monsterId + 1}`);
  };

  return (
    <>
      {/* Back arrow button */}
      <button className="arrow back" onClick={handlePrev}>
        &#8592;
      </button>
      {/* Next arrow button */}
      <button className="arrow next" onClick={handleNext}>
        &#8594;
      </button>
    </>
  );
};

export default MonsterNavigation;
