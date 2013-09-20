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
    header: {
      left: 'title',
      center: 'month basicWeek',
      right: 'today prev,next'
    }
  })

  $('.ui-date-picker').datetimepicker(
    { dateFormat: 'dd-M-yy' }
  );
  $('a').not('.logo').button();
  $('input[type=submit]').button();

  $('input[data-autocomplete]').railsAutocomplete();

  if ($('#user_city').length > 0) {
    $('#user_city').suggest({key: 'AIzaSyBZ1M9CIeCufVkulo1zYFtJ-xZsYJD81sM', filter:'(all type:/location/citytown)', flyout: false});
  }
  if ($('#team_location').length > 0) {
    $('#team_location').suggest({key: 'AIzaSyBZ1M9CIeCufVkulo1zYFtJ-xZsYJD81sM', filter:'(all type:/location/citytown)', flyout: false});
  }

  if ($('.pick_sport').length > 0) {
    var sports;
    var user_sports;
    $.getJSON('/sports.json', function(data, status, xhr) {
      sports = data;

      $.getJSON('/user_sports.json', function(data, status, xhr) {
        user_sports = data;
        user_sports.map(function(user_sport) {
          var name = sports[user_sport["sport_id"]].attributes["name"];
          var link = $('.pick_sport').parent().find("a#" + name);
          var image = link.find('img')
          var source = image.attr("src")
          source = source.replace('.png','_selected.png')
          image.attr("src", source);
          $(link[0]).data("selected", true);
        });
      });
    });

    $('.pick_sport').click(function(event) {
      var image = $(this).find('img');
      var source = image.attr("src");
      var selected = $(this).data("selected");
      var name = $(this).attr('id');
      var found;

      for (i=0; i<sports.length; i++) {
        sport = sports[i];
        if (sport.attributes["name"] == name) {
          found = sport;
        }
      }
      var sport_id = found.attributes["id"]

      if(selected) {
        source = source.replace('_selected','')
        selected = false;
        var user_sport_id;

        for(i=0; i<user_sports.length; i++) {
          if (user_sports[i]['sport_id'] == sport_id) {
            user_sport_id = user_sports[i]['id'];
          }
        }
        $.post('/user_sports/' + user_sport_id, {"_method":"delete"}, function() {
          location.reload();
        });
      }
      else {
        source = source.replace('.png','_selected.png')
        selected = true;
        $.post('/user_sports/',{user_sport: {user_id: location.href.split("/")[4], sport_id: sport_id }}, function(){
          location.reload();
        });
      }

      image.attr("src", source);
      $(this).data("selected", selected);

      event.preventDefault();
    });
  }

  $('form.edit_user').change(function() {
    $(this).submit();
  }
  )
}
