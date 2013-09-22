# encoding: UTF-8
require 'csv'

namespace :import do
  desc 'import politicans, districts and previous election data'
  task all: [:politicans_and_districts, :previous_elections] do
  end

  desc 'import politicans and districts'
  task politicans_and_districts: :environment do
    csv_text = File.read("db/Direktkandidaten_Direktkandidatinnen.csv")
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      #setup parties and electoral districts
      party = if Party.where(slug: row[2].parameterize(sep='_')).empty?
        Party.create(slug: row[2].parameterize(sep='_'), name: row[3], short_name: row[2]) if row[2].parameterize(sep='_').present?
      else
        Party.where(slug: row[2].parameterize(sep='_')).first
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

  desc 'import previous elections'
  task previous_elections: :environment do

    csv_text_percent = File.read("db/2013-09-03_ergebnisse_der_bundestagswahlen_in_koeln_seit_1949_prozent.csv")
    csv_percent = CSV.parse(csv_text_percent, headers: true)
    csv_text_numbers = File.read("db/2013-09-03_ergebnisse_der_bundestagswahlen_in_koeln_seit_1949_zahl.csv")
    csv_numbers = CSV.parse(csv_text_numbers, headers: true)

    if csv_percent.length == csv_numbers.length
      csv = csv_percent.zip(csv_numbers)
      csv.each do |row|
        bte = BundestagElection.create(
          elective_date: row[0]["wahltag"],
          elective_count: row[1]["wahlberechtigte"],
          elective_percent: row[0]["wahlberechtigte"],
          had_choosen_count: row[1]["waehler_waehlerinnen"],
          had_choosen_percent: row[0]["waehler_waehlerinnen"],
          valid_votes_count: row[1]["gueltige_stimmen"],
          valid_votes_percent: row[0]["gueltige_stimmen"],
          )

        %w(spd cdu grüne fdp die_linke sonstige).each do |p|
          party = Party.where(slug: p.parameterize(sep='_')).first_or_create
          BundestagElectionPartyVote.create(
            bundestag_election_id: bte.id,
            party_id: party.id,
            vote_count: row[1][p.parameterize(sep='_')].to_i,
            vote_percent: row[0][p.parameterize(sep='_')].to_f
            )
        end
      end
    end
  end

  desc 'import wahlbeteiligung 2013/2009'
  task wahlbeteiligung_2013_2009: :environment do

    csv_text = File.read("db/2013-09-22_wahlbeteiligung_koeln.csv")
    csv = CSV.parse(csv_text, headers: true)

    election_2013 = BundestagElection.find_by_elective_date("2013-09-22") ||  BundestagElection.create(elective_date: "2013-09-22", elective_count: 722430, elective_percent: 100)
    election_2009 = BundestagElection.find_by_elective_date("2009-09-27") ||  BundestagElection.create(elective_date: "2009-09-27", elective_count: 703424, elective_percent: 100)
    
    BundestagElectionDistrictVote.destroy_all

    csv.each do |row|

      BundestagElectionDistrictVote.create(
        election_id: election_2013.id,
        vote_count: election_2013.elective_count.to_i * row["2013"].gsub(",",".").to_f,
        vote_percent: row["2013"].gsub(",","."),
        time: row["Uhrzeit"])

      BundestagElectionDistrictVote.create(
        election_id: election_2009.id,
        vote_count: election_2009.elective_count.to_i * row["2009"].gsub(",",".").to_f,
        vote_percent: row["2009"].gsub(",","."),
        time: row["Uhrzeit"]) 
        
    #   election_vote_2013 = BundestagElectionDistrictVote.find_by_time(Time.zone.parse(row["Uhrzeit"].gsub(" Uhr","")).utc)
    #   if election_vote_2013
    #     unless election_vote_2013.vote_percent == row["2013"].gsub(",",".").to_f
    #       election_vote_2013.update_attribute(:vote_percent, row["2013"])
    #     end
    #   else
    #     BundestagElectionDistrictVote.create(
    #       election_id: election_2013.id,
    #       vote_count: election_2013.elective_count.to_i * row["2013"].gsub(",",".").to_f,
    #       vote_percent: row["2013"].gsub(",","."),
    #       time: row["Uhrzeit"])
    #   end

    #   election_vote_2009 = BundestagElectionDistrictVote.find_by_time(Time.zone.parse(row["Uhrzeit"].gsub(" Uhr","")).utc)
    #   if election_vote_2009
    #     unless election_vote_2009.vote_percent == row["2009"].gsub(",",".").to_f
    #       election_vote_2009.update_attribute(:vote_percent, row["2009"])
    #     end
    #   else
    #     BundestagElectionDistrictVote.create(
    #       election_id: election_2009.id,
    #       vote_count: election_2009.elective_count.to_i * row["2009"].gsub(",",".").to_f,
    #       vote_percent: row["2009"].gsub(",","."),
    #       time: row["Uhrzeit"])       
    #   end
    end

    latest_2013_update = BundestagElectionDistrictVote.where(election_id: election_2013.id).where.not(vote_count: 0).last
    election_2013.update_attributes(had_choosen_count: latest_2013_update.vote_count, had_choosen_percent: latest_2013_update.vote_percent)
  end


end
