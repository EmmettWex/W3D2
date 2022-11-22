class ComputerPlayer

    def initialize
        @known_cards = Hash.new {[]}
        @matched_cards = Hash.new 
    end

    def start
        p "01001001 01001101 00100000 01010010 01000101 01000001 01000100 01011001"
    end

    def receive_revealed_card(pos, value)
        @known_cards[value] << pos 
    end 

    def receive_match
        @known_cards.each() do |k, v|
            @matched_cards[k] = v if v.length == 2
        end
    end

    def check_matched(board)
        @matched_cards.each() do |k,v|
            if board[v[0]].facing? == true && board[v[1]].facing? == true
                @matched_cards.delete(k)
            end
        end
    end

    def get_pos(board)
        if board.count.even?
            check_matched(board)
            if @matched_cards.length() > 0
                @matched.each do |k,v|
                    pos = v[0]
                end
            else
                valid = false
                while !valid
                    row = rand(0...board.length)
                    col = rand(0...board.length)
                    if board[row][col].facing? == true
                        valid = false
                    else
                        pos = [row,col]
                        receive_revealed_card(pos, board[pos].face_value)
                        receive_match
                        valid = true
                    end
                end
            end
        end
        if board.count.odd?
            if @matched_cards.length() > 0
                @matched.each do |k,v|
                    pos = v[1]
                end
            elsif 
                receive_match

                
            end
        end
    end






    def get_pos(board)
        if first turn 
            if matched pair
                guess matched[0]
            else
                guess randomly
            end
        end
        if second turn
            if matched pair
                guess matched[1]
            elsif random first guess value == known value_key?
                guess known_value[key]
            else
                guess random
            end
        end
    end

end


