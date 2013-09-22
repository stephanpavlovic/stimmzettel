// (function($){

//   $( document ).ready(function() {

//     var historic_data = $('.m-historic-statistics').data('bundesttag-elections');
//     var stats_el = $('<div class="year">');
//     stats_el.data('year', historic_data[0].year);
//     stats_el.css('width', '100%');
//     $.each(historic_data[0].numbers, function(key, party_percent){
//       var party_el = $('<div class="party">');
//       party_el.data('name', party_percent[0]);
//       party_el.data('percent', party_percent[1]);
//       party_el.css('width', party_percent[1]+'%');
//       stats_el.append(party_el);
//     });
//     $('.m-historic-statistics').append(stats_el);

//   });

// }(jQuery));
