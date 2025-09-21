import { useEffect, useState } from "react";

function App() {
  const [courses, setCourses] = useState([]);
  const API_URL = import.meta.env.VITE_API_URL; // 🔑 Variable de entorno

  useEffect(() => {
    fetch(`${API_URL}/courses`)
      .then(res => res.json())
      .then(data => setCourses(data))
      .catch(err => console.error(err));
  }, [API_URL]);

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>Catálogo de Cursos</h1>
      <ul>
        {courses.map(c => (
          <li key={c.id}>
            <strong>{c.title}</strong> — {c.description} (${c.price})
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
