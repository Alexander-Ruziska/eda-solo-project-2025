import React, { useEffect } from "react";
import useStore from "../../zustand/store"; 


function AdminUsers() {
    const user = useStore((state) => state.user);
    const fetchUser = useStore((state) => state.fetchUser);
    console.log(user);

    useEffect(() => {
        fetchUser();
      }, [fetchUser]);
return (
        <>
          <h2 style={{ marginTop: '60px' }}>Welcom Ziska!</h2>
    
          <table>
            <thead>
              <tr>
                <th>User Name</th>
                <th>Created</th>
              </tr>
            </thead>
            <tbody>
              {/* {
                user?.map((user) => (
                  <tr key={user?.id}>
                    <td>{user?.name}</td>
                    <td>{user?.created}</td>
                  </tr>
                ))
              } */}
            </tbody>
          </table>
        </>
      );
    }
    


export default AdminUsers;
