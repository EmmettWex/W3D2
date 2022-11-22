require_relative "card.rb"

class Board

    def initialize(n)
        @size = n * n
        @grid = Array.new(n) {Array.new(n)}

    end

    def populate
        arr = []
        while arr.length < @size/2
            num = rand(1..@size)
            arr << num if !arr.include?(num)
        end
        cards = []
        2.times do
            count = 0
            full = false
            while !full
                row = rand(0...@grid.length)
                col = rand(0...@grid.length)
                if @grid[row][col] == nil
                    @grid[row][col] = Card.new(arr[count])
                    count += 1
                end
                full = true if count == arr.length
                #cards << Card.new(value)
            end
        end
    end

end