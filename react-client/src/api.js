// src/api.js
export const API_URL = "http://127.0.0.1:8000/api";

export function getToken() {
  return localStorage.getItem("token");
}

export function setToken(token) {
  localStorage.setItem("token", token);
}

export function clearToken() {
  localStorage.removeItem("token");
  localStorage.removeItem("role");
}

async function handleResponse(res) {
  // jika status 204 No Content
  if (res.status === 204) return null;

  let data;
  try {
    data = await res.json();
  } catch (e) {
    throw new Error("Invalid JSON response");
  }

  if (!res.ok) {
    // ambil pesan error dari API jika ada
    const msg = data?.message || `HTTP ${res.status}`;
    const err = new Error(msg);
    err.status = res.status;
    err.body = data;
    throw err;
  }

  return data;
}

export async function apiFetch(endpoint, options = {}) {
  const token = getToken();

  const headers = {
    "Content-Type": "application/json",
    Accept: "application/json",
    ...(options.headers || {}),
  };

  if (token) headers.Authorization = `Bearer ${token}`;

  const res = await fetch(`${API_URL}${endpoint}`, {
    headers,
    ...options,
  });

  return await handleResponse(res);
}
