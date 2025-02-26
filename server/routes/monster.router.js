const express = require("express");
const OpenAI = require("openai"); 
const pool = require("../modules/pool.js");
const router = express.Router();
const axios = require("axios"); 
const { Pool } = require("pg");
// const fs = require("fs");
const {rejectUnauthenticated} = require("../modules/authentication-middleware.js");
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY, // API key from .env
});

router.post("/save", rejectUnauthenticated, async (req, res) => {
    //TODO: this is where we will make a call to cloudinary to send the 'big ass file'
    //we will wait for the response object, and use the img_url to persist to the monster table

    console.log(req.body);
    try {
        const insertQuery = `
      INSERT INTO monster (
        user_id, type, image_base64, name, description, strength, dexterity, constitution, intelligence,
        wisdom, charisma, armor_class, initiative, speed, actions, legendary_actions, resistances, immunities,
        languages, skills, senses, saving_throws, challenge_rating, size, alignment, proficiency_bonus
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23,
        $24, $25, $26)
      RETURNING *;
    `;
    const values = [
        req.user.id, req.body.type, req.body.image_base64, req.body.name, req.body.description, req.body.strength, req.body.dexterity,
        req.body.constitution, req.body.intelligence, req.body.wisdom, req.body.charisma, req.body.armor_class,
        req.body.initiative, req.body.speed, JSON.stringify(req.body.actions), JSON.stringify(req.body.legendary_actions), JSON.stringify(req.body.resistances), JSON.stringify(req.body.immunities),
        JSON.stringify(req.body.languages), JSON.stringify(req.body.skills), JSON.stringify(req.body.senses), JSON.stringify(req.body.saving_throws), req.body.challenge_rating, req.body.size,
         req.body.alignment, req.body.proficiency_bonus
      ];
    
      const result = await pool.query(insertQuery, values);
      
      res.send(result.rows);
    
    } catch (error) {
        console.log('Error saving monster', error);
        res.sendStatus(500);
    }
  });

  router.post("/", async (req, res) => {
    try {
      const { name } = req.body;
      const { challenge_rating } = req.body;
      const { armor_class } = req.body;
      const { environment } = req.body;
      const { resistances } = req.body;
      const { type } = req.body;
      console.log("Received name:", name);
  
      
      const response = await openai.chat.completions.create({
        model: "gpt-4o",
        messages: [
          { role: "system", content: "You are a dungeon master for Dungeons and Dragons 5th Edition 2014 rules. Reply strictly in JSON format with all required fields." },
          { role: "user", content: `Create a high-quality fantasy illustration of a monster for Dungeons & Dragons 5e.

          - Name: ${name}
          - Type: ${type}
          - Challenge Rating: ${challenge_rating}
          - Armor Class: ${armor_class}
          - Environment: ${environment}
          - Resistances: ${resistances}
          The creature should match the lore, style, and design of classic D&D 5e artwork, similar to the Monster Manual. It should have intricate details, a dynamic pose, and a background that reflects its environment.
          Use a realistic yet fantastical art style with dramatic lighting, emphasizing its power, abilities, and unique traits.
          Ensure the monster looks game-ready for a D&D campaign, with clear visual indicators of its strengths, weaknesses, and habitat.` }
        ],
        tools: [
          {
            type: "function",
            function: {
              name: "generate_monster",
              parameters: {
                type: "object",
                properties: {
                  type: { type: "string" },
                  name: { type: "string" },
                  description: { type: "string" },
                  strength: { type: "integer" },
                  dexterity: { type: "integer" },
                  constitution: { type: "integer" },
                  intelligence: { type: "integer" },
                  wisdom: { type: "integer" },
                  charisma: { type: "integer" },
                  speed: { type: "string" },
                  actions: { type: "array", items: { type: "string" } },
                  legendary_actions: { type: "array", items: { type: "string" } },
                  armor_class: { type: "integer" },
                  resistances: { type: "array", items: { type: "string" } },
                  immunities: { type: "array", items: { type: "string" } },
                  languages: { type: "array", items: { type: "string" } },
                  senses: { type: "array", items: { type: "string" } },
                  skills: { type: "array", items: { type: "string" } },
                  saving_throws: { type: "array", items: { type: "string" } },
                  challenge_rating: { type: "string" },
                  size: { type: "string" },
                  proficiency_bonus: { type: "string" },
                  creature_type: { type: "string" },
                  alignment: { type: "string" },
                  initiative: { type: "integer" }
                },
                required: [
                  "name", "description", "strength", "dexterity", "constitution",
                  "intelligence", "wisdom", "charisma", "speed", "actions",
                  "legendary_actions", "armor_class", "resistances", "immunities",
                  "languages", "senses", "skills", "saving_throws",
                  "challenge_rating", "size", "creature_type", "alignment", "initiative"
                ]
              }
            }
          }
        ],
        tool_choice: { type: "function", function: { name: "generate_monster" } } 
      });
  
    
      const toolCall = response?.choices?.[0]?.message?.tool_calls?.[0]?.function?.arguments;
      if (!toolCall) {
        console.error("OpenAI response missing tool_calls:", response);
        return res.status(500).json({ error: "Failed to generate monster data. Please try again." });
      }
  
      req.body = JSON.parse(toolCall); 
      console.log("Generated monster:", req.body);
  
      
      const imageResponse = await openai.images.generate({
        model: "dall-e-3",
        prompt: `${req.body.description}. Do not render text or anything that resembles text.`,
        size: "1024x1024",
        n: 1
      });
  
      const imageUrl = imageResponse.data[0].url; 
  
      
      res.json({
        ...req.body,
        image_url: imageUrl
      });
  
    } catch (error) {
      console.error("Error:", error);
      res.status(500).json({ error: "Failed to generate monster and image" });
    }
  });
  

module.exports = router;

// // // Get all monsters
// router.get("/", async (req, res) => {
//   try {
//     const result = await pool.query("SELECT * FROM monster ORDER BY id DESC");
//     res.json(result.rows);
//   } catch {
//     res.status(500).json({ error: "Error fetching monsters" });
//   }
// });

// router.put('/rename/:id', async (req, res) => {
//   const { monsterId, newName } = req.body;
//   await pool.query(`UPDATE "monster" SET "name" =  $1 WHERE id = $2`, [newName, monsterId]);
//   res.json({ message: "Monster Name Updated!" });
// });



// module.exports = router;

