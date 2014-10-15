@extends('layout.main')

@section('content')
<br>
<br><br>
@if(Session::has('global'))
{{Session::get('global')}}
@endif

<form action="{{ URL::route('admin-changepass-post')}}" method="post">
<label>Current Password:
<input type="password"  name="currentpass">
@if($errors->has('currentpass'))
{{$errors->first('currentpass')}}
@endif
</label>
<label>New Password:
<input type="password"  name="newpass">
@if($errors->has('newpass'))
{{$errors->first('newpass')}}
@endif
</label>

<label>Current Password:
<input type="password" name="confirmpass">
@if($errors->has('confirmpass'))
{{$errors->first('confirmpass')}}
@endif
</label>
<div class="buttonSection">
<input type="submit" value="Change Password">
</div>
{{Form::token()}}
</form>

@stop