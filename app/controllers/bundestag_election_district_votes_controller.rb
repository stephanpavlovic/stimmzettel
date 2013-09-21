class BundestagElectionDistrictVotesController < ApplicationController

  def index
    @district = params[:district].present? ? ElectoralDistrict.where(official_id: params[:district]).first : ElectoralDistrict.all.first
  end
end
