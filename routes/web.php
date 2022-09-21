<?php

Route::get('/', 'LandingPageController@index')->name('landing-page');

Route::get('/shop', 'ShopController@index')->name('shop.index');
Route::get('/shop/{product}', 'ShopController@show')->name('shop.show');

Route::get('/cart', 'CartController@index')->name('cart.index');
Route::post('/cart/{product}', 'CartController@store')->name('cart.store');
Route::patch('/cart/{product}', 'CartController@update')->name('cart.update');
Route::delete('/cart/{product}', 'CartController@destroy')->name('cart.destroy');
Route::post('/cart/switchToSaveForLater/{product}', 'CartController@switchToSaveForLater')->name('cart.switchToSaveForLater');

Route::delete('/saveForLater/{product}', 'SaveForLaterController@destroy')->name('saveForLater.destroy');
Route::post('/saveForLater/switchToCart/{product}', 'SaveForLaterController@switchToCart')->name('saveForLater.switchToCart');

Route::post('/coupon', 'CouponsController@store')->name('coupon.store');
Route::delete('/coupon', 'CouponsController@destroy')->name('coupon.destroy');

Route::get('/checkout', 'CheckoutController@index')->name('checkout.index');
Route::get('/checkout/{category_id}', 'CheckoutController@addToCart')->name('checkout.add');

Route::post('/checkout/options','CheckoutController@addOptions')->name("checkout.options");
Route::post('/checkout/products','CheckoutController@addProducts')->name("checkout.update_product");
Route::post('/checkout/user_data','CheckoutController@updateUserdata')->name("checkout.update_user_data");

Route::post('/checkout', 'CheckoutController@store')->name('checkout.store');

Route::post('/paypal-checkout', 'CheckoutController@paypalCheckout')->name('checkout.paypal');

Route::get('/guestCheckout', 'CheckoutController@index')->name('guestCheckout.index');


Route::get('/thankyou', 'ConfirmationController@index')->name('confirmation.index');


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::post('/advice-form', 'LandingPageController@fromAdvice')->name('post_advice');

// Route::get('/search', 'ShopController@search')->name('search');
// Route::get('/search-algolia', 'ShopController@searchAlgolia')->name('search-algolia');

Route::middleware('auth')->group(function () {
    Route::get('/my-profile', 'UsersController@edit')->name('users.edit');
    Route::patch('/my-profile', 'UsersController@update')->name('users.update');

    Route::get('/my-setting' , 'UsersController@setting')->name('users.setting');
    Route::post('/my-setting' , 'UsersController@updateSetting')->name('users.update_setting');
    
    Route::get('/my-orders', 'OrdersController@index')->name('orders.index');
    Route::get('/my-orders/{order}', 'OrdersController@show')->name('orders.show');
});

//Home page
Route::get('/homepage', function(){
    return view('homepage');
});

Route::get('/redirect/{social}', 'SocialAuthController@redirect');
Route::get('/callback/{social}', 'SocialAuthController@callback');

Route::get('/about', function(){
    return view('about');
});


Route::get('/hoi-dap','FaqController@index');
Route::get('/tim-kiem','FaqController@search')->name('faq.search');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

//Menu Page
Route::get('/thuc-don', function(){
    return view('menu');
});
