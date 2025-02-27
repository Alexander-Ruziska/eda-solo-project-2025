import { useEffect } from "react";
import useStore from "../../zustand/store";


function HomePage() {
  const user = useStore((state) => state.user);
  const logOut = useStore((state) => state.logOut);
  const fetchMonster = useStore((state) => state.fetchMonsterById);

  useEffect(() => {
    fetchMonster(1);
  }, []);

  return (
    <>
      <h2>Home Page</h2>
      <p>Your username is: {user.username}</p>
      <p>Your ID is: {user.id}</p>
      <button onClick={logOut}>Log Out</button>
    </>
  );
}

export default HomePage;
