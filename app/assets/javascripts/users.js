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
  $('a').not('.logo').button();
  $('input[type=submit]').button();

  $('input[data-autocomplete]').railsAutocomplete();
  $('#user_city').suggest({key: 'AIzaSyBZ1M9CIeCufVkulo1zYFtJ-xZsYJD81sM', filter:'(all type:/location/citytown)', flyout: false});
  $('#team_location').suggest({key: 'AIzaSyBZ1M9CIeCufVkulo1zYFtJ-xZsYJD81sM', filter:'(all type:/location/citytown)', flyout: false});

  $('.pick_sport').click(function(event) {
    var img1 = $(this).find('img')
    var src1 = img1.attr("src")
    var selected = $(this).data("selected")
    if(selected) {
      src1 = (src1 + "").replace('_selected','')
      img1.attr("src", src1);
      $(this).data("selected", false);
    }
    else {
      src1 = (src1 + "").replace('.png','_selected.png')
      img1.attr("src", src1);
      $(this).data("selected", true);
    }
    event.preventDefault();
  });
}
