import axios from "axios";

axios.defaults.withCredentials = true;

const createMonsterSlice = (set, get) => ({
  monsters: [], // State property for all monsters
  monsterImages: {}, // Object to store images keyed by monster id

  // Fetch all monsters for the list view
  fetchMonsters: async () => {
    try {
      const response = await axios.get("/api/monster");
      set({ monsters: response.data });
    } catch (error) {
      console.error("Error fetching monsters:", error);
    }
  },

  // Fetch a monster's image by id
  fetchMonsterImage: async (monsterId) => {
    try {
      const response = await axios.get(`/api/monster/image/${monsterId}`);
      set((state) => ({
        monsterImages: {
          ...state.monsterImages,
          [monsterId]: response.data.image,
        },
      }));
    } catch (error) {
      console.error("Error fetching monster image:", error);
    }
  },

  // Fetch a single monster's details by id
  fetchMonsterDetail: async (monsterId) => {
    try {
      const response = await axios.get(`/api/monster/${monsterId}`);
      return response.data;
    } catch (error) {
      console.error("Error fetching monster details:", error);
      throw error;
    }
  },

  // Update a monster (e.g. its name)
  updateMonster: async (monsterId, data) => {
    try {
      const response = await axios.put(`/api/monster/edit/${monsterId}`, data);
      return response.data;
    } catch (error) {
      console.error("Error updating monster:", error);
      throw error;
    }
  },

  // Delete a monster by id
  deleteMonster: async (monsterId) => {
    try {
      await axios.delete(`/api/monster/delete/${monsterId}`);
    } catch (error) {
      console.error("Error deleting monster:", error);
      throw error;
    }
  },
});

export default createMonsterSlice;
