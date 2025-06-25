import { useEffect, useState } from 'react';

interface GameScore {
  id: number;
  game_id: number;
  user_id: number;
  score: number;
  created_at?: string;
  // agrega otros campos si tu tabla los tiene
}

interface RankingProps {
  gameId: number;
}

const Ranking: React.FC<RankingProps> = ({ gameId }) => {
  const [scores, setScores] = useState<GameScore[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchScores = async () => {
      setLoading(true);
      setError('');
      try {
        const response = await fetch('http://localhost/read_game_scores.php');
        const data = await response.json();
        if (Array.isArray(data)) {
          // Filtra y ordena por score descendente
          const filtered = data
            .filter((item: GameScore) => item.game_id === gameId)
            .sort((a, b) => b.score - a.score);
          setScores(filtered);
        } else {
          setError('No se pudo obtener el ranking');
        }
      } catch (err) {
        setError('Error de conexión con el servidor');
      }
      setLoading(false);
    };
    fetchScores();
  }, [gameId]);

  return (
    <div className="ranking-container">
      <h2>Ranking del Juego #{gameId}</h2>
      {loading && <p>Cargando...</p>}
      {error && <p style={{ color: 'red' }}>{error}</p>}
      {!loading && !error && (
        <table>
          <thead>
            <tr>
              <th>Puesto</th>
              <th>ID Usuario</th>
              <th>Puntaje</th>
            </tr>
          </thead>
          <tbody>
            {scores.map((score, idx) => (
              <tr key={score.id}>
                <td>{idx + 1}</td>
                <td>{score.user_id}</td>
                <td>{score.score}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default Ranking;
