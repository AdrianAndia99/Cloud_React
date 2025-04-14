import {Unity, useUnityContext} from "react-unity-webgl";

function Game3() {
    const { unityProvider } = useUnityContext({
        loaderUrl: "/MemoryCards.loader.js",
        dataUrl: "/MemoryCards.data",
        frameworkUrl: "/MemoryCards.framework.js",
        codeUrl: "/MemoryCards.wasm",
    });

    return (
        <>
            <div className="centered-container">
                <div className="centered-content">
                    <h1 className="centered-title">React + Unity / Tecsup</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />
                </div>
            </div>

        </>
    );
}


export default Game3