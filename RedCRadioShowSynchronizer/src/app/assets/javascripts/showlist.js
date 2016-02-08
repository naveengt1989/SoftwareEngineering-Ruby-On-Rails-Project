function loadShowEvent() 
{
	if ($('#showType').val() == 'showByName')
	{
		$("#showEventName").show();
		loadShowForName() ;
		$("#showEventDay").hide();
	}
	else
	{
		$("#showEventName").hide();
		$("#showEventDay").show();
		loadShowForDay(); 
	}
}

function loadShowForName() 
{
	
	if ($('#showName').val() != "Select")
	{
		var showToBeLoaded = "/radio_shows/showList/" + $('#showName').val();
		
		$('.showsForName').load(showToBeLoaded);
	}
	else
	{
		$('.showsForName').empty();
	}
}	

function loadShowForDay() 
{
	if ($('#showDay').val() != "Select")
	{
		var showToBeLoaded = "/radio_shows/showList/" + $('#showDay').val();
	
		$('.showsForDay').load(showToBeLoaded);
		
	}
	else
	{
		$('.showsForDay').empty();
	}
}	

// function blink() {
   // var f = document.getElementById('current');
   // setInterval(function() {
      // f.style.display = (f.style.display == 'none' ? '' : 'none');
   // }, 500);
// }






$(window).load(function() {
		var randomNum = Math.ceil(Math.random() * 999999);
		var jsfile = '/assets/cocoon.js?v=' + randomNum;
		$.getScript(jsfile, function(data, textStatus, jqxhr) { });


		setInterval(function() {
			$('.clock').load('/radio_shows/loadClock');
			}, 1000);	
		setInterval(function() {
			$('.events').load('/radio_shows/loadEvents');  
			}, 1000);


		});



