
//checks if the form can be submitted
function check_valid_form(event)
{
  var num_checked = count_checkboxes();
  error_div = document.getElementById("form_error_div");

  if(num_checked != 2)
  {
    event.preventDefault();

    error_div.innerHTML = "You need to select at least and only two people to switch!";
  }
  else
  {
    error_div.innerHTML = "";
  }
}

//checks if the submit button should be enabled
function submitable_form()
{
  var num_checked = count_checkboxes();

  if(num_checked == 2)
  {
    document.getElementById("submit_btn").disabled = false;
  }
  else
  {
    document.getElementById("submit_btn").disabled = true;
  }
}

//count how many checkboxes are selected
function count_checkboxes()
{
  var checkboxes = document.getElementsByClassName("checkbox"); 
  var num_checked = 0;

  for(let checkbox of checkboxes)
  {
    if(checkbox.checked == true)
    {
      num_checked++;
    }
  }

  return num_checked;
}

function add_events()
{
  var form = document.getElementById("swapping_form");

  document.getElementById("submit_btn").disabled = true;

  if(form != null)
  {
   form.addEventListener("submit", check_valid_form)
  }

  var checkboxes = document.getElementsByClassName("checkbox");

  for(let checkbox of checkboxes)
  {
    checkbox.addEventListener("change", submitable_form)
  }
}

window.onload = function(){ add_events(); }
