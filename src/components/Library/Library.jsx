import React, { useEffect, useState } from "react";
import axios from "axios";
import MonsterCard from "../MonsterCard/MonsterCard";

const Library = () => {
  const [monsters, setMonsters] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchMonsters() {
      try {
        // Fetch all monsters for the current user from your API
        const response = await axios.get("/api/monster");
        setMonsters(response.data);
      } catch (error) {
        console.error("Error fetching monsters:", error);
      } finally {
        setLoading(false);
      }
    }
    fetchMonsters();
  }, []);

  if (loading) {
    return <p>Loading monsters...</p>;
  }

  return (
    <div className="monster-gallery" style={galleryStyle}>
      {monsters.map((monster) => (
        <MonsterCard key={monster.id} monster={monster} />
      ))}
    </div>
  );
};

const galleryStyle = {
  display: "flex",
  flexWrap: "wrap",
  justifyContent: "center",
};

export default Library;
