import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import useStore from '../../zustand/store';

function GenerateMonster() {
  const navigate = useNavigate();
  const addMonster = useStore(state => state.addMonster);
  const [form, setForm] = useState({
    challengeRating: '',
    acRequirements: '',
    hpLimit: '',
    environment: '',
    description: '',
    creatureType: ''
  });

  const handleChange = (e) => {
    setForm({...form, [e.target.name]: e.target.value});
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    await addMonster(form);
    navigate('/library');
  };

  return (
    <div>
      <h1>Generate a Monster</h1>
      <form onSubmit={handleSubmit}>
        <input name="challengeRating" placeholder="Challenge Rating" onChange={handleChange} />
        <input name="acRequirements" placeholder="AC Requirements" onChange={handleChange} />
        <input name="hpLimit" placeholder="HP Limit" onChange={handleChange} />
        <input name="environment" placeholder="Environment" onChange={handleChange} />
        <input name="description" placeholder="Description" onChange={handleChange} />
        <input name="creatureType" placeholder="Creature Type" onChange={handleChange} />
        <button type="submit">Generate Monster</button>
        <button onClick={() => navigate('/library')}>Back to Library</button>
      </form>
    </div>
  );
}

export default GenerateMonster;
