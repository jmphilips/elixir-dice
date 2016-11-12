defmodule Dice do

    def create_dice do 
        [1, 2, 3, 4, 5, 6]
    end

    def roll_dice(dice) do
        [roll | _] = Enum.shuffle(dice)
        roll
    end

    def rolled_number do 
        create_dice
        |> roll_dice
    end

     def number_of_rolls(number) when number > 0 do
        number + number_of_rolls(number - 1)
    end

    def number_of_rolls(number) do
        number 
    end

end