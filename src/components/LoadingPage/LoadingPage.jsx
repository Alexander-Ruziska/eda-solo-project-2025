import { useState, useEffect } from "react";
import "./LoadingPage.css"; 
import { Container, Card, Button, InputGroup } from "react-bootstrap";

const LoadingPage = () => {
    const facts = [
        "Tiamat, the five-headed dragon goddess, embodies chaos and destruction, commanding legions of dragons to wreak havoc across the realms.",
        "Rangers are expert trackers and survivalists, mastering the art of combat in natural settings and forming deep bonds with their animal companions.",
        "The Weave is the invisible tapestry of magic that connects all life, enabling spellcasters to shape reality with their incantations.",
        "Acolytes devote themselves to their gods, preserving sacred rituals and ancient wisdom in temples and monasteries scattered throughout the lands.",
        "Paladins swear sacred oaths to deities, combining martial prowess with divine magic to fight evil and uphold justice in a corrupt world.",
        "Halflings, though small in stature, are known for their resourcefulness, bravery, and uncanny ability to bring luck to their adventuring parties.",
        "Beholders, with their single central eye and many eyestalks, use their deadly rays to manipulate gravity and disrupt spells.",
        "Dwarves are renowned for their craftsmanship and resilience, often building grand underground fortresses filled with intricate architecture and lore.",
        "In the Forgotten Realms, ancient empires rose and fell, leaving behind ruins full of lost magic and deadly traps.",
        "The Raven Queen, shrouded in mystery, rules the Shadowfell and oversees the passage of souls, ensuring the balance between life and death.",
        "Bards use music, lore, and magic to inspire allies and confound enemies, making them versatile adventurers both on and off the battlefield.",
        "Wizards dedicate their lives to the study of arcane lore, meticulously researching spells and secrets hidden in ancient grimoires and dusty libraries.",
        "Sorcerers draw magic from within, their abilities often stemming from a mystical bloodline that grants them raw, unpredictable power.",
        "Mind flayers, with their squid-like heads, seek to control the minds of others, often forming sinister hive minds to rule entire cities.",
        "The multiverse of Dungeons & Dragons is vast, with countless planes of existence where gods, demons, and mortals engage in epic battles of magic and might.",
        "Dragons vary in temperament, from noble metallic dragons who protect the weak to fearsome chromatic dragons who terrorize villages.",
        "Warlocks make pacts with otherworldly entities, trading loyalty for dark powers that allow them to cast spells in exchange for their service.",
        "Liches achieve immortality by binding their souls to phylacteries, turning themselves into powerful undead beings with vast magical knowledge.",
        "Drow, the dark elves of the Underdark, are skilled in both magic and combat, thriving in treacherous societies ruled by deities like Lolth.",
        "Goblins are crafty and often underestimated, using their agility and cunning to survive in harsh environments and launch surprise attacks."
      ];
      

  const [fact, setFact] = useState("");

  useEffect(() => {
    // Set an initial random fact.
    setFact(facts[Math.floor(Math.random() * facts.length)]);

    // Update the fact every 3 seconds.
    const intervalId = setInterval(() => {
      setFact(facts[Math.floor(Math.random() * facts.length)]);
    }, 10000);

    // Clear the interval on component unmount.
    return () => clearInterval(intervalId);
  }, [facts]);

  return (
    <div className="containerLoading">
      <h6 style={{ marginTop: '100px', textAlign: 'center', marginBottom: '20px', paddingRightRight: '0px' }}>Your Monster is being generated!</h6>
      <Card style={{ maxWidth: '500px', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
  <Card.Img
    variant="top"
    src="/Images/da1c5863-7671-4878-856d-48e394fb3e46.webp"
    style={{ width: '100%', maxWidth: '500px', height: 'auto' }}/>
    
</Card>


<h5 className="col-lg-12">Did you know? {fact}</h5>
    </div>
  );
};

export default LoadingPage;
