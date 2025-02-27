import React from 'react';
import { useNavigate } from 'react-router-dom';

function Library() {
    const navigate = useNavigate();

    return (
        <div className="container mt-4">
            <div className="row g-4">
                {/* Placeholder for Bootstrap flip cards */}
                {Array.from({ length: 3 }).map((_, idx) => (
                    <div className="col-md-4" key={idx}>
                        <div className="card">
                            <div className="card-header">
                                Monster {idx + 1}
                            </div>
                            <div className="card-body">
                                <h5 className="card-title">Monster Name Here</h5>
                                <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
            <div className="d-flex justify-content-center mt-4">
                <button className="btn btn-primary" onClick={() => navigate('/generate-monster')}>Back to Generator</button>
            </div>
        </div>
    );
}

export default Library;
