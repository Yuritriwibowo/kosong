// src/components/Navbar.jsx
import { Link, useNavigate } from "react-router-dom";
import { clearToken } from "../api";

export default function Navbar({ role }) {
  const navigate = useNavigate();

  const logout = () => {
    clearToken();
    navigate("/login");
  };

  return (
    <nav className="navbar navbar-expand-lg navbar-dark bg-primary">
      <div className="container">
        <Link className="navbar-brand fw-bold" to={role === "admin" ? "/admin" : "/user"}>
          MyStore
        </Link>

        <div className="d-flex ms-auto align-items-center">
          {role === "user" && (
            <Link className="btn btn-outline-light btn-sm me-2" to="/user">
              Produk Saya
            </Link>
          )}
          {role === "admin" && (
            <Link className="btn btn-outline-light btn-sm me-2" to="/admin">
              Penjualan Semua User
            </Link>
          )}
          <button className="btn btn-light btn-sm" onClick={logout}>
            Logout
          </button>
        </div>
      </div>
    </nav>
  );
}
