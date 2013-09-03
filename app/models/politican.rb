class Politican < ActiveRecord::Base
  belongs_to :party
  belongs_to :electoral_district
end
