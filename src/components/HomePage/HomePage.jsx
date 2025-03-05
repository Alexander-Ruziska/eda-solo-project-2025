import { useEffect } from "react";
import useStore from "../../zustand/store";


function HomePage() {
  const user = useStore((state) => state.user);
  const logOut = useStore((state) => state.logOut);
  

  return (
    <>
      <h2 style={{ marginTop: '100px' }}>Home Page</h2>
      <p>Your username is: {user.username}</p>
      <p>Your ID is: {user.id}</p>
      <button className="btn btn-dark mt-3" onClick={logOut}>Log Out</button>
    </>
  );
}

export default HomePage;
