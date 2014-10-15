<?php

class FormController extends BaseController {
	public function getUpdateProfile(){
		$results = DB::select('select * from userdetail where id='.Auth::user()->acc_type);

	
		return View::make('account.updateprofile')
		->with('results',$results);
	}
	public function postUpdateProfile(){
		
				$validator=Validator::make(Input::all(),
				array(
					'firstname' => 'required|min:4',
					'lastname' =>'required|min:4',
					'address1' => 'required|min:5',
					'county' => 'required|min:4',
					'country' => 'required'
					)
				);

			if($validator->fails()){
				return Redirect::route('account-updateprofile')
				-> withErrors($validator)
				->withInput();
			}else{
				$firstname=Input::get('firstname');
				$lastname=Input::get('lastname');
				$address1=Input::get('address1');
				$address2=Input::get('address2');
				$county=Input::get('county');
				$country=Input::get('country');
				$landline=Input::get('landline');
				$mobile=Input::get('mobile');
				$query='update userdetail set firstname="'.$firstname.'", lastname="'.$lastname.'",address1="'.$address1.'",address2="'.$address2.'",County="'.$county.'",country="'.$country.'",landline='.$landline.',mobile='.$mobile.' where id='.Auth::user()->acc_type;
				//return $query;
				$results = DB::select($query);
				//if($results)
				return Redirect::route('account-updateprofile')
				->withInput()
				->with('global','Record Updated Successfully');
				

				return Redirect::route('home')
				-> withErrors($validator)
				->withInput()
				->with('global', 'There is some problem in changing your password please try again later');			

			}

	}
}