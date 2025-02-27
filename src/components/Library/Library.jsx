import React from 'react';
import { useNavigate } from 'react-router-dom';
import { useStore } from '../../zustand/store';
function Library() {
    const navigate = useNavigate();
    const monsters = useStore((store) => store.monster);
    const fetchMonsters = useStore((store) => store.fetchMonsters);


    useEffect(() => {
        fetchMovies();
      }, []);
    
      const handleClick = (id) => {
        navigate(`/monster-card/${id}`);
      };


    return (
            <main>
              <h1>Movie List</h1>
              <div className="monster-grid">
                {monsters.map((monster) => (
                  <div className="monster-card" data-testid="monsterItem" key={monster.id}>
                    <img
                      src={monster.image_url}
                      alt={monster.name}
                      onClick={() => handleClick(monster.id)}
                    />
                    <h5>{monster.name}</h5>
                  </div>
                ))}
              </div>
        
              <div className="d-flex justify-content-center mt-4">
                <button className="btn btn-primary" onClick={() => navigate("/generate-monster")}>
                  Back to Generator
                </button>
              </div>
            </main>
          );
        };

export default Library;


