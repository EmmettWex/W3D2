class Card

    attr_reader :face_value

    def initialize(face_value)
        @facing = true
        @face_value = face_value
    end

    def facing?
        @facing
    end

    def hide
        @facing = false
    end

    def reveal
        @facing = true
    end

    def display
        if @facing
            return @face_value.to_s
        else
            return " "
        end
    end
end

