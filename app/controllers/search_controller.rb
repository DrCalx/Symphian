class SearchController < ApplicationController
  def show
    @answers = User.starts_with(params[:starts_with])
    render 'static_pages/search_results'
  end
end
