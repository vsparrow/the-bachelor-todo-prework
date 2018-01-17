def get_first_name_of_season_winner(data, season)
  # code here
  # puts "*********************************#{data[season]}"
  winner = nil
  data[season].each do |json_value|
    # puts "************************************#{json_value["status"]}"
    winner =  json_value["name"] if json_value["status"]=="Winner"
  end #each
  winner.split(" ")[0]
end

def get_contestant_name(data, occupation)
  # code here
  desired_contestant = nil
  data.each do |season, season_contestants|
    season_contestants.each do |contestant|
      # puts "***********************************#{contestant}"
      if contestant["occupation"] == occupation
        desired_contestant = contestant["name"]
        return desired_contestant
      end #if

    end #season_contestants
  end #each
end

def count_contestants_by_hometown(data, hometown)
  # code here
  count = 0
  data.each do |season, season_contestants|
    season_contestants.each do |contestant|
      count += 1 if contestant["hometown"] == hometown
    end #season_contestants
  end #each
  count
end

def get_occupation(data, hometown)
  # code here
  occupations = []
  data.each do |season, season_contestants|
    season_contestants.each do |contestant|
      occupations << contestant["occupation"] if contestant["hometown"] == hometown
    end #season_contestants
  end #each
  # puts "******************************#{occupations}"
  return occupations[0]
end

def get_average_age_for_season(data, season)
  # code here
  count = 0
  age_total = 0
  data[season].each do |contestant|
    # puts "***********************#{contestant}"
    count += 1
    age_total += contestant["age"].to_i
    # season_contestants.each do |contestant|
    #   # count += 1 if contestant["hometown"] == hometown
    #
    # end #season_contestants
  end #each
  # puts "**************************#{age_total}::#{count}::#{(age_total/count).ceil}"
  (age_total.to_f/count.to_f).round
  # age_total/count.round
end
