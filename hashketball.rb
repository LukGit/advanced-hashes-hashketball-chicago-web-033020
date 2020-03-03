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

def build_hash(type)
  player_ah = []
  hash1 = game_hash
  hash1.each do |h_w, team|
    player_ah.concat(team[:players])
  end
  # take each player hash in the array and convert it into a hash with player name as the key and the incoming type as the value. The entire hash is them return to caller for examination
  pt_hash = player_ah.to_h {|k| [k[:player_name], k[type]]}
  pt_hash
end

def num_points_scored(name)
  # call player_stats to get the stat of the player. Then find the stat type (points)
  point_s = player_stats(name)[:points]
  point_s
end

def shoe_size(name)
  # call player_stats to get the stat of the player. Then find the stat type (shoe)
  ssize = player_stats(name)[:shoe]
  ssize
end

def team_colors(tname)
  colorhash = {}
  hash3 = game_hash
  hash3.each do |h_w, team|
    colorhash[team[:team_name]] = team[:colors]
  end
  t_color = colorhash[tname]
  t_color
end

def team_names
  name_ar = []
  hash3 = game_hash
  hash3.each do |h_w, team|
    name_ar << team[:team_name]
  end
  name_ar
end

def player_numbers(tname)
  player_num = []
  hash2 = game_hash
  hash2.each do |h_w, team|
    if team[:team_name] == tname
      player_num = team[:players]
    end
  end
  outnum = player_num.map{|h| h[:number]}
  outnum
end

def player_stats(name)
  stat = []
  s_hash = {}
  hash4 = game_hash
  hash4.each do |h_w, team|
    stat.concat(team[:players])
  end
  # use .find to look for the matching name and return the hash with the play_name as the first hash key/value pair
  new_hash = stat.find {|x| x[:player_name] == name}
  # remove the first pair at the front and the rest of the hashes are returned. 
  namex = new_hash.shift
  new_hash
end

def big_shoe_rebounds
  # call most_stat to get the player name with the biggest shoe size most_stat(:shoe)
  # call build_hash to get all players and their rebounds build_hash(:rebounds)
  # look for the matching player in the hash and get the value 
  maxpt = build_hash(:rebounds)[most_stat(:shoe)]
  maxpt
end

def most_stat(type)
  # return name of player with the most of any stat type from calling method. This calls the build_hash method to get the player_name as the key and the stat as the value
  # then convert the hash into array 
  arr = build_hash(type).to_a
  # use .max to compare the value at index 1, which is the stat value
  result = arr.max{|h,k| h[1] <=> k[1]}
  # return the name in index 0
  maxplayer = result[0]
  maxplayer
end

def most_points_scored
  # call most_stat to return most points player
  the_player = most_stat(:points)
  the_player
end

def winning_team 
 teams = []
  hash5 = game_hash
  hash5.each do |h_w, team|
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
  maxteam = resultx[0]
  maxteam
end

def player_with_longest_name
 names = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    i = 0 
    while i < team[:players].size do
      names << team[:players][i][:player_name]
      i += 1
    end
  end
  # use .max_by to find the max length of each array entry
  maxname = names.max_by {|a| a.length}
  maxname
end

def most_steals
  # call most_stat to return most steals player
  the_player = most_stat(:steals)
  the_player
end

def long_name_steals_a_ton?
  # call most_steals to find the name to compare to the name retrun by player_with_longest_name
  if most_steals = player_with_longest_name
    return true 
  else
    return false
  end 
end