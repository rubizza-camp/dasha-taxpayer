// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all

$('#calendar').fullCalendar({
      events:  [
        {
            title  : 'event1',
            start  : '2018-08-15'
        },
        {
            title  : 'event2',
            start  : '2018-08-03',
            end    : '2018-08-05'
        },
        {  title  : 'event3',
            start  : '2018-08-03',
            end    : '2018-08-05'
        },
        {  title  : 'event4',
            start  : '2018-08-03',
            end    : '2018-08-05'
        },
        {  title  : 'event5',
            start  : '2018-08-03',
            end    : '2018-08-05'
        },
        {  title  : 'event6',
            start  : '2018-08-03',
            end    : '2018-08-05'
        },
        {  title  : 'event6',
            start  : '2018-08-03',
            end    : '2018-08-05'
        },
        {  title  : 'event6',
            start  : '2018-08-03',
            end    : '2018-08-05'
        },
        {  title  : 'event6',
            start  : '2018-08-03',
            end    : '2018-08-05'
        }
    ]
});