class TicTacToe
	attr_accessor :squares
	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
		@players = [@player1, @player2]
		@player_turn = 0
		@player_selected = @players[0]
		@game_over = false
		
		@squares = {
			a: "A", 
			b: "B",
			c: "C",
			d: "D",
			e: "E",
			f: "F",
			g: "G",
			h: "H",
			i: "I",
		}
		display_board
	end
	
	def display_board
		puts ""
		puts (@squares[:a] + " | " + @squares[:b] + " | " + @squares[:c]).center 60
		puts ("__________").center 60
		puts ""
		puts (@squares[:d] + " | " + @squares[:e] + " | " + @squares[:f]).center 60
		puts ("__________").center 60
		puts ""
		puts (@squares[:g] + " | " + @squares[:h] + " | " + @squares[:i]).center 60
		puts ""
	end
	
	def space_selected(piece, square)
		@squares[square] = piece
		display_board
	end
	
	def select_space(player)
		puts "#{player.name.upcase}: What space would you like to select?"
		answer = gets.chomp.upcase
		while !( (@squares.has_value?(answer)) || answer == "X" || answer == "O")
			puts "That selection is invalid. Please choose again"
			answer = gets.chomp.upcase
		end
		answer_as_symbol = answer.downcase.to_sym
		space_selected(player.piece, answer_as_symbol)
	end
	
	def play_game
		until @game_over
			select_space(@player_selected)
			game_ended?
			@player_turn = (@player_turn+1)%2
			@player_selected = @players[@player_turn]
		end
		puts "ENND"
	end
	def game_ended?
		winning_arrays = [ 	#horizontals
							[ @squares[:a], @squares[:b], @squares[:c] ], [ @squares[:d], @squares[:e], @squares[:f] ], 
							[ @squares[:g], @squares[:h], @squares[:i] ],	
							#verticals
							[ @squares[:a], @squares[:d], @squares[:g] ], [ @squares[:b], @squares[:e], @squares[:h] ],
							[ @squares[:c], @squares[:f], @squares[:i] ],
							#diagonals 
							[ @squares[:a], @squares[:e], @squares[:i] ], [ @squares[:c], @squares[:e], @squares[:g] ]
						]
		
	end
	
end

class Player
	attr_accessor :name, :piece
	def initialize(name, piece)
		@name = name
		@piece = piece
	end	
end


john = Player.new("James", "X")
rachel = Player.new("Heather", "O")
new_game = TicTacToe.new(john, rachel)
new_game.play_game


