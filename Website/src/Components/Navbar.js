import React from "react";
import "./Navbar.css";
import GotchaLogo from "../Assets/gotcha-logo.png";
import MenuIcon from "../Assets/menu-icon-3.png"

function Navbar() {
  return (
    <div className="Navbar">
      <div className="gotcha-header">
        <img className="header-icon" src={GotchaLogo} alt="" />
        <h1>Gotcha</h1>
      </div>

      <img className="menu-icon" src={MenuIcon} alt="" />

      
    </div>
  );
}

export default Navbar;

