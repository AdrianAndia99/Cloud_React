import {Unity, useUnityContext} from "react-unity-webgl";

function Game1() {
  const { unityProvider } = useUnityContext({
    loaderUrl: "/moneda.loader.js",
    dataUrl: "/moneda.data",
    frameworkUrl: "/moneda.framework.js",
    codeUrl: "/moneda.wasm",
});

return (
    <>
        <div className="centered-container">
            <div className="centered-content">
                <h1 className="centered-title">Game 2</h1>
                <Unity unityProvider={unityProvider} className="centered-unity" />
            </div>
        </div>

    </>
);
  }
  export default Game1;