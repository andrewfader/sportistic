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

  $('.ui-date-picker').datetimepicker(
    { dateFormat: 'dd-M-yy' }
  );
  $('a').button();

  $('input[data-autocomplete]').railsAutocomplete();
  $('#user_city').suggest({key: 'AIzaSyBZ1M9CIeCufVkulo1zYFtJ-xZsYJD81sM', filter:'(all type:/location/citytown)', flyout: false});
  $('#team_location').suggest({key: 'AIzaSyBZ1M9CIeCufVkulo1zYFtJ-xZsYJD81sM', filter:'(all type:/location/citytown)', flyout: false});
}
