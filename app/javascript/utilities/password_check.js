document.addEventListener('turbolinks:load', function() {

  let password = document.querySelector('#user_password')
  let password_confirmation = document.querySelector('#user_password_confirmation')

  if (password_confirmation) {
    password.addEventListener('input', password_match_check)
    password_confirmation.addEventListener('input', password_match_check)
    }
})

function password_match_check () {

  let password_input = document.querySelector('#user_password').value
  let password_confirmation_input = document.querySelector('#user_password_confirmation').value

  if (password_confirmation_input === '') {
    document.querySelector('.password_match').classList.add('hide')
    document.querySelector('.password_not_match').classList.add('hide')
  } 
  
  else if (password_input === password_confirmation_input) {
    document.querySelector('.password_match').classList.remove('hide')
    document.querySelector('.password_not_match').classList.add('hide')

  } else {
    document.querySelector('.password_match').classList.add('hide')
    document.querySelector('.password_not_match').classList.remove('hide')
  }
}