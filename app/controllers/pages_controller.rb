class PagesController < ApplicationController
  def start
    render params[:start], :layout => 'start'
  end

  def loginpage
    render params[:loginpage], :layout => 'start'
  end



  def home
  end

  def about
  end

  def contact
  end

  def help
  end
end
