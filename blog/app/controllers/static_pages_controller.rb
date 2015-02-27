class StaticPagesController < ApplicationController
  layout nil
  def home
    render :layout => false
  end
end
