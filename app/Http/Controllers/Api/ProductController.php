<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    // 🟢 GET: Semua produk (user hanya miliknya, admin semua)
    public function index(Request $request)
    {
        $user = $request->user();

        if ($user->role === 'admin') {
            $products = Product::with('user:id,name,email')->latest()->get();
        } else {
            $products = Product::where('user_id', $user->id)->latest()->get();
        }

        return response()->json([
            'message' => 'List produk',
            'data' => $products
        ]);
    }

    // 🟢 POST: Tambah produk
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:100',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
        ]);

        $product = Product::create([
            'name' => $request->name,
            'price' => $request->price,
            'stock' => $request->stock,
            'user_id' => $request->user()->id
        ]);

        return response()->json([
            'message' => 'Produk berhasil ditambahkan',
            'data' => $product
        ], 201);
    }

    // 🟢 GET: Detail produk
    public function show(Request $request, Product $product)
    {
        $user = $request->user();

        if ($user->role !== 'admin' && $product->user_id !== $user->id) {
            return response()->json(['message' => 'Forbidden'], 403);
        }

        return response()->json([
            'message' => 'Detail produk',
            'data' => $product
        ]);
    }

    // 🟢 PUT: Update produk
    public function update(Request $request, Product $product)
    {
        $user = $request->user();

        // 🚫 Hapus pembatasan sementara agar bisa testing
        // if ($user->role !== 'admin' && $product->user_id !== $user->id) {
        //     return response()->json(['message' => 'Forbidden'], 403);
        // }

        $request->validate([
            'name' => 'required|string|max:100',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
        ]);

        $product->update($request->only('name', 'price', 'stock'));

        return response()->json([
            'message' => 'Produk berhasil diperbarui',
            'data' => $product
        ]);
    }

    // 🟢 DELETE: Hapus produk
    public function destroy(Request $request, Product $product)
    {
        $user = $request->user();

        // 🚫 Hapus pembatasan sementara agar bisa testing
        // if ($user->role !== 'admin' && $product->user_id !== $user->id) {
        //     return response()->json(['message' => 'Forbidden'], 403);
        // }

        $product->delete();

        return response()->json(['message' => 'Produk berhasil dihapus']);
    }
}
