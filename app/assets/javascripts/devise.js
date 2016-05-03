// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require prefixfree.min

var working = false;
var $this = $('.login'),
    $state = $this.find('button > .state');
$this
    .bind('ajax:send', function(event, jqxhr, settings){
        if (working) return;
        working = true;
        $this.addClass('loading');
        $state.html('Authenticating');
    })
    .bind('ajax:success', function( event, xhr, settings ) {
        $this.addClass('ok');
        $state.html('Welcome back! <br/> your will be redirect in 5 second');
    })
    .bind('ajax:error', function( event, request, settings ) {
        $this.addClass('error');
        $state.html('Sorry something wrong!');
        setTimeout(function() {
            $state.html('Log in');
            $this.removeClass('error loading');
            working = false;
        }, 2000);
    })
    .bind('ajax:stop', function(){
        $this.addClass('error');
        $state.html('Sorry something wrong!');
        setTimeout(function() {
            $state.html('Log in');
            $this.removeClass('error loading');
            working = false;
        }, 2000);
    });
