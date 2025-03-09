import React, { useEffect } from "react";
import MonsterCard from "../MonsterCard/MonsterCard";
import useStore from "../../zustand/store"; // Adjust the path as needed
import "./Library.css"; 

const Library = () => {
  // Extract monsters and fetchMonsters from the global store
  const { monsters, fetchMonsters } = useStore();

  useEffect(() => {
    fetchMonsters();
  }, [fetchMonsters]);

  if (monsters.length === 0) {
    return <p>Loading monsters...</p>;
  }

  return (
    <div className="library">
  <h1 style={{ marginTop: '120px', textAlign: 'center' }}>
    The Monster Library
  </h1>
  <div className="monster-gallery">
    {monsters.map((monster) => (
      <MonsterCard key={monster.id} monster={monster} />
    ))}
  </div>
</div>
  );
};

export default Library;
