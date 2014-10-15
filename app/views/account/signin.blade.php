@extends('layout.main')

@section('content')
<br><br>
@if(Session::has('global'))
{{Session::get('global')}}
@endif
<form action="{{ URL::route('admin-signin-post') }}" method="post">
<label>
<span>User Name:</span>
<input type="text" name="email"  {{ Input::old('email') ? 'value="'. e(Input::old('email')) .'"' : 'value=""'}}>
</label>
@if($errors->has('email'))
<br>{{$errors->first('email')}}
@endif
<label>
<span>Password</span>
<input type="password" name="passwd" ></label>
@if($errors->has('passwd'))
<br>{{$errors->first('passwd')."<br>"}}
@endif

<label>
<input type="checkbox"  name="remember" id="remember"><span> Remember Me</span></label>
<div class="buttonSection">
<input type="submit" value="SignIn">
	{{ Form::token() }}
	</div>
</form>

@stop