require_relative "game.rb"

#sometimes guesses the same wrong guess a few times in a row for some reason, i dunno. it works!

class ComputerPlayer

    attr_reader :known_cards, :matched_cards

    def initialize
        @known_cards = Hash.new { |h,k| h[k] = [] }
        @matched_cards = Hash.new 
    end

    def start
        p "01001001 01001101 00100000 01010010 01000101 01000001 01000100 01011001"
    end

    def receive_revealed_card(pos, value)
        if @known_cards[value] != pos
            @known_cards[value] << pos
        end
    end 

    def receive_match?
        @known_cards.each() do |k, v|
            if v.length == 2
                @matched_cards[k] = v
                return true
            end
        end
        false
    end

    def check_matched(board)
        @matched_cards.each() do |k,v|
            if board[v[0]].facing? == true && board[v[1]].facing? == true
                @matched_cards.delete(k)
                @known_cards.delete(k)
            end
        end
    end

    def get_pos(board)

        if board.count.even?

            receive_match?
            check_matched(board)

            if @matched_cards.length() > 0
                @matched_cards.each do |k,v|
                    return v[0]
                end

            else

                valid = false

                while !valid

                    row = rand(0...board.grid.length)
                    col = rand(0...board.grid.length)
                    pos = [row,col]

                    if board[pos].facing? != true

                        receive_revealed_card(pos, board[pos].face_value)
                        receive_match?
                        return pos
                        valid = true

                    end
                end
            end
        end

        if board.count.odd?

            receive_match?
            check_matched(board)

            if @matched_cards.length() > 0

                @matched_cards.each do |k,v|
                    if board[v[0]].facing? == true
                        return v[1]
                    else
                        return v[0]
                    end

                end

            elsif receive_match?

                @matched_cards.each do |k,v|
                    if board[v[0]].facing? == true
                        return v[1]
                    else
                        return v[0]
                    end

                end

            else

                valid = false

                while !valid

                    row = rand(0...board.grid.length)
                    col = rand(0...board.grid.length)
                    pos = [row,col]

                    if board[pos].facing? != true

                        receive_revealed_card(pos, board[pos].face_value)
                        receive_match?
                        return pos
                        valid = true

                    end
                end
            end
        end
    end
end


