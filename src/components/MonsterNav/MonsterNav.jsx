import React from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import useStore from '../../zustand/store';
import "./MonsterNav.css";

const MonsterNavigation = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const user = useStore(state => state.user);
  const monsters = useStore(state => state.monsters) || [];

  const userMonsters = [];
  for (let i = 0; i < monsters.length; i++) {
    if (Number(monsters[i].user_id) === user.id) {
      userMonsters.push(monsters[i]);
    }
  }

  const currentId = +id;
  let currentIndex = 0;
  for (let i = 0; i < userMonsters.length; i++) {
    if (userMonsters[i].id === currentId) {
      currentIndex = i;
      break;
    }
  }

  const handlePrev = () => {
    if (currentIndex > 0) {
      navigate(`/monster/${userMonsters[currentIndex - 1].id}`);
    }
  };

  const handleNext = () => {
    if (currentIndex < userMonsters.length - 1) {
      navigate(`/monster/${userMonsters[currentIndex + 1].id}`);
    }
  };

  return (
    <>
      <button className="arrow back" onClick={handlePrev} disabled={currentIndex === 0}>&#8592;</button>
      <button className="arrow next" onClick={handleNext} disabled={currentIndex === userMonsters.length - 1}>&#8594;</button>
    </>
  );
};

export default MonsterNavigation;
