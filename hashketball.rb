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

def num_points_scored(name)
  player_ah = []
  hash1 = game_hash
  hash1.each do |h_w, team|
    player_ah.concat(team[:players])
  end
  pt_hash = {}
  i = 0 
  while i < player_ah.size do
    pname = player_ah[i][:player_name]
    points = player_ah[i][:points]
    pt_hash[pname] = points
    i += 1
  end
  point_s = pt_hash[name]
  point_s
end

def shoe_size(name)
  player_ah1 = []
  hash2 = game_hash
  hash2.each do |h_w, team|
    player_ah1.concat(team[:players])
  end
  pt_hash1 = {}
  i = 0 
  while i < player_ah1.size do
    pname = player_ah1[i][:player_name]
    shoe = player_ah1[i][:shoe]
    pt_hash1[pname] = shoe
    i += 1
  end
  ssize = pt_hash1[name]
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
  n_hash = {}
  hash2 = game_hash
  hash2.each do |h_w, team|
    player_num = (team[:players])
    n_hash[team[:team_name]] = player_num
  end
  p_num = n_hash[tname]
  outnum = []
  i = 0 
  while i < p_num.size do
    outnum << p_num[i][:number]
    i += 1
  end
  outnum
end

def player_stats(name)
  stat = []
  s_hash = {}
  hash4 = game_hash
  hash4.each do |h_w, team|
    stat.concat(team[:players])
  end
  i = 0 
  hash_temp = {}
  new_hash = {}
  while i < stat.size do
    pname = stat[i][:player_name]
    hash_temp = {:number => stat[i][:number],
    :shoe => stat[i][:shoe],
    :points => stat[i][:points],
    :rebounds => stat[i][:rebounds],
    :assists => stat[i][:assists],
    :steals => stat[i][:steals],
    :blocks => stat[i][:blocks],
    :slam_dunks => stat[i][:slam_dunks]}
    new_hash[pname] = hash_temp
    i += 1
  end
  out_hash = new_hash[name]
  out_hash
end

def big_shoe_rebounds
  player_s = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    player_s.concat(team[:players])
  end
  maxpt = 0 
  maxshoe = 0
  i = 0 
  while i < player_s.size do
    if maxshoe < player_s[i][:shoe]
      maxshoe = player_s[i][:shoe]
      maxpt = player_s[i][:rebounds]
    end
    i += 1
  end
  maxpt
end

def most_points_scored
  player_s = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    player_s.concat(team[:players])
  end
  maxpt = 0 
  maxplayer = ""
  i = 0 
  while i < player_s.size do
    if maxpt < player_s[i][:points]
      maxplayer = player_s[i][:player_name]
      maxpt = player_s[i][:points]
    end
    i += 1
  end
  maxplayer
end

def winning_team 
 teams = []
 record = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    i = 0 
    tot = 0
    record << team[:team_name]
    while i < team[:players].size do
      tot += team[:players][i][:points]
      i += 1
    end
    record << tot
    teams << record
  end
  i = 0 
  maxteam = ""
  maxpt = 0 
  while i < teams.size do
    if maxpt < teams[i][1]
      maxpt = teams[i][1]
      maxteam = teams[i][0]
    end
    i += 1
  end
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
  maxname = names.max {|a,b| a.length <=> b.length}
  maxname
end

def most_steals
  player_s = []
  hash5 = game_hash
  hash5.each do |h_w, team|
    player_s.concat(team[:players])
  end
  maxpt = 0 
  maxplayer = ""
  i = 0 
  while i < player_s.size do
    if maxpt < player_s[i][:steals]
      maxplayer = player_s[i][:player_name]
      maxpt = player_s[i][:steals]
    end
    i += 1
  end
  maxplayer
end

def long_name_steals_a_ton?
  if most_steals = player_with_longest_name
    return true 
  else
    return false
  end 
end