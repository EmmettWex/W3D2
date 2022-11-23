require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    
    attr_reader :board

    def initialize(n, name = "")
        @board = Board.new(n)
        @prev_guess = []
        if name == ""
            @player = ComputerPlayer.new
        else
            @player = HumanPlayer.new(name)
        end
    end

    # def start
    #     p 'ready to begin? yes/no'
    #     answer = gets.chomp

    #     while answer != "yes"
    #         p 'please type yes'
    #         answer = gets.chomp
    #     end

    #     @board.hide_all
    #     puts `clear`
    #     @board.render
    # end

    # def get_pos
    #     valid_pos = false
    #     while valid_pos == false
    #         p 'please guess a spot on the board'
    #         pos = gets.chomp.split(" ").map { |ele| ele.to_i }
    #         valid_pos = true if @board[pos].facing? == false
    #     end
    #     pos
    # end

    def reveal(pos)
        if @prev_guess.length == 0
            @prev_guess = pos
            @board.reveal(pos)
        else
            @board.reveal(pos)
            puts `clear`
            @board.render
            p "remember the board"
            sleep 2
            if @board[pos].face_value != @board[@prev_guess].face_value
                @board.hide(pos)
                @board.hide(@prev_guess)
            end
            @prev_guess = []
        end
    end

    def play
        @player.start
        sleep 4
        @board.populate
        puts `clear`
        @board.render

        @player.start
        @board.hide_all
        puts `clear`
        @board.render

        until @board.won?
            reveal(@player.get_pos(@board))
            puts `clear`
            @board.render
        end

        if @player.is_a?(ComputerPlayer)
            p '01011001 01101111 01110101 00100000 01010111 01101001 01101110 00100001'
        else
            p "WIN!"
        end
    end
end