<nav>
<ul>
	<li><A href="{{ URL::route('home') }}"> Home </A></li>
	@if(Auth::check())
	@if(Auth::user()->acc_type==1)
	Administrator Menu 
	<li><A href="{{ URL::route('account-updateprofile') }}"> Admin Option 1 </A></li>
	<li><A href="{{ URL::route('account-updateprofile') }}"> Admin Option 2 </A></li>
	<li><A href="{{ URL::route('account-updateprofile') }}"> Admin Option 3 </A></li>
	<li><A href="{{ URL::route('account-updateprofile') }}"> Admin Option 4 </A></li>
	<li><A href="{{ URL::route('account-updateprofile') }}"> Admin Option 5</A></li>
	@elseif((Auth::user()->acc_type)==2)
	Manager Menu
	<li><A href="{{ URL::route('account-updateprofile') }}"> Manager Option 1 </A></li>
	<li><A href="{{ URL::route('account-updateprofile') }}"> Manager Option 2 </A></li>
	<li><A href="{{ URL::route('account-updateprofile') }}"> Manager Option 3 </A></li>
	<li><A href="{{ URL::route('account-updateprofile') }}"> Manager Option 4</A></li>

	@else
	User Menu
	@endif
	<br>
	Hello, {{Auth::user()->username}}
	<li><A href="{{ URL::route('account-updateprofile') }}"> Update Profile </A></li>
	<LI><A href="{{ URL::route('admin-changepass') }}"> Change Password </A></LI>
	<LI><A href="{{ URL::route('admin-signout') }}"> Logout </A></LI>
    @else
	<li><A href="{{ URL::route('admin-signin') }}"> SignIn </A></li>
	
	
	@endif
	
</ul>
</nav>