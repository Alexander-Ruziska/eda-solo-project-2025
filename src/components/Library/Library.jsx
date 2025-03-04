import React, { useEffect } from "react";
import MonsterCard from "../MonsterCard/MonsterCard";
import useStore from "../../zustand/store"; // Adjust the path as needed

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
    <div className="monster-gallery">
      {monsters.map((monster) => (
        <MonsterCard key={monster.id} monster={monster} />
      ))}
    </div>
  );
};


export default Library;
