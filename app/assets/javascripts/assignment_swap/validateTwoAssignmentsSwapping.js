
//checks if the form can be submitted
function check_valid_form(event)
{
  var numChecked = count_checkboxes();
  errorDiv = document.getElementById("form-error-div");

  if(numChecked != 2)
  {
    event.preventDefault();

    errorDiv.innerHTML = "You need to select at least and only two people to switch!";
  }
  else
  {
    errorDiv.innerHTML = "";
  }
}

//checks if the submit button should be enabled
function submitable_form()
{
  var numChecked = count_checkboxes();

  if(numChecked == 2)
  {
    document.getElementById("submit-btn").disabled = false;
  }
  else
  {
    document.getElementById("submit-btn").disabled = true;
  }
}

//count how many checkboxes are selected
function count_checkboxes()
{
  var checkboxes = document.getElementsByClassName("checkbox"); 
  var numChecked = 0;

  for(let checkbox of checkboxes)
  {
    if(checkbox.checked == true)
    {
      numChecked++;
    }
  }

  return numChecked;
}

function check_for_two_assignments_selected()
{
  var form = document.getElementById("swapping-form");

  document.getElementById("submit-btn").disabled = true;

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

window.onload = check_for_two_assignments_selected
