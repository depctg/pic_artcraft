# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# work with turbolinks

bufferSize = 100

genPictureItem = (picture) ->
  modString = "<div class='picture'>
                 <a href='#{picture.raw}'> <img src='#{picture.thumbnail}'/> </a>\
                 <div class='caption'>
                   #{picture.filename}
                   <a download='#{picture.filename}' href='#{picture.download}'>\
                    <i class='color-white fa fa-arrow-circle-o-down fa-2x'></i>
                   </a>
                 </div>
               </div>"
  return modString

# Methods
$(document).on 'turbolinks:load', ->
  $('#gallery').justifiedGallery
    rowHeight: window.innerHeight / 3
    lastRow: 'center'
    margins: 3

  pic_allow_load = true
  $(window).scroll ->
    if $(window).scrollTop() and $(window).scrollTop() + $(window).height() == $(document).height()
      if pic_allow_load
        if $('nav.pagination a[rel=next]').length
          pic_allow_load = false
          # if there are more pictures
          # start spinning animation
          $('#gallery').data('jg.controller').startLoadingSpinnerAnimation()
          # start ajax load
          $.ajax
            type: 'get'
            url: $('nav.pagination a[rel=next]').attr('href')
            dataType:'json'
            success: (data) ->
              for picture in data.picture
                $('#gallery').append genPictureItem(picture)
              $('#gallery').justifiedGallery 'norewind'
              # render new nav bar
              # TODO: new way to render nav bar (possible with bootstrap
              $('nav.pagination').html data.nav

              pic_allow_load = true
            error: (e) ->
              console.log('Scroll load json Error', e)
        else
          # No more picture, render footer
          $('footer.footer').show()
          pic_allow_load = false


