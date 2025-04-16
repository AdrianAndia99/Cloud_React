import { useState, useEffect } from "react";
import { Unity, useUnityContext } from "react-unity-webgl";

function Game3() {
  const { unityProvider, sendMessage } = useUnityContext({
    loaderUrl: "/MemoryCards.loader.js",
    dataUrl: "/MemoryCards.data",
    frameworkUrl: "/MemoryCards.framework.js",
    codeUrl: "/MemoryCards.wasm",
  });

  const [name, setName] = useState("");

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setName(event.target.value);
  };

  const sendName = () => {
    console.log("Nombre enviado a Unity:", name);
    sendMessage("SceneManager", "ChangeText", name);
  };

  const resetScene = () => {
    sendMessage("SceneManager", "Restart");
  };

  useEffect(() => {
    const canvas = document.querySelector("canvas");
    if (canvas) {
      canvas.setAttribute("tabindex", "-1"); // evita que Unity capture el teclado
    }
  }, []);

  return (
    <div className="centered-container">
      <div className="centered-content">
        <h1 className="centered-title">React + Unity / Tecsup</h1>

        <Unity unityProvider={unityProvider} className="centered-unity" />

        <div className="input-container" style={{ marginTop: "10px" }}>
          <input
            type="text"
            value={name}
            onChange={handleInputChange}
            placeholder="Escribe tu nombre"
            style={{ padding: "5px", marginRight: "5px" }}
          />
          <button onClick={sendName} style={{ padding: "5px", marginRight: "5px" }}>
            Enviar Nombre
          </button>
          <button onClick={resetScene} style={{ padding: "5px" }}>
            Reiniciar Juego
          </button>
        </div>
      </div>
    </div>
  );
}

export default Game3;