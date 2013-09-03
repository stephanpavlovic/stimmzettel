class PagesController < ApplicationController
  def home
    @districts= ElectoralDistrict.all
    @district = params[:district].present? ? ElectoralDistrict.where(official_id: params[:district]).first : @districts.first
    @politicians = Politican.where(electoral_district_id: @district)
  end
end
