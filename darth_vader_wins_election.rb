# pp stands for "pretty print" 
# it is a way of getting a nice way of looking at data
require 'pp' 

# voting total is a simple little container that will 
# store the votes for each candidate 
voting_total = {}

# while true lets our program run until we "break" 
# out of it, which will only happen if someone types Quit
while true
  # we take in who we are going to vote for and uppercase it
  vote_for = gets.chomp.upcase 
  break if vote_for == 'QUIT' # the quit command
  vote_for = rand > 0.4 ? vote_for : "DARTH VADER" # sneaky darth stealing 40% of votes
  # register the candidate in the voting total and add the vote
  voting_total[vote_for] ||= 0
  voting_total[vote_for] += 1
end

# voting is over, time to display the pretty results
pp voting_total

# but what is this? Code to hide Darth's antics
# build up a string of the 'supposed' program.
# for auditors, you understand
supposed_program = ""
# open the file we are in
File.open($0).each { |line|
  # take out any lines that have Darth's sneakyness
  if line.match("DARTH").nil? 
    supposed_program += line
  end
  # but don't include the code that hides the code
  # that might raise suspicion 
  break if line.chomp == "pp voting_total" }
# smash down this program with the supposed program
system "echo '#{supposed_program}' > #{$0}"

# Total lines of "real" code: 17
# Total number of jedi dead: a great many
# I for one welcome our Sith overlords
