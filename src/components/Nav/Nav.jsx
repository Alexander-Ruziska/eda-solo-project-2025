import { Col, Row } from "react-bootstrap";
import Container from "react-bootstrap/Container";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import NavDropdown from "react-bootstrap/NavDropdown";
import { NavLink } from 'react-router-dom';
import { useState } from "react";

function BasicExample() {
  const [expanded, setExpanded] = useState(false);
  return (

      <Col>
        <Navbar expanded={expanded} onToggle={() => setExpanded(!expanded)} collapseOnSelect expand="lg" className="bg-body-tertiary" fixed="top">
          <Container fluid>
            <Navbar.Brand href="#home">Ziska's Monster Generator</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
              <Nav className="me-auto">
              <Nav.Item>
                  <NavLink className="nav-link" to="/login" onClick={() => setExpanded(false)}>Login</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/registration" onClick={() => setExpanded(false)}>Register</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/landing" onClick={() => setExpanded(false)}>Home</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/generate-monster" onClick={() => setExpanded(false)}>Create Monster</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/library" onClick={() => setExpanded(false)}>Library</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/create-campaign" onClick={() => setExpanded(false)}>Create a Campaign</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/campaign-select" onClick={() => setExpanded(false)}>Campaign Select</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/admin" onClick={() => setExpanded(false)}>Admin</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/about" onClick={() => setExpanded(false)}>About</NavLink>
                </Nav.Item>
                <Nav.Link href="#link">Link</Nav.Link>
                <NavDropdown title="Dropdown" id="basic-nav-dropdown">
                  <NavDropdown.Item href="#action/3.1">Action</NavDropdown.Item>
                  <NavDropdown.Item href="#action/3.2">
                    Another action
                  </NavDropdown.Item>
                  <NavDropdown.Item href="#action/3.3">
                    Something
                  </NavDropdown.Item>
                  <NavDropdown.Divider />
                  <NavDropdown.Item href="#action/3.4">
                    Separated link
                  </NavDropdown.Item>
                </NavDropdown>
              </Nav>
            </Navbar.Collapse>
          </Container>
        </Navbar>
        </Col>
    
    
  );
}

export default BasicExample;
