# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# work with turbolinks
$(document).on 'turbolinks:load', -> $('#gallery').justifiedGallery({rowHeight: window.innerHeight / 1.5})
#$.ajax({type: 'get', url: 'http://localhost:3000/pictures', dataType:'json', success: function(data){console.log(data)}})
