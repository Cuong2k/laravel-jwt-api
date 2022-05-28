<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\LandController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group([
    'middleware' => ['api', 'cors'],
    'prefix' => 'auth'
],function($router) {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login'])->name('login');
    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
    Route::post('/refresh', [AuthController::class, 'refresh'])->name('refresh');
    Route::post('/profile', [AuthController::class, 'profile'])->name('profile');
});

Route::group([
    'middleware' => ['api', 'cors'],
    'prefix' => 'land'
],function($router) {
    Route::get('/', [LandController::class, 'index']);
    Route::get('/{land}', [LandController::class, 'show']);
    Route::post('/create', [LandController::class, 'store']);
    Route::put('/edit/{land}', [LandController::class, 'update']);
    Route::delete('/delete/{land}', [LandController::class, 'destroy']);
});

Route::group([
    'middleware' => ['api', 'cors'],
    'prefix' => 'user'
],function($router) {
    Route::get('/', [UserController::class, 'index']);
    Route::put('/edit/{user}', [UserController::class, 'update']);
    Route::delete('/delete/{user}', [UserController::class, 'destroy']);
});