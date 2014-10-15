<?php

class HomeController extends BaseController {
	public function home(){
		
		//Mail::send('emails/auth/test', array('name' => 'Mirza Saqib Baig'),	function($message){$message->to('saqibbaig@gmail.com','Saqib Test')->subject('test mail tick tick')});
		return View::make('hello');
	}
}
