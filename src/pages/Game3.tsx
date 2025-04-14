import {Unity, useUnityContext} from "react-unity-webgl";

function Game3() {
    const { unityProvider,sendMessage } = useUnityContext({
        loaderUrl: "/MemoryCards.loader.js",
        dataUrl: "/MemoryCards.data",
        frameworkUrl: "/MemoryCards.framework.js",
        codeUrl: "/MemoryCards.wasm",
    });

    let name: string = "Adrian Andia";
    function resetScene() 
    {
      sendMessage("SceneManager", "Restart"); 
    }
  function sendName() 
  {
    sendMessage("SceneManager", "ChangeText", name);
  }

    return (
        <>
            <div className="centered-container">
                <div className="centered-content">
                    <h1 className="centered-title">React + Unity / Tecsup</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />
                    <div className="centered-content">
                        <button onClick={resetScene}>Restart Game</button>
                        <button onClick={sendName}>Name Click</button>
                    </div>
                </div>
            </div>

        </>
    );
}


export default Game3