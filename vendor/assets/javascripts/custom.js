//= Custom JS
//

// Add class for stacked list
// in navigation
//

$( window ).load(function() {
  enquire.register("screen and (max-width: 768px)", {
      match : function() {
        $('.page').wrap( "<div data-no-turbolink></div>" );
        $('ul#navigation').addClass('nav-stacked');
        $('ul#navigation > li').removeClass('pull-right').addClass('mobile-stacked');
        $('ul#nav-top').addClass('row');
      },  
      unmatch : function() {
        $('.page').unwrap( "<div data-no-turbolink></div>" );
        $('ul#navigation').removeClass('nav-stacked');
        $('ul#navigation > li').addClass('pull-right').removeClass('mobile-stacked');
        $('ul#nav-top').removeClass('row');
      }
  });
});

// Loading Github Gists
//

function loadGist(element, gistId) {
    var callbackName = "gist_callback";
    window[callbackName] = function (gistData) {
        delete window[callbackName];
        var html = '<link rel="stylesheet" href="' + escapeHtml(gistData.stylesheet) + '"></link>';
        html += gistData.div;
        element.innerHTML = html;
        script.parentNode.removeChild(script);
    };
    var script = document.createElement("script");
    script.setAttribute("src", "https://gist.github.com/" + gistId + ".json?callback=" + callbackName);
    document.body.appendChild(script);
}