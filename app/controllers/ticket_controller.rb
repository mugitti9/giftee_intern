class TicketController < ApplicationController
  def issue
    @items = Item.all
    puts @items
  end
  
  def list
  end
  
  def analyze
  end
end
