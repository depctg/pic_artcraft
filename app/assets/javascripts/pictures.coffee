# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# work with turbolinks

bufferSize = 100
genPictureItem = (picture) ->
  modString = "<div class='picture'>
                 <a href='#{picture.raw}'> <img src='#{picture.thumbnail}'/> </a>\
                 <div class='caption'>
                   <a download='#{picture.filename}' href='#{picture.download}'>download</a>
                 </div>
               </div>"
  return modString


$(document).on 'turbolinks:load', ->
  $('#gallery').justifiedGallery
    rowHeight: window.innerHeight / 1.5
    lastRow: 'center'
    margins: 2

  $(window).scroll ->
    if $(window).scrollTop() and $(window).scrollTop() + $(window).height() == $(document).height()
      # if there are more picture
      if $('nav.pagination a[rel=next]').length
        $.ajax
          type: 'get'
          url: $('nav.pagination a[rel=next]').attr('href')
          dataType:'json'
          success: (data) ->
            for picture in data.picture
              $('#gallery').append genPictureItem(picture)
            $('#gallery').justifiedGallery 'norewind'
            # render new nav bar
            $('nav.pagination').html data.nav
          error: (e) ->
            console.log('Scroll load json Error', e)
      else
        # No more picture, render footer
        $('footer.footer').show()


