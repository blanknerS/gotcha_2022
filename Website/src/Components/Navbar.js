import React from "react";
import "./Navbar.css";
import GotchaLogo from "../Assets/gotcha-logo.png";
import MenuIcon from "../Assets/menu-icon-3.png";
import { useNavigate, useLocation } from "react-router-dom";

function Navbar() {
  const navigate = useNavigate();
  const location = useLocation();

  const handleClick = () => {
    if (location.pathname == "/login") {
      alert("Please login.");
    } else if (location.pathname !== "/stats") {
      navigate("/stats");
    } else {
      navigate("/");
    }
  };

  return (
    <div className="Navbar">
      <div className="gotcha-header">
        <img className="header-icon" src={GotchaLogo} alt="" />
        <h1>Gotcha</h1>
      </div>

      <div className="nav-links">
        <img
          className="menu-icon"
          src={MenuIcon}
          onClick={handleClick}
          alt=""
        />
        
      </div>
    </div>
  );
}

export default Navbar;
