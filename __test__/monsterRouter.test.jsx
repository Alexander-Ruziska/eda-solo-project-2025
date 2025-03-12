// import { describe, it, expect, vi, beforeEach, afterEach } from "vitest";
// import { pool } from "../server/modules/pool"; 
// import cloudinary from "cloudinary";
// import axios from "axios";
// import handler from "../server/routes/monster.router"; 
// import "dotenv/config";

// // 🔹 Mock OpenAI API
// vi.mock("openai", () => {
//   return {
//     default: class OpenAI {
//       constructor() {} // No API key required
//       chat = {
//         completions: {
//           create: vi.fn(() => Promise.resolve({
//             choices: [
//               {
//                 message: {
//                   content: JSON.stringify({
//                     hit_points: 50,
//                     type: "Beast",
//                     name: "Night Stalker",
//                     description: "A fearsome shadowy predator",
//                     strength: 18,
//                     dexterity: 14,
//                     constitution: 16,
//                     intelligence: 8,
//                     wisdom: 12,
//                     charisma: 10,
//                     speed: "40 ft",
//                     actions: "Multiattack, Claw, Bite",
//                     legendary_actions: "Shadow Leap",
//                     armor_class: 15,
//                     resistances: "Fire",
//                     immunities: "Poison",
//                     languages: "Abyssal, Common",
//                     senses: "Darkvision 60 ft",
//                     skills: "Stealth +5, Perception +4",
//                     saving_throws: "Dex +3, Con +5",
//                     challenge_rating: "5",
//                     size: "Large",
//                     proficiency_bonus: "+3",
//                     creature_type: "Beast",
//                     alignment: "Chaotic Evil",
//                     initiative: 2,
//                   }),
//                 },
//               },
//             ],
//           })),
//         },
//       };
//       images = {
//         generate: vi.fn(() => Promise.resolve({
//           data: [{ url: "https://dummyimage.com/monster.png" }],
//         })),
//       };
//     }
//   };
// });

// // 🔹 Mock Cloudinary API
// vi.mock("cloudinary", () => ({
//   uploader: {
//     upload: vi.fn(() => Promise.resolve({
//       secure_url: "https://cloudinary.com/monster.png",
//     })),
//   },
// }));

// // 🔹 Mock Axios for Image Fetching
// vi.mock("axios", () => ({
//   get: vi.fn(() => Promise.resolve({ data: "fake-image-buffer" })),
// }));

// // 🔹 Mock Database Queries
// vi.mock("../server/modules/pool", () => ({
//   pool: {
//     query: vi.fn(() => Promise.resolve({
//       rows: [{ id: 1, name: "Night Stalker", image_url: "https://cloudinary.com/monster.png" }],
//     })),
//   },
// }));

// describe("Monster API", () => {
//   let req, res;

//   beforeEach(() => {
//     vi.clearAllMocks();

//     req = {
//       body: {
//         name: "Night Stalker",
//         challenge_rating: "5",
//         armor_class: 15,
//         environment: "Forest",
//         resistances: "Fire",
//         type: "Beast",
//       },
//       user: { id: 123 }, // Mock user ID
//     };

//     res = {
//       json: vi.fn(),
//       status: vi.fn().mockReturnThis(),
//     };
//   });

//   it("should create a monster and return the stored data", async () => {
//     await handler(req, res); // 

//     expect(res.status).not.toHaveBeenCalled(); // No error expected
//     expect(res.json).toHaveBeenCalledWith(
//       expect.objectContaining({
//         id: 1,
//         name: "Night Stalker",
//         image_url: "https://cloudinary.com/monster.png",
//       })
//     );

//     expect(pool.query).toHaveBeenCalled();
//     expect(cloudinary.uploader.upload).toHaveBeenCalled();
//     expect(axios.get).toHaveBeenCalled();
//   });

//   it("should return an error if OpenAI fails", async () => {
//     openai.chat.completions.create.mockRejectedValueOnce(new Error("OpenAI Error"));

//     await handler(req, res);

//     expect(res.status).toHaveBeenCalledWith(500);
//     expect(res.json).toHaveBeenCalledWith({ error: "Failed to generate monster and image" });
//   });

//   it("should return an error if required fields are missing", async () => {
//     req.body = {}; // Empty request

//     await handler(req, res);

//     expect(res.status).toHaveBeenCalledWith(500);
//     expect(res.json).toHaveBeenCalledWith({ error: "Failed to generate monster and image" });
//   });
// });
