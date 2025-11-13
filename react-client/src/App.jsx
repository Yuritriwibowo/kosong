import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import Login from "./Login";
import Register from "./Register";
import ProductList from "./ProductList";
import AdminSales from "./AdminSales";
import { getToken } from "./api";
import { useEffect, useState } from "react";

// Komponen pelindung route
function ProtectedRoute({ children, allowedRoles }) {
  const [loading, setLoading] = useState(true);
  const [token, setToken] = useState(null);
  const [role, setRole] = useState(null);

  useEffect(() => {
    const t = getToken();
    const r = localStorage.getItem("role");
    setToken(t);
    setRole(r);
    setLoading(false);
  }, []);

  if (loading) {
    return (
      <div className="d-flex vh-100 align-items-center justify-content-center">
        <div className="spinner-border text-primary" role="status">
          <span className="visually-hidden">Loading...</span>
        </div>
      </div>
    );
  }

  if (!token || !role) {
    return <Navigate to="/login" replace />;
  }

  if (!allowedRoles.includes(role)) {
    // Jika role tidak sesuai
    return <Navigate to="/login" replace />;
  }

  return children;
}

export default function App() {
  const token = getToken();
  const role = localStorage.getItem("role");

  return (
    <BrowserRouter>
      <Routes>
        {/* Default route */}
        <Route
          path="/"
          element={
            token ? (
              role === "admin" ? <Navigate to="/admin" /> : <Navigate to="/user" />
            ) : (
              <Navigate to="/login" />
            )
          }
        />

        {/* Auth */}
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />

        {/* User routes */}
        <Route
          path="/user"
          element={
            <ProtectedRoute allowedRoles={["user", "admin"]}>
              <ProductList />
            </ProtectedRoute>
          }
        />

        {/* Admin routes */}
        <Route
          path="/admin"
          element={
            <ProtectedRoute allowedRoles={["admin"]}>
              <AdminSales />
            </ProtectedRoute>
          }
        />

        {/* Fallback */}
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
    </BrowserRouter>
  );
}
