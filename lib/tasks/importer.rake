require 'csv'

namespace :import do
  desc 'import politicans and districts'
  task data: :environment do
    csv_text = File.read("db/Direktkandidaten_Direktkandidatinnen.csv")
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      #setup parties and electoral districts
      party = if Party.where(slug: row[2]).empty?
        Party.create(slug: row[2], name: row[3]) if row[2].present?
      else
        Party.where(slug: row[2]).first
      end

      district = if ElectoralDistrict.where(official_id: row[4]).empty?
        ElectoralDistrict.create(official_id: row[4], name: row[5]) if row[4].present?
      else
        ElectoralDistrict.where(official_id: row[4]).first
      end
      politician = Politican.create(name: row[1], party_id: party.try(:id), electoral_district_id: district.try(:id), job: row[6], city: row[7], year_of_birth: row[8], parlament_watch_url: row[9])
      p politician.name
    end
  end
end
