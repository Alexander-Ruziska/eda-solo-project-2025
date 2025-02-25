const express = require("express");
const OpenAI = require("openai"); 
const pool = require("../modules/pool.js");
const router = express.Router();
const axios = require("axios"); 
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
    console.log("Received name:", name);

    // Generate monster JSON data
    const response = await openai.chat.completions.create({
      model: "gpt-4o",
      messages: [
        { role: "system", content: "You are a dungeon master. Reply strictly in JSON format with all required fields." },
        { role: "user", content: `Create a monster named ${name}` }
      ],
      tools: [
        {
          type: "function",
          function: {
            name: "generate_monster",
            parameters: {
              type: "object",
              properties: {
                type: {type: "string"},
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
      tool_choice: "auto"
    });

    // Extract and parse OpenAI's response
    const toolCall = response.choices?.[0]?.message?.tool_calls?.[0]?.function?.arguments;
    if (!toolCall) throw new Error("Missing OpenAI response data");

     req.body = JSON.parse(toolCall); // Extract monster details

    // Generate an image based on the monster description
    const imageResponse = await openai.images.generate({
      model: "dall-e-3",
      prompt: `A detailed fantasy monster called ${req.body.name}. Description: ${req.body.description}. It is a ${req.body.size} ${req.body.creature_type} with a challenge rating of ${req.body.challenge_rating}.`,
      size: "1024x1024",
      n: 1
    });

    const imageUrl = imageResponse.data[0].url; // Extract the image URL

    // Fetch the image and convert it to Base64
    const imageResponseData = await axios.get(imageUrl, { responseType: "arraybuffer" });
    const base64Image = Buffer.from(imageResponseData.data).toString("base64");

    // Send the final response with JSON data and the Base64 image
    res.json({
      ...req.body,
      image_base64: `data:image/png;base64,${base64Image}` // Base64-encoded image string
    });

  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ error: "Failed to generate monster and image" });
  }
});

// // Get all monsters
router.get("/", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM monster ORDER BY id DESC");
    res.json(result.rows);
  } catch {
    res.status(500).json({ error: "Error fetching monsters" });
  }
});

router.put('/rename/:id', async (req, res) => {
  const { monsterId, newName } = req.body;
  await pool.query(`UPDATE "monster" SET "name" =  $1 WHERE id = $2`, [newName, monsterId]);
  res.json({ message: "Monster Name Updated!" });
});



module.exports = router;
