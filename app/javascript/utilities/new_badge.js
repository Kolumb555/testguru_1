document.addEventListener('turbolinks:load', function() {

  let rule_type = document.querySelector('#badge_rule')

  if (rule_type) {
    rule_type.addEventListener('input', show_options)
  }

  function show_options() {
    
    let rule_chosen = document.querySelector('#badge_rule').value

    if (rule_chosen === "category") {
      document.querySelector('.category_rule').classList.remove('hide')
      document.querySelector('.level_rule').classList.add('hide')
    } else if (rule_chosen === "level") {
      document.querySelector('.category_rule').classList.add('hide')
      document.querySelector('.level_rule').classList.remove('hide')
    } else {
      document.querySelector('.category_rule').classList.add('hide')
      document.querySelector('.level_rule').classList.add('hide')
    }
  }
})

