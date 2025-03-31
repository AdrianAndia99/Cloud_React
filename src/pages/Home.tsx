import MainBanner from "../common/MainBanner.tsx";
import imagenFondo from '../assets/images/imagenFondo.jpg';
function Home() {

    return (
        <>
           <MainBanner/>

           <div style={{ textAlign: "center", padding: "10px", backgroundColor: "#f0f0f0", borderRadius: "10px" }}>
               <h2 style={{ color: "#333" }}>Sobre mi</h2>
               <img 
                   src={imagenFondo} 
                   alt="Mi imagen" 
                   style={{ borderRadius: "40%", marginBottom: "10px" }} 
               />
               <p style={{ color: "#555", fontSize: "18px", margin: "5px 0" }}>Nombre: Adrian Guillermo</p>
               <p style={{ color: "#555", fontSize: "18px", margin: "5px 0" }}>Apellidos: Andia Matos</p>
               <p style={{ color: "#555", fontSize: "18px", margin: "5px 0" }}>Edad: 20</p>
               <p style={{ color: "#555", fontSize: "18px", margin: "5px 0" }}>Carrera: Diseño y Desarrollo de simuladores y videojuegos</p>
           </div>
           

        </>
    );
}

export default Home