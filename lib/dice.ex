defmodule Dice do

    @moduledoc """
        This is the Dice module.
    """

    @doc """
    Returns a list that has the value of each side of a six-sided die.

    ## Examples
        iex> Dice.create_dice
        [1, 2, 3, 4, 5, 6]
    """
    def create_dice do 
        [1, 2, 3, 4, 5, 6]
    end

    @doc """
    Takes the first number of a list.
    """
    def roll_dice(dice) do
        [roll | _] = Enum.shuffle(dice)
        roll
    end

    @doc """
    Combines `create_dice` and `roll_dice` to get the value of the 'roll.'
    """
    def rolled_number do 
        create_dice |> roll_dice   
    end

    @doc """
    Takes in the number of times you want to roll the dice and outputs a list with the values for each die roll and the sum of the rolls.
    """
    def number_of_rolls(number, old_list) when number == 0 do
        %{numbers: old_list, sum: Enum.sum(old_list)}
    end

    def number_of_rolls(number, old_list) do
        number_of_rolls(number - 1, multiple_rolls(old_list))
    end

    @doc """
    Takes in the number of times you want to roll the dice and creates a list with the value of the die roll.
    """
    def number_of_rolls(number) do 
        number_of_rolls(number - 1, [rolled_number])
    end

    @doc """
    Adds a new dice roll to the beginning of the list of dice rolls and flattens the array.
    """
    def multiple_rolls(old_list) do
        List.flatten([rolled_number | old_list])
    end

end