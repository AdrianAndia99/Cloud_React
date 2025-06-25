import { useState } from 'react';
import '../styles/Login.css';

function Login() {
  const [formData, setFormData] = useState({
    email: '',
    password: '',
    username: '', // Solo para registro
    created_by: '' // Solo para registro
  });
  const [error, setError] = useState('');
  const [message, setMessage] = useState('');
  const [isRegistering, setIsRegistering] = useState(false);
  const [activateId, setActivateId] = useState('');
  const [activateMsg, setActivateMsg] = useState('');

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError('');
    setMessage('');

    try {
      let endpoint = '';
      let body: any = {};
      if (isRegistering) {
        endpoint = 'http://localhost/create_user.php';
        body = {
          username: formData.username,
          email: formData.email,
          password: formData.password,
          created_by: formData.created_by || formData.username // puedes ajustar esto
        };
      } else {
        endpoint = 'http://localhost/login.php';
        body = {
          email: formData.email,
          password: formData.password
        };
      }

      const response = await fetch(endpoint, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(body)
      });

      const data = await response.json();

      if (isRegistering) {
        if (data && data.includes && data.includes('exitosamente')) {
          setMessage('Usuario registrado exitosamente. Ahora puedes iniciar sesión.');
          setIsRegistering(false);
        } else {
          setError(data || 'Error al registrar el usuario.');
        }
      } else {
        if (data.status === 'success') {
          localStorage.setItem('user', JSON.stringify(data.user));
          window.location.href = '/';
        } else {
          setError(data.message || 'Error al iniciar sesión');
        }
      }
    } catch (err) {
      setError('Error de conexión con el servidor');
      console.error('Error:', err);
    }
  };

  // Función para activar usuario
  const handleActivateUser = async () => {
    setActivateMsg('');
    if (!activateId) {
      setActivateMsg('Ingresa un ID de usuario válido.');
      return;
    }
    try {
      const response = await fetch('http://localhost/activar_usuario.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ user_id: activateId })
      });
      const data = await response.json();
      setActivateMsg(data.message || data.error || 'Error desconocido');
    } catch (err) {
      setActivateMsg('Error al activar usuario');
    }
  };

  return (
    <div className="login-container">
      <div className="login-box">
        <h1>{isRegistering ? 'Registrarse' : 'Iniciar Sesión'}</h1>
        {error && <div className="error-message">{error}</div>}
        {message && <div className="success-message">{message}</div>}
        <form onSubmit={handleSubmit}>
          {isRegistering && (
            <div className="form-group">
              <label htmlFor="username">Nombre de usuario:</label>
              <input
                type="text"
                id="username"
                name="username"
                value={formData.username}
                onChange={handleInputChange}
                required
              />
            </div>
          )}
          <div className="form-group">
            <label htmlFor="email">Correo electrónico:</label>
            <input
              type="email"
              id="email"
              name="email"
              value={formData.email}
              onChange={handleInputChange}
              required
            />
          </div>
          <div className="form-group">
            <label htmlFor="password">Contraseña:</label>
            <input
              type="password"
              id="password"
              name="password"
              value={formData.password}
              onChange={handleInputChange}
              required
            />
          </div>
          {isRegistering && (
            <div className="form-group">
              <label htmlFor="created_by">Creador (opcional):</label>
              <input
                type="text"
                id="created_by"
                name="created_by"
                value={formData.created_by}
                onChange={handleInputChange}
                placeholder="Tu nombre o ID"
              />
            </div>
          )}
          <button type="submit" className="login-button">
            {isRegistering ? 'Registrarse' : 'Iniciar Sesión'}
          </button>
        </form>
        <div className="toggle-link">
          <button
            className="btn btn-link"
            onClick={() => {
              setIsRegistering(!isRegistering);
              setError('');
              setMessage('');
            }}
          >
            {isRegistering ? '¿Ya tienes una cuenta? Inicia sesión' : '¿No tienes una cuenta? Regístrate'}
          </button>
        </div>
        {/* Activar usuario */}
        <div className="activate-user-box" style={{ marginTop: 30 }}>
          <h3>Activar usuario</h3>
          <input
            type="number"
            placeholder="ID de usuario"
            value={activateId}
            onChange={e => setActivateId(e.target.value)}
            style={{ marginRight: 8 }}
          />
          <button className="btn btn-secondary" onClick={handleActivateUser} type="button">
            Activar usuario
          </button>
          {activateMsg && <div className="activate-message" style={{ marginTop: 10 }}>{activateMsg}</div>}
        </div>
      </div>
    </div>
  );
}

export default Login;