function show_row_2(){


$('#intervention_customer_id').click(function(){
  var val = $(this).val();
// console.log('triggered');
// console.log(val);

$.ajax({
 url: '/interventions/get_building?id=',
 method: "GET",  
 dataType: "json",
 data: {customer_id: val},
 error: function (xhr, status, error) {
  console.error('AJAX Error: ' + status + error);
},
success: function (response) {
  // console.log(response);
  var building = response["building"];
  document.getElementById('building').style.display = val != "" ? 'block' : 'none';
  $("#intervention_building_id").empty();
  $('#intervention_building_id').addClass("form-control")
  $('#intervention_building_id').prop('required', 'true')
  $("#intervention_column_id").empty();
  $('#intervention_column_id').addClass("form-control")
  $("#intervention_elevator_id").empty();
  $('#intervention_elevator_id').addClass("form-control")
  $("#intervention_building_id").append('<option value ="">Select Building</option>');
  for(var i = 0; i < building.length; i++){
    $("#intervention_building_id").append('<option value="' + building[i]["id"] + '">' + "Building #" +building[i]["id"] +  '</option>');
  }
}
});
});

$('#intervention_building_id').change(function(){
var val2 = $(this).val();

// console.log("2nd dropdown value = " + val2);



$.ajax({
 url: '/interventions/get_battery?',
 method: "GET",  
 dataType: "json",
 data: {battery_id: val2},
 error: function (xhr, status, error) {
  console.error('AJAX Error: ' + status + error);
},
success: function (response) {
  console.log(response);
  var battery = response["battery"];
  document.getElementById('battery').style.display = val2 != "" ? 'block' : 'none';

  $("#intervention_battery_id").empty();
  $('#intervention_battery_id').addClass("form-control")


  $("#intervention_battery_id").append('<option value = "">Select Battery</option>');
  for(var i = 0; i < battery.length; i++){
    $("#intervention_battery_id").append('<option value="' + battery[i]["id"] + '">' + "Battery #" +battery[i]["id"] + '</option>');
  }
}
});
});

$('#intervention_battery_id').change(function(){
  var val3 = $(this).val();
  
  console.log("3rd dropdown value = " + val3);
  
  $.ajax({
   url: '/interventions/get_column?',
   method: "GET",  
   dataType: "json",
   data: {column_id: val3},
   error: function (xhr, status, error) {
    console.error('AJAX Error: ' + status + error);
  },
  success: function (response) {
    console.log(response);
    var column = response["column"];
    document.getElementById('column').style.display = val3 != "" ? 'block' : 'none';

    $("#intervention_column_id").empty();
  
    $("#intervention_column_id").append('<option value="">None</option>');
    for(var i = 0; i < column.length; i++){
      $("#intervention_column_id").append('<option value="' + column[i]["id"] + '">' + "Column #" +column[i]["id"] + '</option>');
    }
  }
  });
  });

  $('#intervention_column_id').change(function(){
    var val4 = $(this).val();
    
    console.log("3rd dropdown value = " + val4);
    
    $.ajax({
     url: '/interventions/get_elevator?',
     method: "GET",  
     dataType: "json",
     data: {elevator_id: val4},
     error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      console.log(response);
      var elevator = response["elevator"];
    document.getElementById('elevator').style.display = val4 != "" ? 'block' : 'none';

      $("#intervention_elevator_id").empty();
    
      $("#intervention_elevator_id").append('<option value="">None</option>');
      for(var i = 0; i < elevator.length; i++){
        $("#intervention_elevator_id").append('<option value="' + elevator[i]["id"] + '">' + "Elevator #" +elevator[i]["id"] + '</option>');
      }
    }
    });
    });

}
