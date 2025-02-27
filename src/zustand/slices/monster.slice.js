import axios from 'axios';

// All requests made with axios will include credentials, which means
// the cookie that corresponds with the session will be sent along
// inside every request's header
axios.defaults.withCredentials = true;


const createMonsterSlice = (set, get) => ({
  monsterImage: {},
  fetchMonsterById: async (monsterId) => {
    //  Retrieves the current user's data from the /api/user endpoint.
    try {
      const response = await axios.get(`/api/monster/image/${monsterId}`);
      console.log('response data', typeof response.data.image);
      set({ monsterImage: response.data.image });
    } catch (err) {
      console.log('fetchMonster error:', err);
      set({monster : {}});
    }
  
  }
})


export default createMonsterSlice;
