<?php


class AdminController extends BaseController {
	public function getChangePass(){
		return View::make('account.changepass');
	}
	public function postChangePass(){
		
		$validator=Validator::make(Input::all(),
				array(
					'currentpass' => 'required',
					'newpass' =>'required|min:5',
					'confirmpass' => 'required|same:newpass'
					)
				);

			if($validator->fails()){
				return Redirect::route('admin-changepass-post')
				-> withErrors($validator)
				->withInput();
			}else{
				//$pass=Hash::make('saqib');
				//DB::update('update userauth set password = "'.$pass.'"  where id = 1');
				$user=User::find(Auth::user()->id);
				$cpass=Input::get('currentpass');
				$newpass=Input::get('newpass');
				if(Hash::check($cpass,$user->getAuthPassword())){
				$user->password=Hash::make($newpass);
				if($user->save()){
					return Redirect::route('home')
					->with('global','Password successuflly change');
				}	
				}

				return Redirect::route('admin-changepass-post')
				-> withErrors($validator)
				->withInput()
				->with('global', 'There is some problem in changing your password please try again later');			

			}

	}
	public function getSignOut(){
		Auth::logout();
		return Redirect::route('home');
	}
	
	public function getSignIn(){
		return View::make('account.signin');
	}
	public function postSignIn(){
		$validator=Validator::make(Input::all(),
				array(
					'email' => 'required|max:60|email',
					//'username'=>'required|max:20|min:6|unique:usersAuth',
					'passwd' =>'required'


					)
				);
			if($validator->fails()){
				return Redirect::route('admin-signin-post')
				-> withErrors($validator)
				->withInput();
			}else{
				//die('Pass');
				$remember=(Input::has('remember')) ? true : false;

				$auth=Auth::attempt(array(
					'email' =>Input::get('email'), 
					//'passwd'=>Hash::make(Input::get('passwd')),
					'password' => Input::get('passwd'),
					'active'=>1
					),$remember);
				if($auth){
					return Redirect::intended('/')
					->withInput();
				}else{
					return Redirect::route('admin-signin')
					->with('global','Email/password incorrect or Account not active')
					->withInput();
				}
				return Redirect::route('admin-signin')
					->with('global','Some poroblem in Sign IN')
					->withInput();

			}
	}





	public function getCreate(){

		return View::make('account.create');
		//return 'ongetCreateFunction';
		//$tble = User::all()->first();
		//return $tble->username;
		/* $results = DB::select('select * from acc_type');
		foreach($results as $rs){
		echo $rs->acc_type;

	}
	*/
	/*
	// my Account Create Function
function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
       $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}
	$create=User::create(array(
	'usrname' 		=> 'saqibusr',
	'email' 		=> 'saqib@user.com',
	'passwd' 		=> Hash::make('saqib'),
	'lastIP' 		=>get_client_ip(),
	'active'=>1,
	'verified'=>1,
	'acc_type'=>2,
	'updated_at'	=> date("Y-m-d H:i:s"),
	'created_at'	=> date("Y-m-d H:i:s")
));
	if($create){return 'pass';}
	*/

	}


		public function postCreate(){
		//return View::make('admin.create');
		//return 'onpostCreateFunction';
			

			//print_r(Input::all());

	}
	

}
