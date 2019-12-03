class SearchController < ApplicationController
  def index
    render locals: {
      search_results: SearchResultFacade.new(params[:state])
    }
  end
end
