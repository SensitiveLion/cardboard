class HomesController < ApplicationController
  def index
    if params[:query]
      @pg_search_result = PgSearch.multisearch(params[:query])
      @games = []
      @pg_search_result.each do |result|
        @games << Game.find(result.searchable_id)
      end
    else
      @games = Game.order(created_at: :desc).limit(5)
    end
  end
end
