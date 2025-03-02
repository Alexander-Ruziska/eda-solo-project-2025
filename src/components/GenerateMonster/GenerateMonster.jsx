import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import LoadingPage from '../LoadingPage/LoadingPage';

function GenerateMonster() {
  const navigate = useNavigate();
  const [form, setForm] = useState({
    name: '',
    challengeRating: '',
    acRequirements: '',
    environment: '',
    resistances: '',
    creatureType: ''
  });
  const [loading, setLoading] = useState(false);

  const handleChange = (event) => {
    const { name, value } = event.target;
    setForm((prevForm) => ({
      ...prevForm,
      [name]: value,
    }));
  };
  

  const handleSubmit = async (e) => {
    e.preventDefault();
    const monsterData = {
      name: form.name,
      challenge_rating: form.challengeRating,
      armor_class: form.acRequirements,
      environment: form.environment,
      resistances: form.resistances,
      type: form.creatureType
    };

    setLoading(true);
    try {
      // Expecting the new monster object to be returned with an `id` property
      const { data: newMonster } = await axios.post('/api/monster', monsterData);
      // Navigate to the newly created monster's view using its id
      navigate(`/monster/${newMonster.id}`);
    } catch (error) {
      console.error("Error creating monster:", error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <LoadingPage />;
  }

  return (
    <div>
      <h1>Generate a Monster</h1>
      <form onSubmit={handleSubmit}>
        <input name="name" placeholder="Monster Name" onChange={handleChange} value={form.name}/>
        <input name="challengeRating" placeholder="Challenge Rating" onChange={handleChange} value={form.challengeRating}/>
        <input name="acRequirements" placeholder="AC Requirements" onChange={handleChange} value={form.acRequirements}/>
        <input name="environment" placeholder="Environment" onChange={handleChange} value={form.environment}/>
        <input name="resistances" placeholder="Resistances" onChange={handleChange} value={form.resistances}/>
        <input name="creatureType" placeholder="Creature Type" onChange={handleChange} value={form.creatureType}/>
        <button type="submit">Generate Monster</button>
        <button type="button" onClick={() => navigate('/library')}>
          Go to Library
        </button>
      </form>
    </div>
  );
}


export default GenerateMonster;
