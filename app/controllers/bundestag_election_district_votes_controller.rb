class BundestagElectionDistrictVotesController < ApplicationController

  def index
    @district = params[:district].present? ? ElectoralDistrict.where(official_id: params[:district]).first : ElectoralDistrict.all.first
    @wahlbeteiligung = BundestagElectionDistrictVote.all
    @election_2009 = BundestagElection.find_by_elective_date("2009-09-27")
    @election_2013 = BundestagElection.find_by_elective_date("2013-09-22")
  end
end
