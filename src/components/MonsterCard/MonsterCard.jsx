import React, { useEffect } from "react";
import { Link } from "react-router-dom";
import useStore from "../../zustand/store"; // Adjust the import path as needed
import "./MonsterCard.css"; 

  const MonsterCard = ({ monster }) => {
  // Destructure monsterImages and fetchMonsterImage from the global store
  const { monsterImages, fetchMonsterImage } = useStore();
  // Retrieve the image for the current monster from the store
  const image = monsterImages[monster.id];

  useEffect(() => {
    // Only fetch the image if it hasn't been loaded yet
    if (!image) {
      fetchMonsterImage(monster.id);
    }
  }, [monster.id, image, fetchMonsterImage]);

  return (
    <Link to={`/monster/${monster.id}`} className="monster-link">
  <div className="monster-card" style={{ marginTop: '0px' }}>
    {image ? (
      <img src={image} alt={monster.name} className="monster-image" />
    ) : (
      <p>Loading image...</p>
    )}
    <h3>{monster.name}</h3>
  </div>
</Link>
  );
};

export default MonsterCard;
