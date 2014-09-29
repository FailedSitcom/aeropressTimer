
(function() {

  var countdownWorker = function() {
    var timer = '<%= @recipe.seconds %>';
    var audio = document.getElementsByTagName("audio")[0];
    $('#defaultCountdown').countdown({
      until: timer,
      onExpiry: function() {
        audio.play();
      },
    format: 'MS'});

    $('#defaultCountdown').countdown('pause')


    $("#pause").click(function() {
      $('#defaultCountdown').countdown('toggle')
    });

    $( "#start" ).click(function() {
      $('#defaultCountdown').countdown('resume')
      setTimeout(function() { $('#defaultCountdown').countdown('option','until', timer)})
    });
  };
})
