import React, { useState, useEffect, useRef } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Container, Card, Button, InputGroup } from "react-bootstrap";
import useStore from "../../zustand/store"; 
import "./MonsterView.css";

const MonsterView = () => {
  // Extract the monster id from the URL parameters
  const { id } = useParams();
  // useNavigate to redirect after actions (like deleting a monster)
  const navigate = useNavigate();

  // Local state to store the monster data, the flip state, and the new name value
  const [monster, setMonster] = useState(null);
  const [isFlipped, setIsFlipped] = useState(false);
  const [newName, setNewName] = useState("");

  // Create a ref to the back face of the card (for scrolling to the top when flipped)
  const backFaceRef = useRef(null);

  // Destructure functions from the global store
  const { fetchMonsterDetail, updateMonster, deleteMonster } = useStore();

  // useEffect to fetch monster details once when the component mounts
  useEffect(() => {
    async function fetchMonster() {
      try {
        // Call the store function to get monster data using the id from the URL
        const data = await fetchMonsterDetail(id);
        setMonster(data); // Set the monster state with the fetched data
        setNewName(data.name); // Initialize the newName state with the current monster name
      } catch (error) {
        console.error("Error fetching monster details:", error);
      }
    }
    fetchMonster();
  }, [id, fetchMonsterDetail]); // Re-run if the id or fetchMonsterDetail function changes

  // While the monster data is being fetched, show a loading message
  if (!monster) return <div>Loading...</div>;

  // Handler to flip the card
  const handleFlip = () => {
    setIsFlipped(!isFlipped); // Toggle the flip state
    if (backFaceRef.current) {
      // Reset the scroll position of the back face to ensure the top is visible
      backFaceRef.current.scrollTop = 0;
    }
  };

  // Handler for updating the monster's name
  const handleSubmit = async (e) => {
    e.preventDefault(); // Prevent the default form submission behavior
    try {
      // Call updateMonster from the store with the new name
      const updatedData = await updateMonster(id, { name: newName });
      // Update the local monster state with the updated data
      setMonster({ ...monster, ...updatedData });
    } catch (error) {
      console.error("Error updating monster name:", error);
    }
  };

  // Handler for deleting the monster
  const handleDelete = async () => {
    try {
      await deleteMonster(id); // Delete the monster via the store function
      navigate("/library"); // Navigate back to the library view after deletion
    } catch (error) {
      console.error("Error deleting monster:", error);
    }
  };

  // Determine if the device is mobile based on window width
  const isMobile = window.innerWidth < 768;
  // Set container height based on device type and flip state:
  // - Desktop: fixed height of 600px.
  // - Mobile: 90vw if not flipped; 150vw if flipped.
  const containerHeight = isMobile ? (isFlipped ? "100%" : "90vw") : "600px";

  return (
    <Container className="monster-view-wrapper">
      {/* Update form for changing the monster name */}
      <form onSubmit={handleSubmit} className="update-form">
        <InputGroup>
          {/* Native input element replacing Form.Control */}
          <input
            type="text"
            value={newName}
            onChange={(e) => setNewName(e.target.value)}
            placeholder="Enter new name"
            className="custom-input"
          />
          {/* Button to submit the update */}
          <Button variant="primary" type="submit" className="update-button">
            Update Name
          </Button>
        </InputGroup>
      </form>

      {/* Card wrapper to ensure consistent spacing between the card and delete button */}
      <div className="card-wrapper">
        {/* Flip container with dynamic height based on device and flip state */}
        <div className="flip-container" onClick={handleFlip} style={{ height: containerHeight }}>
          {/* Flip card which rotates when flipped */}
          <div className={`flip-card ${isFlipped ? "flipped" : ""}`}>
            {/* Front Face of the card */}
            <div className="face front-face">
              <Card className="h-100">
                {/* Card image */}
                <Card.Img variant="top" src={monster.image_url} className="monster-image" />
                {/* Overlay displaying the monster name */}
                <Card.Body className="monster-name-overlay p-2">
                  <Card.Title>{monster.name}</Card.Title>
                </Card.Body>
              </Card>
            </div>

            {/* Back Face of the card */}
            <div className="face back-face" ref={backFaceRef}>
              <Card className="h-100">
                <Card.Body className="back-content">
                  {/* Header section with monster name, size, and alignment */}
                  <div className="header-section">
                    <Card.Title>{monster.name}</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">
                      {monster.size} | {monster.alignment}
                    </Card.Subtitle>
                  </div>
                  {/* Stats section displaying key numerical attributes */}
                  <div className="stats-section d-flex flex-wrap justify-content-between">
                    <div className="stat"><strong>HP:</strong> {monster.hit_points}</div>
                    <div className="stat"><strong>Initiative:</strong> {monster.initiative}</div>
                    <div className="stat"><strong>Speed:</strong> {monster.speed}</div>
                    <div className="stat"><strong>Prof.:</strong> {monster.proficiency_bonus}</div>
                    <div className="stat"><strong>AC:</strong> {monster.armor_class}</div>
                  </div>
                  {/* Abilities section */}
                  <div className="abilities-section d-flex flex-wrap justify-content-between">
                    <div className="ability"><strong>STR:</strong> {monster.strength}</div>
                    <div className="ability"><strong>DEX:</strong> {monster.dexterity}</div>
                    <div className="ability"><strong>CON:</strong> {monster.constitution}</div>
                    <div className="ability"><strong>INT:</strong> {monster.intelligence}</div>
                    <div className="ability"><strong>WIS:</strong> {monster.wisdom}</div>
                    <div className="ability"><strong>CHA:</strong> {monster.charisma}</div>
                  </div>
                  {/* Attributes section with additional info */}
                  <div className="attributes-section">
                    <div className="attribute">
                      <strong>Resistances:</strong> {monster.resistances.replace(/^\[|\]$/g, "")}
                    </div>
                    <div className="attribute">
                      <strong>Immunities:</strong> {monster.immunities.replace(/^\[|\]$/g, "")}
                    </div>
                    <div className="attribute">
                      <strong>Languages:</strong> {monster.languages.replace(/^\[|\]$/g, "")}
                    </div>
                    <div className="attribute">
                      <strong>Skills:</strong> {monster.skills.replace(/^\[|\]$/g, "")}
                    </div>
                    <div className="attribute">
                      <strong>Senses:</strong> {monster.senses.replace(/^\[|\]$/g, "")}
                    </div>
                    <div className="attribute">
                      <strong>Saving Throws:</strong> {monster.saving_throws.replace(/^\[|\]$/g, "")}
                    </div>
                  </div>
                  {/* Actions section */}
                  <div className="actions-section mt-2">
                    <div className="section-title"><strong>Actions:</strong></div>
                    <div className="action">{monster.actions.replace(/^\[|\]$/g, "")}</div>
                  </div>
                  {/* Legendary Actions section (if present) */}
                  {monster.ledgendary_actions && (
                    <div className="actions-section mt-2">
                      <div className="section-title"><strong>Legendary Actions:</strong></div>
                      <div className="action">{monster.ledgendary_actions.replace(/^\[|\]$/g, "")}</div>
                    </div>
                  )}
                  {/* Description section */}
                  <div className="description-section mt-2">
                    <Card.Text className="description">
                      {monster.description}
                    </Card.Text>
                  </div>
                </Card.Body>
              </Card>
            </div>
          </div>
        </div>
      </div>

      {/* Delete button below the card */}
      <Button variant="danger" onClick={handleDelete} className="delete-button">
        Delete Monster
      </Button>
    </Container>
  );
};

export default MonsterView;
