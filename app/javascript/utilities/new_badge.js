document.addEventListener('turbolinks:load', function() {

  let rule_type = document.querySelector('#badge_rule')

  if (rule_type) {
    rule_type.addEventListener('input', show_options)
  }

  function show_options() {
    
    let rule_chosen = document.querySelector('#badge_rule').value
    let rule_options = document.querySelectorAll('.rule_option')

    if (rule_options.length) {
      for (var i = 0; i < rule_options.length; i++) {
        rule_options[i].classList.add('hide')
      }
     
    if (document.querySelector('#'+rule_chosen+'_rule')) {
      document.querySelector(('#'+rule_chosen+'_rule').toString()).classList.remove('hide')
      }
    }
  }
})