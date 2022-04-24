document.addEventListener('turbolinks:load', function() {

  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) { showProgress(progressBar) }

  function showProgress(progressBar) {
    var questionNumber = progressBar.dataset.questionNum
    var totalQuestions = progressBar.dataset.questionsQty

      var progress = ((questionNumber - 1) / totalQuestions).toFixed(2) * 100 + "%"

    progressBar.style.width = progress
    progressBar.textContent = progress

  }
})
