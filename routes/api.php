<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProductController;
use App\Models\Product;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
| Semua route API menggunakan Sanctum untuk autentikasi token.
| Role yang diizinkan: 'user' dan 'admin'
|--------------------------------------------------------------------------
*/

// ============================
// 🔐 AUTH ROUTES
// ============================
Route::prefix('auth')->group(function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);
    Route::middleware('auth:sanctum')->get('/me', [AuthController::class, 'me']);
});


// ============================
// 👤 USER & ADMIN ROUTES
// ============================
Route::middleware(['auth:sanctum', 'role:user,admin'])->group(function () {

    // Semua produk (admin → semua, user → hanya miliknya)
    Route::get('/products', [ProductController::class, 'index']);

    // Tambah produk baru
    Route::post('/products', [ProductController::class, 'store']);

    // Lihat 1 produk
    Route::get('/products/{product}', [ProductController::class, 'show']);

    // Update produk
    Route::put('/products/{product}', [ProductController::class, 'update']);

    // Hapus produk
    Route::delete('/products/{product}', [ProductController::class, 'destroy']);
});


// ============================
// 🧑‍💼 ADMIN-ONLY ROUTES
// ============================
Route::middleware(['auth:sanctum', 'role:admin'])->group(function () {
    Route::get('/admin/sales', function () {
        return Product::with('user:id,name,email,role')->latest()->get();
    });
    Route::delete('/admin/products/{product}', [ProductController::class, 'destroy']);
});


// ============================
// ⚙️ LARAVEL DEFAULT SANCTUM TEST
// ============================
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
