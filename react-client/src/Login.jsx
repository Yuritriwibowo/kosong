import { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { setToken, API_URL } from "./api";

export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [msg, setMsg] = useState("");
  const navigate = useNavigate();

  const submit = async (e) => {
    e.preventDefault();
    setMsg("");

    try {
      const res = await fetch(`${API_URL}/auth/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });

      const data = await res.json();
      console.log("LOGIN RESPONSE:", data); // 👈 Debugging log

      if (!res.ok) {
        throw new Error(data.message || "Login gagal");
      }

      // Coba ambil token dari berbagai kemungkinan struktur respons
      const token =
        data?.data?.token ||
        data?.token ||
        data?.access_token ||
        data?.user?.token ||
        null;

      const role =
        data?.data?.user?.role ||
        data?.user?.role ||
        data?.role ||
        "user";

      if (!token) {
        throw new Error("Token tidak ditemukan dalam respons backend");
      }

      // Simpan token dan role
      setToken(token);
      localStorage.setItem("role", role);

      console.log("TOKEN:", token);
      console.log("ROLE:", role);

      // Redirect sesuai role
      if (role === "admin") {
        navigate("/admin");
      } else {
        navigate("/user");
      }
    } catch (err) {
      console.error(err);
      setMsg(err.message);
    }
  };

  return (
    <div className="d-flex align-items-center justify-content-center vh-100 bg-light">
      <div
        className="card shadow p-4"
        style={{ width: "100%", maxWidth: "420px", borderRadius: "15px" }}
      >
        <h3 className="text-center mb-4 fw-bold text-primary">Masuk</h3>

        <form onSubmit={submit} className="d-grid gap-3">
          <input
            className="form-control"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <input
            className="form-control"
            placeholder="Password"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <button className="btn btn-primary w-100">Login</button>
        </form>

        {msg && (
          <p className="text-danger text-center mt-3 small fw-semibold">
            {msg}
          </p>
        )}

        <p className="text-center mt-3 mb-0">
          Belum punya akun?{" "}
          <Link to="/register" className="text-decoration-none">
            Daftar
          </Link>
        </p>
      </div>
    </div>
  );
}
