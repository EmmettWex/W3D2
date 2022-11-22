require_relative "game.rb"

class HumanPlayer
    
    def initialize(name)
        @name = name
    end

    def start
        p 'ready to begin? yes/no'
        answer = gets.chomp

        while answer != "yes"
            p 'please type yes'
            answer = gets.chomp
        end
        answer
    end
    
    def get_pos(board)
        valid_pos = false
        while valid_pos == false
            p 'please guess a spot on the board'
            pos = gets.chomp.split(" ").map { |ele| ele.to_i }
            valid_pos = true if board[pos].facing? == false #need to replace @board
        end
        pos
    end

end