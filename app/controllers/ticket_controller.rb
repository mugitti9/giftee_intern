class TicketController < ApplicationController
  def issue
    @items = Item.all
    puts @items
  end
end
