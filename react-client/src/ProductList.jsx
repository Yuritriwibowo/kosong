import { useEffect, useState } from "react";
import { apiFetch } from "./api";
import Navbar from "./components/Navbar";

export default function ProductList() {
  const [products, setProducts] = useState([]);
  const [form, setForm] = useState({ name: "", price: "", stock: "" });
  const [editing, setEditing] = useState(null);
  const role = localStorage.getItem("role") || "user";

  const load = async () => {
    try {
      const res = await apiFetch("/products");
      const data = Array.isArray(res) ? res : (res.data || res);
      setProducts(data);
    } catch (err) {
      console.error(err);
    }
  };

  const submit = async (e) => {
    e.preventDefault();
    try {
      if (editing) {
        // mode edit
        await apiFetch(`/products/${editing.id}`, {
          method: "PUT",
          body: JSON.stringify(form),
        });
        setEditing(null);
      } else {
        // mode tambah
        await apiFetch("/products", {
          method: "POST",
          body: JSON.stringify(form),
        });
      }
      setForm({ name: "", price: "", stock: "" });
      load();
    } catch (err) {
      console.error(err);
      alert(err.message || "Gagal menyimpan produk");
    }
  };

  const edit = (product) => {
    setForm({
      name: product.name,
      price: product.price,
      stock: product.stock,
    });
    setEditing(product);
  };

  const cancelEdit = () => {
    setEditing(null);
    setForm({ name: "", price: "", stock: "" });
  };

  const del = async (id) => {
    if (!confirm("Hapus produk ini?")) return;
    try {
      await apiFetch(`/products/${id}`, { method: "DELETE" });
      load();
    } catch (err) {
      console.error(err);
      alert(err.message || "Gagal hapus produk");
    }
  };

  useEffect(() => {
    load();
  }, []);

  return (
    <>
      <Navbar role={role} />
      <div className="container py-4">
        <h3 className="fw-bold text-primary mb-4">Produk Saya</h3>

        <form onSubmit={submit} className="row g-2 mb-4">
          <div className="col-md-4">
            <input
              className="form-control"
              placeholder="Nama Produk"
              value={form.name}
              onChange={(e) => setForm({ ...form, name: e.target.value })}
              required
            />
          </div>
          <div className="col-md-3">
            <input
              className="form-control"
              placeholder="Harga"
              type="number"
              value={form.price}
              onChange={(e) => setForm({ ...form, price: e.target.value })}
              required
            />
          </div>
          <div className="col-md-2">
            <input
              className="form-control"
              placeholder="Stok"
              type="number"
              value={form.stock}
              onChange={(e) => setForm({ ...form, stock: e.target.value })}
              required
            />
          </div>
          <div className="col-md-3 d-flex gap-2">
            <button className={`btn ${editing ? "btn-warning" : "btn-success"} w-100`}>
              {editing ? "Simpan Perubahan" : "Tambah"}
            </button>
            {editing && (
              <button type="button" className="btn btn-secondary" onClick={cancelEdit}>
                Batal
              </button>
            )}
          </div>
        </form>

        <div className="table-responsive">
          <table className="table table-striped align-middle">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Harga</th>
                <th>Stok</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody>
              {products.length === 0 ? (
                <tr>
                  <td colSpan="5" className="text-center">
                    Belum ada produk
                  </td>
                </tr>
              ) : (
                products.map((p, i) => (
                  <tr key={p.id}>
                    <td>{i + 1}</td>
                    <td>{p.name}</td>
                    <td>Rp {Number(p.price).toLocaleString("id-ID")}</td>
                    <td>{p.stock}</td>
                    <td className="d-flex gap-2">
                      <button className="btn btn-sm btn-primary" onClick={() => edit(p)}>
                        Edit
                      </button>
                      <button className="btn btn-sm btn-danger" onClick={() => del(p.id)}>
                        Hapus
                      </button>
                    </td>
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
