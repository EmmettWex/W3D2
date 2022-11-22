class Card

    attr_reader :facing, :face_value, :face_down, :face_up

    def initialize(face_value, face_up, face_down)
        @face_up = face_up
        @face_down = face_down
        @facing = face_up
        @face_value = face_value
    end

    def hide
        @facing = @face_down
    end

    def reveal
        @facing = @face_up
    end

    def display
        if @facing
            return @face_value.to_s
        else
            return ""
        end
    end
end

