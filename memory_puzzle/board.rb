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
            end
        end
        true
    end

    def render
        @grid.each do |sub|
            row = []
            sub.each { |card| row << card.display }
            p row
        end
        true
    end

    def won?
        @grid.each do |sub|
            sub.each { |card| return false if card.facing? != true }
        end

        true
    end

    def reveal(pos)
        card = @grid[pos[0]][pos[1]]
        if card.facing? == false
            card.reveal
        end
        true
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def hide(pos)
        card = @grid[pos[0]][pos[1]]
        if card.facing? == true
            card.hide
        end
        true
    end

    def hide_all
        @grid.each do |sub|
            sub.each { |card| card.hide }
        end
        true
    end
end