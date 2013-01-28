# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(() ->
  tweet_piles = $(".tweet_pile")
  tweet_piles.mouseover(() ->
    $(this).stop().animate({boxShadow: '0 0 15px 5px #008000'})
  )
  tweet_piles.mouseout(() ->
    $(this).stop().animate({boxShadow: '0 0 5px 0px #000'})
  )
  tweets = $(".tweets")
  tweets.sbscroller(autohide: true);
  tweets.each(() -> 
    $(this).scrollTop(this.scrollHeight)
    $(this).sbscroller('refresh')
  )
)