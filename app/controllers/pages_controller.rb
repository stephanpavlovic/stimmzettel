class PagesController < ApplicationController
  def home
    @districts= ElectoralDistrict.all
    @district = params[:district].present? ? ElectoralDistrict.where(official_id: params[:district]).first : @districts.first
    @politicians = Politican.where(electoral_district_id: @district)
    @bundesttag_elections = BundestagElection.all.map do |election_day|
      {
        date: election_day.elective_date,
        numbers: election_day.bundestag_election_party_votes.map(&:party).map(&:short_name).zip(election_day.bundestag_election_party_votes.map(&:vote_percent))
      }
    end
  end
end
