# Write your code here!
require 'pry'
def game_hash
  hash = {
    :home => {:team_name => "Brooklyn Nets", 
              :colors => ["Black", "White"],
              :players => [{:player_name => "Alan Anderson",
                            :number => 0, 
                            :shoe => 16,
                            :points => 22,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 3,
                            :blocks => 1,
                            :slam_dunks => 1},
                            {:player_name => "Reggie Evans",
                            :number => 30, 
                            :shoe => 14,
                            :points => 12,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 12,
                            :blocks => 12,
                            :slam_dunks => 7},
                            {:player_name => "Brook Lopez",
                            :number => 11, 
                            :shoe => 17,
                            :points => 17,
                            :rebounds => 19,
                            :assists => 10,
                            :steals => 3,
                            :blocks => 1,
                            :slam_dunks => 15},
                            {:player_name => "Mason Plumlee",
                            :number => 1, 
                            :shoe => 19,
                            :points => 26,
                            :rebounds => 11,
                            :assists => 6,
                            :steals => 3,
                            :blocks => 8,
                            :slam_dunks => 5},
                            {:player_name => "Jason Terry",
                            :number => 31, 
                            :shoe => 15,
                            :points => 19,
                            :rebounds => 2,
                            :assists => 2,
                            :steals => 4,
                            :blocks => 11,
                            :slam_dunks => 1},
                          ]
              }, 
    :away => {:team_name => "Charlotte Hornets", 
              :colors => ["Turquoise", "Purple"],
              :players => [{:player_name => "Jeff Adrien",
                            :number => 4, 
                            :shoe => 18,
                            :points => 10,
                            :rebounds => 1,
                            :assists => 1,
                            :steals => 2,
                            :blocks => 7,
                            :slam_dunks => 2},
                            {:player_name => "Bismack Biyombo",
                            :number => 0, 
                            :shoe => 16,
                            :points => 12,
                            :rebounds => 4,
                            :assists => 7,
                            :steals => 22,
                            :blocks => 15,
                            :slam_dunks => 10},
                            {:player_name => "DeSagna Diop",
                            :number => 2, 
                            :shoe => 14,
                            :points => 24,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 4,
                            :blocks => 5,
                            :slam_dunks => 5},
                            {:player_name => "Ben Gordon",
                            :number => 8, 
                            :shoe => 15,
                            :points => 33,
                            :rebounds => 3,
                            :assists => 2,
                            :steals => 1,
                            :blocks => 1,
                            :slam_dunks => 0},
                            {:player_name => "Kemba Walker",
                            :number => 33, 
                            :shoe => 15,
                            :points => 6,
                            :rebounds => 12,
                            :assists => 12,
                            :steals => 7,
                            :blocks => 5,
                            :slam_dunks => 12},
                          ]
            }  
  }
  hash
end

def build_playerhash_array
  # this helper function is to build an array conntaning hashes of every player and his stats
  playerhash = []
  game_hash.each do |h_w, team|
    playerhash.concat(team[:players])
  end
  playerhash
end

def build_hash(type)
  # Use build_playerhash_array to get array of all players and stat hashes
  # take each player hash in the array and convert it into a hash with player name as the key and the stat type specified by the incoming parm as the value. The entire hash is them return to caller for examination
  # {"name1" => stat, "name2" => stat....}
  pt_hash = build_playerhash_array.to_h {|k| [k[:player_name], k[type]]}
end

def num_points_scored(name)
  # call player_stats to get the stat hash of the player. Then find the stat type (points)
  point_s = player_stats(name)[:points]
end

def shoe_size(name)
  # call player_stats to get the stat hash of the player. Then find the stat type (shoe)
  ssize = player_stats(name)[:shoe]
end

def team_colors(tname)
  # This code option builds a hash with team name as the key and the color array as the value. Then use it as for lookup for the incoming name
  # {team_name => [colors...], team_name => [colors...]}
  # colorhash = {}
  # hash3 = game_hash
  # hash3.each do |h_w, team|
  #   colorhash[team[:team_name]] = team[:colors]
  # end
  # t_color = colorhash[tname]
  
  # First look for the matching team name in each team hash. When found, return the color array
  game_hash.each do |h_w, team|
    if team[:team_name] == tname
      return team[:colors]
    end
  end
end

def team_names
  name_ar = []
  game_hash.each do |h_w, team|
    name_ar << team[:team_name]
  end
  name_ar
end

def player_numbers(tname)
  player_num = []
  game_hash.each do |h_w, team|
    if team[:team_name] == tname
      # should I use flat_map to "build" the array from the players array instead of doing an assignment?
      # player_num = team[:players]
      player_num = team[:players].flat_map
    end
  end
  # Use .map to take each value in the number key to put into new array
  outnum = player_num.map{|h| h[:number]}
end

def player_stats(name)
  # Use build_playerhash_array to get array of all players and stat hashes
  # use .find to look for the matching name and return the hash with the play_name as the first hash key/value pair
  new_hash = build_playerhash_array.find {|x| x[:player_name] == name}
  # remove the first pair (player_name) at the front and the rest of the hashes are returned. 
  new_hash.shift
  new_hash
end

def big_shoe_rebounds
  # call most_stat to get the player name with the biggest shoe size most_stat(:shoe)
  # call build_hash to get all players and their rebounds build_hash(:rebounds)
  # look for the matching player in the hash and get the value 
  build_hash(:rebounds)[most_stat(:shoe)]
end

def most_stat(type)
  # return name of player with the most of any stat type from calling method. This calls the build_hash method to get the player_name as the key and the stat as the value
  # then convert the hash into array 
  # e.g [[name, points], [name, points]....]
  arr = build_hash(type).to_a
  # use .max to compare the value at index 1, which is the stat value
  result = arr.max{|h,k| h[1] <=> k[1]}
  # return the name in index 0
  result[0]
end

def most_points_scored
  # call most_stat to return most points player
  most_stat(:points)
end

def winning_team 
 teams = []
  # build a teams array in this format so .max can be used to find the team with most points -
  #[[team_name, total_points], [team_name, total_points]....]
  game_hash.each do |h_w, team|
    tot = 0
    record = []
    record << team[:team_name]
    # use .sum to total up points for each player in the array team[:players]. The result is an array with the team name and points in an array where index 0 is the name and index 1 is the total points
    tot = team[:players].sum {|x| x[:points]}
    record << tot
    teams << record
  end
  # use .max to get the array entry where index 1 has the highest value
  resultx = teams.max{|h,k| h[1] <=> k[1]}
  # return team name in index 0
  resultx[0]
end

def player_with_longest_name
  names = []
  # Use build_playerhash_array to get array of all players and stat hashes
  # Use .map to extract the player_name into a new array of only names
  names = build_playerhash_array.map{|h| h[:player_name]}
  # use .max_by to find the max length of each array entry
  maxname = names.max_by {|a| a.length}
end

def most_steals
  # call most_stat to return most steals player
  most_stat(:steals)
end

def long_name_steals_a_ton?
  # call most_steals to find the name to compare to the name retrun by player_with_longest_name
  most_steals == player_with_longest_name
end