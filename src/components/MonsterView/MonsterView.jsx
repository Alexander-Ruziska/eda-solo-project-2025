import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams, useNavigate } from "react-router-dom";
import "./MonsterView.css"; 

const MonsterView = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [monster, setMonster] = useState(null);
  const [isFlipped, setIsFlipped] = useState(false);
  const [newName, setNewName] = useState("");

  useEffect(() => {
    async function fetchMonster() {
      try {
        const response = await axios.get(`/api/monster/${id}`);
        setMonster(response.data);
        setNewName(response.data.name);
      } catch (error) {
        console.error("Error fetching monster details:", error);
      }
    }
    fetchMonster();
  }, [id]);

  if (!monster) return <div>Loading...</div>;

  const handleFlip = () => {
    setIsFlipped(!isFlipped);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.put(`/api/monster/edit/${id}`, { name: newName });
      setMonster({ ...monster, name: newName });
    } catch (error) {
      console.error("Error updating monster name:", error);
    }
  };

  const handleDelete = async () => {
    try {
      await axios.delete(`/api/monster/delete/${id}`);
      navigate("/library"); 
    } catch (error) {
      console.error("Error deleting monster:", error);
    }
  };

  return (
    <div className="monster-view-wrapper">
      
      <form onSubmit={handleSubmit} className="update-form">
        <input type="text" value={newName} onChange={(e) => setNewName(e.target.value)} className="update-input"/>
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
