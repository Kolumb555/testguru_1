document.addEventListener('turbolinks:load', function() {

  let timer = document.querySelector('#time')

  if (timer){
    deadline = timer.dataset.deadline
    setInterval(updpateCountdown, 1000)
  }

  const countdownEl = document.querySelector('#timer')

  function updpateCountdown() {

    let time = deadline - new Date().getTime() / 1000

    let minutes = Math.floor(time / 60)
    let seconds = Math.floor(time % 60)

    seconds = seconds < 10 ? '0' + seconds : seconds

    countdownEl.innerHTML = `${minutes}:${seconds}`

    if (time < 0.5) {
      countdownEl.innerHTML = '00:00'
      document.getElementById('test_passage_form').submit()
    }
  }
})