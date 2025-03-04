import React, { useEffect } from "react";
import useStore from "../../zustand/store";

function AdminUsers() {
  const users = useStore((state) => state.users);
  const fetchUsers = useStore((state) => state.fetchUsers);
  const archiveUser = useStore((state) => state.archiveUser);

  useEffect(() => {
    fetchUsers();
  }, [fetchUsers]);

  return (
    <div style={{ marginTop: "60px" }}>
      <h2>Welcome Ziska!</h2>
      <table>
        <thead>
          <tr>
            <th>User Name</th>
            <th>Created</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {users.map((user) => (
            <tr key={user.id}>
              <td>{user.username}</td>
              <td>{new Date(user.created).toLocaleDateString()}</td>
              <td>
                <button onClick={() => archiveUser(user.id)}>Archive</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default AdminUsers;
