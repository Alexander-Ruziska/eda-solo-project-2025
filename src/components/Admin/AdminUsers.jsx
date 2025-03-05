import React, { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import useStore from "../../zustand/store";
import "./AdminUsers.css"; 

function AdminUsers() {
  const users = useStore((state) => state.users);
  const fetchUsers = useStore((state) => state.fetchUsers);
  const archiveUser = useStore((state) => state.archiveUser);
  const navigate = useNavigate();

  useEffect(() => {
    fetchUsers();
  }, [fetchUsers]);

  return (
    <div className="users" style={{ marginTop: "100px" }}>
      <h2>Welcome Ziska!</h2>
      <table>
        <thead>
          <tr>
            <th>User Name</th>
            <th>Created</th>
            <th>Actions</th>
            <th>Monsters</th>
          </tr>
        </thead>
        <tbody>
          {users.map((user) => (
            <tr key={user.id}>
              <td>{user.username}</td>
              <td>{new Date(user.created).toLocaleDateString()}</td>
              <td>
                <button 
                  className="btn btn-dark mt-4" 
                  onClick={() => archiveUser(user.id)}
                >
                  Archive
                </button>
              </td>
              <td>
                <button 
                  className="btn btn-primary mt-4"
                  onClick={() => navigate(`/admin/monsters/${user.id}`)}
                >
                  View Monsters
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default AdminUsers;
