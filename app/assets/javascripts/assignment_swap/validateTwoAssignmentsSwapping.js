
//checks if the form can be submitted
function checkValidForm(event)
{
  var numChecked = countCheckboxes();
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
function submitableForm()
{
  var numChecked = countCheckboxes();

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
function countCheckboxes()
{
  var checkboxes = document.getElementsByClassName("checkbox"); 
  var numChecked = 0;

  var i = 0
  for(i = 0; i < checkboxes.length; i++)
  {
    if(checkboxes[i].checked == true)
    {
      numChecked++;
    }
  }

  return numChecked;
}

function checkForTwoAssignmentsSelected()
{
  var form = document.getElementById("swapping-form");

  document.getElementById("submit-btn").disabled = true;

  if(form != null)
  {
   form.addEventListener("submit", checkValidForm)
  }

  var checkboxes = document.getElementsByClassName("checkbox");

  var i = 0
  for(i = 0; i < checkboxes.length; i++)
  {
    checkboxes[i].addEventListener("change", submitableForm)
  }
}

$(document).on("turbolinks:load", checkForTwoAssignmentsSelected);
