import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
import "./AdminUserMonsters.css"; 

function AdminUserMonsters() {
  const { userId } = useParams();
  const [monsters, setMonsters] = useState([]);
  const [username, setUsername] = useState(""); // Store the username

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

    async function fetchUsername() {
      try {
        const response = await axios.get(`/api/user/${userId}`); // API call to get the username
        setUsername(response.data.username);
      } catch (error) {
        console.error("Error fetching username:", error);
      }
    }

    fetchUserMonsters();
    fetchUsername();
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
    <div className="monsters-container">
      <h2 style={{ marginTop: "100px", fontSize: '36px' }}>
        Monster List
      </h2>
      {monsters.length === 0 ? (
        <p>No monsters found for this user.</p>
      ) : (
        <div className="table-wrapper">
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
                    <button className="btn btn-danger mt-4" onClick={() => handleDelete(monster.id)}>Delete</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}

export default AdminUserMonsters;
