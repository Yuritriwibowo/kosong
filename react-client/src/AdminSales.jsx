import { useEffect, useState } from "react";
import { apiFetch } from "./api";
import Navbar from "./components/Navbar";

export default function AdminSales() {
  const [sales, setSales] = useState([]);
  const [error, setError] = useState(null);

  const load = async () => {
    try {
      const res = await apiFetch("/admin/sales");
      console.log("ADMIN SALES:", res);

      // handle data array / object
      const data = Array.isArray(res) ? res : res.data || [];
      setSales(data);
    } catch (err) {
      console.error("ERROR ADMIN SALES:", err);
      setError(err.message);
    }
  };

  useEffect(() => {
    load();
  }, []);

  return (
    <>
      <Navbar role="admin" />
      <div className="container py-4">
        <h3 className="fw-bold text-primary mb-4">Penjualan Semua User</h3>

        {error && (
          <div className="alert alert-danger" role="alert">
            {error}
          </div>
        )}

        <div className="table-responsive">
          <table className="table table-striped align-middle">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama Produk</th>
                <th>Harga</th>
                <th>Stok</th>
                <th>Pemilik</th>
              </tr>
            </thead>
            <tbody>
              {sales.length === 0 ? (
                <tr>
                  <td colSpan="5" className="text-center text-muted">
                    {error ? "Gagal memuat data." : "Belum ada data."}
                  </td>
                </tr>
              ) : (
                sales.map((s, i) => (
                  <tr key={s.id}>
                    <td>{i + 1}</td>
                    <td>{s.name}</td>
                    <td>Rp {Number(s.price).toLocaleString("id-ID")}</td>
                    <td>{s.stock}</td>
                    <td>{s.user?.name || "Tidak diketahui"}</td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </>
  );
}
