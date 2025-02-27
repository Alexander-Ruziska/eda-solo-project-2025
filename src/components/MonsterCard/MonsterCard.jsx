import React from 'react';
import { useEffect, useState } from "react";
import axios from "axios";

function MonsterCard({monster}) {

  let [showDescription, setShowDescription] = useState(false);
  const [name, setName] =useState(monster.name)

  const toggleDescription = () => {
    //use local state and 'not' operator to create a toggle
    setShowDescription(!showDescription);
  };

  const rename = (monsterId) => {
    console.log('Updated Name', monsterId);
    axios.put(`/api/monster/edit/${monsterId}`)
      .then(() => {
        console.log("Name changed; ", monsterId);
  
      rename(prev => prev+1);
      })
      .catch(err => console.error(err));
  };

  const handleImageClick = (id) => {
    if (showDescription[id]) {
      setShowDescription((prevShowDescription) => ({ ...prevShowDescription, [id]: false }));
    } else {
      setShowDescription((prevShowDescription) => ({ ...prevShowDescription, [id]: true }));
    }
  };

  

return (
  <div className="image-item">
    <div className={`card ${showDescription ? 'flipped' : ''}`} onClick={() => toggleDescription()}>
      <div className="front"> <img src={monster.image_url} alt="Image" /> <p>{monster.name}</p>
        <button type="button" className="btn btn-primary" onClick={(event) => {event.stopPropagation();rename(monster.id);}}></button>
      </div>
      <div className="back">
        <p>{monster.description}</p>
      </div>
      
    </div>
  </div>
)}
export default MonsterCard;