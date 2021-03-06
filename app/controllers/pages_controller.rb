class PagesController < ApplicationController
  def home
    @districts= ElectoralDistrict.all
    @district = params[:district].present? ? ElectoralDistrict.where(official_id: params[:district]).first : @districts.first
    @politicians = Politican.where(electoral_district_id: @district)
    @bundesttag_elections = BundestagElection.all.map do |election_day|
      {
        year: election_day.elective_date.year,
        numbers: election_day.bundestag_election_party_votes.map(&:party).map(&:short_name).zip(election_day.bundestag_election_party_votes.map(&:vote_percent))
      }
    end
  end

  def wahlauer
  end
end
