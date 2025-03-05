import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
// import "./AdminUserMonsters.css"; 

function AdminUserMonsters() {
  const { userId } = useParams();
  const [monsters, setMonsters] = useState([]);

  useEffect(() => {
    async function fetchUserMonsters() {
      try {
        const response = await axios.get("/api/monster/admin");
        const userMonsters = response.data.filter(
          (monster) => Number(monster.user_id) === Number(userId)
        );
        setMonsters(userMonsters);
      } catch (error) {
        console.error("Error fetching user monsters:", error);
      }
    }
    fetchUserMonsters();
  }, [userId]);

  const handleDelete = async (monsterId) => {
    try {
      await axios.delete(`/api/monster/delete/${monsterId}`);
      setMonsters((prev) => prev.filter((monster) => monster.id !== monsterId));
    } catch (error) {
      console.error("Error deleting monster:", error);
    }
  };

  return (
    <div style={{ marginTop: "100px" }}>
      <h2>Monsters for User {userId}</h2>
      {monsters.length === 0 ? (
        <p>No monsters found for this user.</p>
      ) : (
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Type</th>
              <th>Created</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {monsters.map((monster) => (
              <tr key={monster.id}>
                <td>{monster.id}</td>
                <td>{monster.name}</td>
                <td>{monster.type}</td>
                <td>{new Date(monster.created).toLocaleDateString()}</td>
                <td>
                  <button onClick={() => handleDelete(monster.id)}>Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}

export default AdminUserMonsters;
