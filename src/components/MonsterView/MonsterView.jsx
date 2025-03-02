import React, { useState, useEffect, useRef } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Container, Card, Button, Form, InputGroup } from "react-bootstrap";
import useStore from "../../zustand/store"; // Adjust path as needed
import "./MonsterView.css";

const MonsterView = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [monster, setMonster] = useState(null);
  const [isFlipped, setIsFlipped] = useState(false);
  const [newName, setNewName] = useState("");
  const backFaceRef = useRef(null);

  const { fetchMonsterDetail, updateMonster, deleteMonster } = useStore();

  useEffect(() => {
    async function fetchMonster() {
      try {
        const data = await fetchMonsterDetail(id);
        setMonster(data);
        setNewName(data.name);
      } catch (error) {
        console.error("Error fetching monster details:", error);
      }
    }
    fetchMonster();
  }, [id, fetchMonsterDetail]);

  if (!monster) return <div>Loading...</div>;

  const handleFlip = () => {
    setIsFlipped(!isFlipped);
    if (backFaceRef.current) backFaceRef.current.scrollTop = 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const updatedData = await updateMonster(id, { name: newName });
      setMonster({ ...monster, ...updatedData });
    } catch (error) {
      console.error("Error updating monster name:", error);
    }
  };

  const handleDelete = async () => {
    try {
      await deleteMonster(id);
      navigate("/library");
    } catch (error) {
      console.error("Error deleting monster:", error);
    }
  };

  // Set container height: desktop fixed at 600px; mobile: 90vw unflipped, 150vw flipped.
  const isMobile = window.innerWidth < 768;
  const containerHeight = isMobile ? (isFlipped ? "150vw" : "90vw") : "600px";

  return (
    <Container className="monster-view-wrapper">
      <Form onSubmit={handleSubmit} className="update-form">
        <InputGroup>
          <Form.Control
            type="text"
            value={newName}
            onChange={(e) => setNewName(e.target.value)}
            placeholder="Enter new name"
          />
          <Button variant="primary" type="submit" className="update-button">
            Update Name
          </Button>
        </InputGroup>
      </Form>

      {/* Wrapper to ensure consistent spacing below the card */}
      <div className="card-wrapper">
        <div
          className="flip-container"
          onClick={handleFlip}
          style={{ height: containerHeight }}
        >
          <div className={`flip-card ${isFlipped ? "flipped" : ""}`}>
            {/* Front Face */}
            <div className="face front-face">
              <Card className="h-100">
                <Card.Img variant="top" src={monster.image_url} className="monster-image"/>
                <Card.Body className="monster-name-overlay p-2">
                  <Card.Title>{monster.name}</Card.Title>
                </Card.Body>
              </Card>
            </div>

            {/* Back Face */}
            <div className="face back-face" ref={backFaceRef}>
              <Card className="h-100">
                <Card.Body className="back-content">
                  <div className="header-section">
                    <Card.Title>{monster.name}</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">
                      {monster.size} | {monster.alignment}
                    </Card.Subtitle>
                  </div>
                  <div className="stats-section d-flex flex-wrap justify-content-between">
                    <div className="stat"><strong>HP:</strong> {monster.hit_points}</div>
                    <div className="stat"><strong>Initiative:</strong> {monster.initiative}</div>
                    <div className="stat"><strong>Speed:</strong> {monster.speed}</div>
                    <div className="stat"><strong>Prof.:</strong> {monster.proficiency_bonus}</div>
                    <div className="stat"><strong>AC:</strong> {monster.armor_class}</div>
                  </div>
                  <div className="abilities-section d-flex flex-wrap justify-content-between">
                    <div className="ability"><strong>STR:</strong> {monster.strength}</div>
                    <div className="ability"><strong>DEX:</strong> {monster.dexterity}</div>
                    <div className="ability"><strong>CON:</strong> {monster.constitution}</div>
                    <div className="ability"><strong>INT:</strong> {monster.intelligence}</div>
                    <div className="ability"><strong>WIS:</strong> {monster.wisdom}</div>
                    <div className="ability"><strong>CHA:</strong> {monster.charisma}</div>
                  </div>
                  <div className="attributes-section">
                    <div className="attribute"><strong>Resistances:</strong> {monster.resistances.replace(/^\[|\]$/g, "")}</div>
                    <div className="attribute"><strong>Immunities:</strong> {monster.immunities.replace(/^\[|\]$/g, "")}</div>
                    <div className="attribute"><strong>Languages:</strong> {monster.languages.replace(/^\[|\]$/g, "")}</div>
                    <div className="attribute"><strong>Skills:</strong> {monster.skills.replace(/^\[|\]$/g, "")}</div>
                    <div className="attribute"><strong>Senses:</strong> {monster.senses.replace(/^\[|\]$/g, "")}</div>
                    <div className="attribute"><strong>Saving Throws:</strong> {monster.saving_throws.replace(/^\[|\]$/g, "")}</div>
                  </div>
                  <div className="actions-section mt-2">
                    <div className="section-title">Actions</div>
                    <div className="action">{monster.actions.replace(/^\[|\]$/g, "")}</div>
                  </div>
                    {monster.ledgendary_actions && (
                    <div className="actions-section mt-2">
                      <div className="section-title">Legendary Actions</div>
                      <div className="action">
                        {monster.ledgendary_actions.replace(/^\[|\]$/g, "")}
                      </div>
                    </div>
                  )}
                  <div className="description-section mt-2">
                    <Card.Text className="description">{monster.description}</Card.Text>
                  </div>
                </Card.Body>
              </Card>
            </div>
          </div>
        </div>
      </div>

      <Button variant="danger" onClick={handleDelete} className="delete-button">
        Delete Monster
      </Button>
    </Container>
  );
};

export default MonsterView;
