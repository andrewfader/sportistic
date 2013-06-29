$(document).bind('page:load', function() { readyUp() });
$(document).ready(function() { readyUp() });

function readyUp() {
  $('.datatable').dataTable({
    "bJQueryUI": true
  });

  $('.calendar').fullCalendar({
    events: '/games.json',
    theme: true,
    height: 1000,
  })

  $('.ui-date-picker').datetimepicker();
}
