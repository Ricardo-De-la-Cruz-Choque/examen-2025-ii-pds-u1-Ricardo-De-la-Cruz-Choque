import { useEffect, useState } from "react";

function App() {
  const [courses, setCourses] = useState([]);

  useEffect(() => {
    fetch("http://localhost:5099/courses") // tu backend local
      .then(res => res.json())
      .then(data => setCourses(data))
      .catch(err => console.error(err));
  }, []);

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
