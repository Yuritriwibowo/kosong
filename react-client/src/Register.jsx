import { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { API_URL } from "./api";

export default function Register() {
  const [form, setForm] = useState({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
  });
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();

  const submit = async (e) => {
    e.preventDefault();
    setMsg("");

    try {
      const res = await fetch(`${API_URL}/auth/register`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(form),
      });

      const data = await res.json();
      if (!res.ok) throw new Error(data.message || "Registrasi gagal");
      navigate("/login");
    } catch (err) {
      setMsg(err.message);
    }
  };

  return (
    <div className="d-flex align-items-center justify-content-center vh-100 bg-light">
      <div className="card shadow p-4" style={{ width: "100%", maxWidth: "420px", borderRadius: "15px" }}>
        <h3 className="text-center mb-4 fw-bold text-primary">Daftar Akun</h3>

        <form onSubmit={submit} className="d-grid gap-3">
          <input
            className="form-control"
            placeholder="Nama Lengkap"
            value={form.name}
            onChange={(e) => setForm({ ...form, name: e.target.value })}
            required
          />
          <input
            className="form-control"
            placeholder="Email"
            type="email"
            value={form.email}
            onChange={(e) => setForm({ ...form, email: e.target.value })}
            required
          />
          <input
            className="form-control"
            placeholder="Password"
            type="password"
            value={form.password}
            onChange={(e) => setForm({ ...form, password: e.target.value })}
            required
          />
          <input
            className="form-control"
            placeholder="Konfirmasi Password"
            type="password"
            value={form.password_confirmation}
            onChange={(e) => setForm({ ...form, password_confirmation: e.target.value })}
            required
          />
          <button className="btn btn-success w-100">Daftar</button>
        </form>

        {msg && <p className="text-danger text-center mt-3 small">{msg}</p>}

        <p className="text-center mt-3 mb-0">
          Sudah punya akun?{" "}
          <Link to="/login" className="text-decoration-none">
            Masuk
          </Link>
        </p>
      </div>
    </div>
  );
}
