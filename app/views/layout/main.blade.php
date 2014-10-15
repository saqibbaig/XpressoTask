<!DOCTYPE html>
<html lang="en">
	<head>
	<title>Xpresso Laravel Testing System Task</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="/style.css" type="text/css">
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

	</head>
	<body> 
	<div class ="mainborder">
	<div class="topmenu"><header>

    <img src="logo.png" alt="logo">
   
    
        </header></div>
	<div class="leftmenu">@include('layout/navigation')</div>
	<div class="contentarea">
		
	

    
    <section> @yield('content')</section>
    </div>
    <div class="rightmenu"><aside>right menu</aside></div>
    <div class="footerdiv">
    <footer>
    	&copy; Copywrite Opensource Development for Xpresso test project
    </footer>
    </div>
    </div>
    
    </body>
</html>