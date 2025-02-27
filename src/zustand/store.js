import { create } from "zustand";
import userSlice from './slices/user.slice.js';
import monsterSlice from './slices/monster.slice.js'


// Combine all slices in the store:
const useStore = create((...args) => ({
  ...userSlice(...args),
  ...monsterSlice(...args)
}))


export default useStore;
