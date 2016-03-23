class FindUsersController < ApplicationController

  def index
    @search = Sunspot.search( User ) do
      fulltext params[:query]
      order_by( :created_at)
    end

    @jobs = @search.results
    render nothing: true, status: 200
  end

end