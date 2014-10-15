@extends('layout.main')

@section('content')
@if(Session::has('global'))
{{Session::get('global')}}
@endif
<section>

@foreach($results as $rs)

<form action="{{ URL::route('account-updateprofile') }}" method="post">
<h3>Please Update your information</h3>
  <label>First Name:
  <input type="text" name="firstname" id="firstname"  {{ Input::old('firstname') ? 'value="'. e(Input::old('firstname')) .'"' : 'value="'.$rs->firstname.'"'}}>
 @if($errors->has('firstname'))
{{$errors->first('firstname')}}
@endif

  </label>
  
  <label>Last Name:
  <input type="text" name="lastname" id="lastname"  {{ Input::old('lastname') ? 'value="'. e(Input::old('lastname')) .'"' : 'value="'.$rs->lastname.'"'}}>
@if($errors->has('lastname'))
{{$errors->first('lastname')}}
@endif

  </label>
<label>Address 1:
    <input type="text" name="address1" id="address1"  {{ Input::old('address1') ? 'value="'. e(Input::old('address1')) .'"' : 'value="'.$rs->address1.'"'}}>
@if($errors->has('address1'))
{{$errors->first('address1')}}
@endif

    </label>
    <label>
    Address 2:
    <input type="text" name="address2" id="address2"  {{ Input::old('address2') ? 'value="'. e(Input::old('address2')) .'"' : 'value="'.$rs->address2.'"'}}>
    </label>
    <label>County:
    <input type="text" name="county" id="county"  {{ Input::old('county') ? 'value="'. e(Input::old('county')) .'"' : 'value="'.$rs->County.'"'}}>
@if($errors->has('county'))
{{$errors->first('county')}}
@endif

    </label>
    <label>Country:
    <input type="text" name="country" id="country"  {{ Input::old('country') ? 'value="'. e(Input::old('country')) .'"' : 'value="'.$rs->country.'"'}}>
@if($errors->has('country'))
{{$errors->first('country')}}
@endif

    </label>
    <label>Land Line:
    <input type="text" name="landline" id="landline"  {{ Input::old('landline') ? 'value="'. e(Input::old('landline')) .'"' : 'value="'.$rs->landline.'"'}}>
    </label>
    <label>Mobile:
    <input type="text" name="mobile" id="mobile"  {{ Input::old('mobile') ? 'value="'. e(Input::old('mobile')) .'"' : 'value="'.$rs->mobile.'"'}}>
    </label>
    <input type="submit" name="update" id="update" value="Update">

  {{Form::token()}}
</form>
@endforeach
</section>


@stop