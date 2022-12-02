# setup
file_data = File.read('input.txt')
rounds = file_data.split("\n")

ROCK = "rock"
PAPER = "paper"
SCISSORS = "scissors"

WIN = "win"
LOSE = "lose"
DRAW = "draw"

code_hash = {
  'A' => ROCK, 'X' => ROCK,
  'B' => PAPER, 'Y' => PAPER,
  'C' => SCISSORS, 'Z' => SCISSORS
}

point_hash = {
  ROCK => 1,
  PAPER => 2,
  SCISSORS => 3
}

# your choice, opponents choice
OUTCOME_HASH = {
  "#{ROCK}-#{SCISSORS}" => 6,
  "#{ROCK}-#{PAPER}" => 0,
  "#{PAPER}-#{ROCK}" => 6,
  "#{PAPER}-#{SCISSORS}" => 0,
  "#{SCISSORS}-#{PAPER}" => 6,
  "#{SCISSORS}-#{ROCK}" => 0
}

def point_outcome(your_choice, opponent_choice)
  if your_choice === opponent_choice then return 3 end
  return OUTCOME_HASH["#{your_choice}-#{opponent_choice}"]
end

# part one
sum = 0
saved_choices = []
rounds.each do |round|
  choices = round.split(" ")
  opponent_choice = code_hash[choices[0]]
  your_choice = code_hash[choices[1]]
  saved_choices.push(choices)

  outcome = point_outcome(your_choice, opponent_choice)
  sum += outcome + point_hash[your_choice]
end

puts sum

# part two

CHOICE_HASH = {
  "#{ROCK}-#{WIN}" => PAPER,
  "#{PAPER}-#{WIN}" => SCISSORS,
  "#{SCISSORS}-#{WIN}" => ROCK,
  "#{ROCK}-#{LOSE}" => SCISSORS,
  "#{PAPER}-#{LOSE}" => ROCK,
  "#{SCISSORS}-#{LOSE}" => PAPER
}

desired_outcome_hash = {
  'X' => LOSE,
  'Y' => DRAW,
  'Z' => WIN
}

def determine_choice(opponent_choice, desired_outcome)
  if desired_outcome === DRAW then return opponent_choice end
  return CHOICE_HASH["#{opponent_choice}-#{desired_outcome}"]
end

sum = 0
saved_choices.each do |choices|
  opponent_choice = code_hash[choices[0]]
  desired_outcome = desired_outcome_hash[choices[1]]
  your_choice = determine_choice(opponent_choice, desired_outcome)

  outcome = point_outcome(your_choice, opponent_choice)
  sum += outcome + point_hash[your_choice]
end

puts sum