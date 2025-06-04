<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SuperAdminController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ShiftController;
use App\Http\Controllers\GodownCanteenController;

Route::get('/', [UserController::class,'login'])->name("login");
Route::post('/login', [UserController::class,'postLogin']);

Route::get('/error',function(){
	return view('error');
});

Route::get('/logout',function(){
	Auth::logout();
	return Redirect::to('/');
});

Route::group(['middleware'=>'auth'],function(){
	Route::group(['prefix'=>"superAdmin"], function(){
		Route::get('/dashboard',[SuperAdminController::class,'dashboard']);
		Route::group(['prefix'=>"clients"], function(){
			Route::get('/',[SuperAdminController::class,'clients']);
			Route::get('/add/{client_id?}',[SuperAdminController::class,'clientAdd']);
		});
	});

	Route::group(['prefix'=>"admin"], function(){
		Route::get('/dashboard',[AdminController::class,'dashboard']);
		
		Route::get('/reset-password',[UserController::class,'resetPassword']);
		Route::post('/reset-password',[UserController::class,'updatePassword']);

		Route::middleware(['check.gcanteen'])->group(function () {
		   	Route::group(['prefix'=>"godown-canteen"], function(){
				Route::group(['prefix'=>"items"], function(){
					Route::get('/',[GodownCanteenController::class,'canteenItems']);
					Route::get('/stock/{canteen_item_id}',[GodownCanteenController::class,'canteenItemStocks']);
					Route::get('/print-barcode/{id}',[GodownCanteenController::class,'printBarcode']);
				});
				Route::group(['prefix'=>"daily-entries"], function(){
					Route::get('/',[GodownCanteenController::class,'dailyEntries']);
					Route::get('/print/{id}',[GodownCanteenController::class,'printBill']);
				});
			});
		});

		Route::group(['prefix'=>"shift"], function(){
			Route::get('/current',[ShiftController::class,'index']);
			Route::get('/print/{type}',[ShiftController::class,'print']);
		});

		Route::group(['prefix'=>"users"], function(){
			Route::get('/',[UserController::class,'users']);
		});
	
	});
});


Route::group(['prefix'=>"api"], function(){	
	
	Route::group(['prefix'=>"shift"], function(){
		Route::post('/init',[ShiftController::class,'init']);
		Route::post('/prev-init',[ShiftController::class,'prevInit']);
	});
	Route::group(['prefix'=>"users"], function(){
		Route::post('/init',[UserController::class,'initUsers']);
		Route::post('/edit-init',[UserController::class,'editUser']);
		Route::post('/store',[UserController::class,'storeUser']);
		Route::post('/active-user',[UserController::class,'activeUser']);

	});
	Route::group(['prefix'=>"godown-canteen"], function(){
		Route::group(['prefix'=>"daily-entries"], function(){
			Route::post('/init',[GodownCanteenController::class,'initEntries']);
			Route::post('/edit-init',[GodownCanteenController::class,'editEntry']);
			Route::post('/store',[GodownCanteenController::class,'store']);
		});

		Route::group(['prefix'=>"canteen-items"], function(){
			Route::post('/init',[GodownCanteenController::class,'initCanteenItems']);
			Route::post('/edit',[GodownCanteenController::class,'editCanteenItem']);
			Route::post('/store',[GodownCanteenController::class,'storeCanteenItem']);
			Route::post('/drop-list',[GodownCanteenController::class,'initCanteenItemsDrop']);
			Route::group(['prefix'=>"stocks"], function(){
				Route::post('/init',[GodownCanteenController::class,'initCanteenItemStocks']);
				Route::post('/edit',[GodownCanteenController::class,'editCanteenItemStocks']);
				Route::post('/store',[GodownCanteenController::class,'storeCanteenItemStock']);
			});
		});
	});
	Route::post('canteen-item-list/{canteen_id}',[ApiController::class,'canteenItemList']);
	Route::group(['prefix'=>"superAdmin"], function(){
		Route::post('/get-clients',[SuperAdminController::class,'getClients']);
		Route::post('/edit-init',[SuperAdminController::class,'editInit']);
		Route::post('/store-client',[SuperAdminController::class,'storeClient']);
	});
});
