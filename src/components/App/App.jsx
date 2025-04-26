import { useEffect } from 'react';
import Container from 'react-bootstrap/Container';
import {
  Routes,
  Route,
  Navigate
} from "react-router-dom";
import MonsterView from "../MonsterView/MonsterView";
import useStore from '../../zustand/store';
import Nav from '../Nav/Nav';
import HomePage from '../HomePage/HomePage';
import LoginPage from '../LoginPage/LoginPage';
import RegisterPage from '../RegisterPage/RegisterPage';
import Library from '../Library/Library';
import GenerateMonster from '../GenerateMonster/GenerateMonster';
import Landing from '../Landing/Landing';
import AdminUsers from '../Admin/AdminUsers';
import AdminUserMonsters from '../Admin/AdminUserMonsters';

function App() {
  const user = useStore((state) => state.user);
  const fetchUser = useStore((state) => state.fetchUser);

  useEffect(() => {
    fetchUser();
  }, [fetchUser]);

  return (
    <Container>
      <Nav />
      <main>
        <Routes>
          <Route 
            exact path="/"
            element={
              user.id ? (
                <Navigate to="/landing" replace /> // Render HomePage for authenticated user.
              ) : (
                <Navigate to="/login" replace /> // Redirect unauthenticated user.
              )
            }
          />
          <Route 
            exact path="/login"
            element={
              user.id ? (
                <Navigate to="/landing" replace /> // Redirect authenticated user.
              ) : (
                <LoginPage /> // Render LoginPage for unauthenticated user.
              )
            }
          />
          <Route 
            exact path="/registration"
            element={
              user.id ? (
                <Navigate to="/landing" replace /> // Redirect authenticated user.
              ) : (
                <RegisterPage /> // Render RegisterPage for unauthenticated user.
              )
            }
          />
          <Route 
            exact path="/landing"
            element={
              user.id ? (
                <Landing to="/landing" replace /> // Redirect authenticated user.
              ) : (
                <LoginPage /> // Render RegisterPage for unauthenticated user.
              )
            }
          />
          <Route 
            exact path="/library"
            element={
              user.id ? (
                <Library to="/library" replace /> // Redirect authenticated user.
              ) : (
                <LoginPage /> // Render RegisterPage for unauthenticated user.
              )
            }
          />
          <Route 
            exact path="/generate-monster"
            element={
              user.id ? (
                <GenerateMonster to="/generate-monster" replace /> // Redirect authenticated user.
              ) : (
                <LoginPage /> // Render RegisterPage for unauthenticated user.
              )
            }
          />
          <Route 
            exact path="/monster/:id"
            element={
              user.id ? (
                <MonsterView to="/monster-view" replace /> // Redirect authenticated user.
              ) : (
                <LoginPage /> // Render RegisterPage for unauthenticated user.
              )
            }
          />
          <Route 
            exact path="/admin"
            element={
              user.id && user.admin ? (
                <AdminUsers to="/admin" replace /> // Redirect authenticated user.
              ) : (
                <LoginPage /> // Render RegisterPage for unauthenticated user.
              )
            }
          />
           <Route 
            exact path="/admin/monsters/:userId"
            element={
              user.id && user.admin ? (
                <AdminUserMonsters to="/admin/monsters/:userId" replace /> // Redirect authenticated user.
              ) : ( 
                <LoginPage /> // Render RegisterPage for unauthenticated user.
              )
            }
          />Z
          <Route 
            exact path="/about"
            element={
              <>
                <h2 style={{ marginTop: '120px', fontSize: '36px' }}>About Page</h2>
                <p style={{ fontSize: '20px' }}>
                <strong>Ziska's Monster Generator is an interactive tool for Dungeons & Dragons enthusiasts. It offers a blend of user customization and random generation to produce unique monsters complete with stats, abilities, and images. With an intuitive form for entering key monster parameters and a dynamic output that provides an immersive monster profile, this app enhances gameplay and storytelling for any D&D campaign.</strong>
                </p>
              </>
            }
          />
          <Route
            path="*"
            element={
              <h2>404 Page</h2>
            } 
          />
        </Routes>
      </main>
      <footer>
        <p style={{ "fontSize": '10px' }}>Copyright © {new Date().getFullYear()}</p>
      </footer>
      </Container>
  );
}


export default App;
