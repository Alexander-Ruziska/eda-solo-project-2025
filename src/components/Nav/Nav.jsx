import { Col, Row } from "react-bootstrap";
import Container from "react-bootstrap/Container";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import NavDropdown from "react-bootstrap/NavDropdown";
import { NavLink } from 'react-router-dom';

function BasicExample() {
  return (
    <header>
      <Col>
        <Navbar expand="lg" className="bg-body-tertiary" sticky="top">
          <Container fluid>
            <Navbar.Brand href="#home">Ziska's Monster Generator</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
              <Nav className="me-auto">
              <Nav.Item>
                  <NavLink className="nav-link" to="/login">Login</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/registration">Register</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/landing">Home</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/generate-monster">Create Monster</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/library">Library</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/create-campaign">Create a Campaign</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/campaign-select">Campaign Select</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/admin">Admin</NavLink>
                </Nav.Item>
                <Nav.Item>
                  <NavLink className="nav-link" to="/about">About</NavLink>
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
    </header>
  );
}

export default BasicExample;
