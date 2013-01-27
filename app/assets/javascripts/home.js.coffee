# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(() ->
  tweet_piles = $(".tweet_pile")
  tweet_piles.mouseover(() ->
    $(this).stop().animate({boxShadow: '0 0 30px #008000'})
  )
  tweet_piles.mouseout(() ->
    $(this).stop().animate({boxShadow: '0 0 5px #000'})
  )
  tweet_piles.sbscroller(autohide: true);
)