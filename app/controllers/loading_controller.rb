class LoadingController < ApplicationController


  def index


      @keywords = Array.new
  # get search value get param
    if params[:keywords] != nil
      @keywords = params[:keywords]
    end

    @keywords

  end
end
