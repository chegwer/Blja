def calculator(cards)
	set = cards.map {|x| x[1]}
	sum = 0
	set.each do |y|
		if y == 'ace'
			sum += 11
		elsif y.to_i == 0
			sum += 10
		else
			sum += y.to_i
		end
	end
	set.select {|z| z == 'ace'}.count.times do
		sum -= 10 if sum > 21
	end
	sum
end


puts "Welcome to Blackjack!"
puts "What's your name?"
nombre = gets.chomp
puts "Let's play, #{nombre}."

suit = ["diamonds", 'clubs', 'hearts', 'spades']
value = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace']



deck = suit.product(value)
deck.shuffle!

player = []
dealer = []

player << deck.pop
dealer << deck.pop
player << deck.pop
dealer << deck.pop

p = calculator(player)
d = calculator(dealer)



puts "#{nombre} hand is #{player[0]} and #{player[1]}. Sum = #{p}."
if p > 21
	puts "Bust."
end

while p < 21 do
	puts "Hit or stand."
	choice = gets.chomp
	if choice.downcase == 'stand'
		break
	else puts "Hit."
		player << deck.pop
		p = calculator(player)
		puts "sum = #{p}"
	end
	puts "stand"
end

puts "Dealer's Turn."
puts "Dealer hand is #{dealer[0]} and #{dealer[1]}. Sum = #{d}."
while d < 17 do
	dealer << deck.pop
	d = calculator(dealer)
	puts "Sum = #{d}"
end

puts "#{nombre} = #{p}. Dealer = #{d}."
if p > d
	puts "#{nombre} wins!"
else
	puts "Dealer wins."
end

puts "end."

