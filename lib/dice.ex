defmodule Dice do

    @moduledoc """
        This is the Dice module.
    """

    @doc """
        returns a list [1, 2, 3, 4, 5, 6]

    ## Examples
        iex()> Dice.create_dice
            [1, 2, 3, 4, 5, 6]
    """
    def create_dice do 
        [1, 2, 3, 4, 5, 6]
    end

    def roll_dice(dice) do
        [roll | _] = Enum.shuffle(dice)
        roll
    end

    def rolled_number do 
        create_dice |> roll_dice   
    end

    def number_of_rolls(number, old_list) when number == 0 do
        %{numbers: old_list, sum: Enum.sum(old_list)}
    end

    def number_of_rolls(number, old_list) do
        number_of_rolls(number - 1, multiple_rolls(old_list))
    end

    def number_of_rolls(number) do 
        number_of_rolls(number - 1, [rolled_number])
    end

    def multiple_rolls(old_list) do
        List.flatten([rolled_number | old_list])
    end

end