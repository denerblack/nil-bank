# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".sale").on 'click', (e) ->
    e.preventDefault()
    $this = $(this)
    $data = $this.data()
    i = $this.data('index')
    quantity = $("#sale_#{i}quantity").val()
    console.log(quantity)
    send_data = {
      investment_portfolio: {
        id: $data.id,
        sale_price: $data.salePrice,
        sale_quantity: quantity,
        status: $data.status,
      }
    }
    $.post $data.url,
      send_data
