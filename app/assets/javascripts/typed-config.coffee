onReady = ->
  new Typed '.element',
    strings: [
      'Software development is the closest we have to magic.',
      "It's my goal to ensure that anyone with a passion for coding can become a true programming artisan"
    ],
    typeSpeed: 20

$(document).ready onReady

$(document).on 'turbolinks:load', onReady
