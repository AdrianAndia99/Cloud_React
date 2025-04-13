import {Unity, useUnityContext} from "react-unity-webgl";

function Game2() {
  const { unityProvider } = useUnityContext({
    loaderUrl: "/WEBGL.loader.js",
    dataUrl: "/WEBGL.data",
    frameworkUrl: "/WEBGL.framework.js",
    codeUrl: "/WEBGL.wasm",
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
  export default Game2;