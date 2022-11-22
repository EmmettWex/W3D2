require_relative "board.rb"
require_relative "card.rb"

class Game
    
    def initialize(n)
        @board = Board.new(n)
        @prev_guess = []
    end

    def play
        @board.populate
        puts `clear`
        @board.render

        p 'ready to begin? yes/no'
        answer = gets.chomp

        while answer != "yes"
            p 'please type yes'
            answer = gets.chomp
        end

        @board.hide_all
        puts `clear`
        @board.render

        until @board.won?
            valid_pos = false
            while valid_pos == false
                p 'please guess a spot on the board'
                pos = gets.chomp.split(" ").map { |ele| ele.to_i }
                valid_pos = true if @board[pos].facing? == false
            end

            if @prev_guess.length == 0
                @prev_guess = pos
                @board.reveal(pos)
                #render here
            else
                @board.reveal(pos)
                puts `clear`
                @board.render
                sleep 4
                #render here and disapear shortly after
                if @board[pos].face_value != @board[@prev_guess].face_value
                    @board.hide(pos)
                    @board.hide(@prev_guess)
                end
                @prev_guess = []
            end

            puts `clear`
            @board.render
        end
    end

end