


def load_random_word(path_to_file)
	contents = File.readlines(path_to_file)

	while(true) do
		random_word = contents[rand(contents.length)]
		random_word.strip!
		
		if random_word.length.between?(5,12)
			return random_word
		end
	end

end






path_to_file = "5desk.txt"

random_word = load_random_word(path_to_file)
random_word.downcase!
word = []
random_word.length.times do
	word.push("_")
end
puts random_word



misses = []

i = 1
while i < 9
	puts "********************************"
	puts "TRIES: #{i}/8 "
	puts word.join(" ").to_s
	puts "Guesses: #{misses.join(" ").to_s}"
	puts "GUESS!"
	guess = gets.chomp
	guess.downcase!

	if guess.length > 1
		puts "Guess again scrub"
		next
	end

	if random_word.include? guess
		random_word.length.times do |i|
			if random_word[i] == guess
				word[i] = guess
			end

		end
	else
		misses.push (guess)		
	end

	if !word.include?("_")
		puts "You win!"
		exit
	end

	i += 1
end
puts "You lose"
