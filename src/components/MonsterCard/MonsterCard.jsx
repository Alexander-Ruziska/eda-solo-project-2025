import React, { useEffect, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import "./MonsterCard.css"; 

const MonsterCard = ({ monster }) => {
  const [image, setImage] = useState(null);

  useEffect(() => {
    async function fetchImage() {
      try {
        const response = await axios.get(`/api/monster/image/${monster.id}`);
        setImage(response.data.image);
      } catch (error) {
        console.error("Error fetching monster image:", error);
      }
    }
    fetchImage();
  }, [monster.id]);

  return (
    <Link to={`/monster/${monster.id}`} className="monster-link">
      <div className="monster-card">
        <h3>{monster.name}</h3>
        {image ? (
          <img src={image} alt={monster.name} className="monster-image" />
        ) : (
          <p>Loading image...</p>
        )}
      </div>
    </Link>
  );
};

export default MonsterCard;
