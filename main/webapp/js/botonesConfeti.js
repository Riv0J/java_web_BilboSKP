import React from "react";
import ReactDOM from "react-dom";
import confetti from "canvas-confetti";

function App() {
  function onClick() {
    confetti({
      particleCount: 150,
      spread: 60
    });
  }

  return (
    <button className="button" onClick={onClick}>
      <span>Comprar ya</span>
    </button>
  );
}

ReactDOM.render(<App />, document.getElementById("boton"));