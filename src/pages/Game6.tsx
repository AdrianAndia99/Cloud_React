import React from 'react';

const Game6: React.FC = () => {
    return (
      <div style={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
        background: '#000'
      }}>
        <div style={{
          position: 'relative',
          width: '600px', // ancho fijo del juego (vertical)
          height: '800px', // alto fijo del juego (vertical)
          maxWidth: '100vw',
          maxHeight: '100vh',
          boxShadow: '0 0 20px #000'
        }}>
          <iframe
            src="/Construct/index.html"
            title="Construct 2 Game"
            style={{
              position: 'absolute',
              top: 0,
              left: 0,
              width: '100%',
              height: '100%',
              border: 'none',
            }}
            allowFullScreen
          />
        </div>
      </div>
    );
  };

  export default Game6;
