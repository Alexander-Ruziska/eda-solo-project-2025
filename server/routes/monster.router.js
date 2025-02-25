const express = require("express");
const OpenAI = require("openai"); // <-- FIXED IMPORT
const pool = require("../modules/pool.js");
const router = express.Router();
// Initialize OpenAI (Correct Way)
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY, // API key from .env
});


const axios = require("axios"); // Ensure axios is installed to fetch image data
const fs = require("fs");

router.post("/generate", async (req, res) => {
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

    const monsterData = JSON.parse(toolCall); // Extract monster details

    // Generate an image based on the monster description
    const imageResponse = await openai.images.generate({
      model: "dall-e-3",
      prompt: `A detailed fantasy monster called ${monsterData.name}. Description: ${monsterData.description}. It is a ${monsterData.size} ${monsterData.creature_type} with a challenge rating of ${monsterData.challenge_rating}.`,
      size: "1024x1024",
      n: 1
    });

    const imageUrl = imageResponse.data[0].url; // Extract the image URL

    // Fetch the image and convert it to Base64
    const imageResponseData = await axios.get(imageUrl, { responseType: "arraybuffer" });
    const base64Image = Buffer.from(imageResponseData.data).toString("base64");

    // Send the final response with JSON data and the Base64 image
    res.json({
      ...monsterData,
      image_base64: `data:image/png;base64,${base64Image}` // Base64-encoded image string
    });

  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ error: "Failed to generate monster and image" });
  }
});

// Get all monsters
router.get("/", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM monster ORDER BY id DESC");
    res.json(result.rows);
  } catch {
    res.status(500).json({ error: "Error fetching monsters" });
  }
});

module.exports = router;
