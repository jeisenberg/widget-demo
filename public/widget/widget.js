document.write("<div id='our-awesome-widget-target'></div>");

(function() {

// Localize jQuery variable
var jQuery;

/******** Load jQuery if not present *********/

if (window.jQuery === undefined || window.jQuery.fn.jquery !== '1.4.2') {
    var script_tag = document.createElement('script');
    script_tag.setAttribute("type","text/javascript");
    script_tag.setAttribute("src",
        "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js");
    if (script_tag.readyState) {
      script_tag.onreadystatechange = function () { // For old versions of IE
          if (this.readyState == 'complete' || this.readyState == 'loaded') {
              scriptLoadHandler();
          }
      };
    } else {
      script_tag.onload = scriptLoadHandler;
    }
    // Try to find the head, otherwise default to the documentElement
    (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(script_tag);
} else {
    // The jQuery version on the window is the one we want to use
    jQuery = window.jQuery;
    main();
}

/******** Called once jQuery has loaded ******/
function scriptLoadHandler() {
    // Restore $ and window.jQuery to their previous values and store the
    // new jQuery in our local jQuery variable
    jQuery = window.jQuery.noConflict(true);
    // Call our main function
    main(); 
}

/******** Our main function ********/
function main() { 
    jQuery(document).ready(function($) { 
	

		//document.write("<div id='example-widget-container'></div>")
        /******* Load CSS *******/
        var css_link = $("<link>", { 
            rel: "stylesheet", 
            type: "text/css", 
            href: "http://localhost:3000/assets/widget.css" 
        });
        css_link.appendTo('head');          

        /******* Load HTML *******/
        var receivedForm = function(data) {
		  $("#our-awesome-widget-target").html(data.html);
		}

		$.ajax({
		  url: 'http://localhost:3000/posts/2?callback=?',
		  dataType: 'jsonp',
		  success: receivedForm
		});
    });
}

})();
