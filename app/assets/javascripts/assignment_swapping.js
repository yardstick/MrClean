function add_events()
{
  var form = document.getElementById("swapping_form");

  if(form != null)
  {
   form.addEventListener("submit", function(event){ check_valid_form(event); })
  }

  var input_elements = document.getElementsByTagName("input");

  for(var i = 0; i<input_elements.length; i++)
  {
    if(input_elements[i].type == "checkbox")
    {
      input_elements[i].addEventListener("change", function(){document.getElementById("submit_btn").disabled = false;})
      //reenabled the submit button after a checkbox is changed, if the button was disabled by a invalid form submission
    }
  }
}

function check_valid_form(event)
{
  var num_checked = count_checkboxes();
  error_div = document.getElementById("form_error_div");

  if(num_checked != 2)
  {
    event.preventDefault();

    error_div.innerHTML = "Can't submit form! Needs 2 checkboxes selected but has " + num_checked + "!";
  }
  else
  {
    error_div.innerHTML = "";
  }

  document.getElementById("submit_btn").disabled = false
}

function count_checkboxes()
{
  var input_elements = document.getElementsByTagName("input"); 
  var num_checked = 0;

  for(i=0; i<input_elements.length; i++)
  {
    if(input_elements[i].type == "checkbox" && input_elements[i].checked == true)
    {
      num_checked++;
    }
  }

  return num_checked;
}

window.onload = function(){ add_events(); }
