<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', array(
	'as' => 'home',
	'uses' => 'HomeController@home'
	));
// End of Authenticated group
Route::group(array('before' => 'guest'), function(){
	//To check the token Authentication nested navigation
	Route::group(array('before' => 'csrf'), function(){
		//data injection check

			Route::post('account/create', array(
			'as' => 'admin-create-post',
			'uses' => 'AdminController@postCreate'
			));

			Route::post('account/signin', array(
			'as' => 'admin-signin-post',
			'uses' => 'AdminController@postSignIn'
			));

	});
			//for entry of different form
	
			Route::get('account/create', array(
			'as' => 'admin-create',
			'uses' => 'AdminController@getCreate'
			));

			// for Signin form
			Route::get('account/signin', array(
			'as' => 'admin-signin',
			'uses' => 'AdminController@getSignIn'
			));
	
//Route::controller('admin',AdminController');
});

//Authenticated Group
Route::group(array('before' => 'auth'), function(){
	Route::group(array('before' => 'csrf'), function(){
		//Authenticated Group post Group

			Route::post('account.changepass', array(
			'as' => 'admin-changepass-post',
			'uses' => 'AdminController@postChangePass'
			));

			Route::post('account.updateprofile', array(
			'as' => 'account-updateprofile',
			'uses' => 'FormController@postUpdateProfile'
			));

			//End of Auth post section please put all url above this comment
	});
			Route::get('account.signout', array(
			'as' => 'admin-signout',
			'uses' => 'AdminController@getSignOut'
			));

			Route::get('account.changepass', array(
			'as' => 'admin-changepass',
			'uses' => 'AdminController@getChangePass'
			));
			Route::get('account.updateprofile', array(
			'as' => 'account-updateprofile',
			'uses' => 'FormController@getUpdateProfile'
			));


});

