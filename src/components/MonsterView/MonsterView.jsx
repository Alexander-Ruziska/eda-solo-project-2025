import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import useStore from "../../zustand/store"; // Adjust the import path as needed
import "./MonsterView.css"; 

const MonsterView = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [monster, setMonster] = useState(null);
  const [isFlipped, setIsFlipped] = useState(false);
  const [newName, setNewName] = useState("");

  // Destructure the functions from the global store
  const { fetchMonsterDetail, updateMonster, deleteMonster } = useStore();

  useEffect(() => {
    async function fetchMonster() {
      try {
        const data = await fetchMonsterDetail(id);
        setMonster(data);
        setNewName(data.name);
      } catch (error) {
        console.error("Error fetching monster details:", error);
      }
    }
    fetchMonster();
  }, [id, fetchMonsterDetail]);

  if (!monster) return <div>Loading...</div>;

  const handleFlip = () => {
    setIsFlipped(!isFlipped);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const updatedData = await updateMonster(id, { name: newName });
      setMonster({ ...monster, ...updatedData });
    } catch (error) {
      console.error("Error updating monster name:", error);
    }
  };

  const handleDelete = async () => {
    try {
      await deleteMonster(id);
      navigate("/library");
    } catch (error) {
      console.error("Error deleting monster:", error);
    }
  };

  return (
    <div className="monster-view-wrapper">
      
      <form onSubmit={handleSubmit} className="update-form">
        <input 
          type="text" 
          value={newName} 
          onChange={(e) => setNewName(e.target.value)} 
          className="update-input"
        />
        <button type="submit" className="update-button">Update Name</button>
      </form>

      <button onClick={handleDelete} className="delete-button">Delete Monster</button>

      <div className="flip-container" onClick={handleFlip}>
        <div className={`flip-card ${isFlipped ? "flipped" : ""}`}>
          
          <div className="face front-face">
            <img src={monster.image_url} alt={monster.name} className="monster-image"/>
            <div className="monster-name-overlay">{monster.name}</div>
          </div>
         
          <div className="face back-face">
            <div className="back-content">
              <div className="monster-name">{monster.name}</div>
              <div className="monster-description">{monster.description}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default MonsterView;
