defmodule Box do
  @moduledoc """
  Implementation to retrieve Box ID based on coordinates enter by user
  simulate db storage wit @items
  """


  @items %{{1,1} => 1, {2,1} => 3, {3,1} => 6, {4,1} => 10, {5,1} => 15,
          {1,2} => 2, {2,2} => 5, {3,2} => 9, {4,2} => 14,
          {1,3} => 4, {2,3} => 8, {3,3} => 13,
          {1,4} => 7, {2,4} => 12,
          {1,5} => 11, {2,5} => 20000000001}

  @doc """
  Starts the app
  """
  def startApp do
    IO.puts "Welcome to divvy box retrieval system"
    coor = getCoordinates()
    boxId = getId(coor)
    if boxId do
      IO.puts "The ID for that box: " <> Integer.to_string(boxId)
    else
      IO.puts "No box stored in those coordinates"
    end
  end

  @doc """
  get's the id of box based on coordinates given by user
  """
  def getId(coord) do

    index = {List.first(coord), List.last(coord)}
    # Integer.to_string(@items[index])
    @items[index]
  end

  @doc """
  Promt the user for coordinates, get rid of unncessary whitespacing, parse to get coordinates
  get integer values from strings
  """
  def getCoordinates do
    coord = IO.gets("Enter (x, y) coordinate in the format \"x y\"\n")
    |> String.trim() |> String.split()
    |> Enum.filter(fn (x) -> isValidCoor(x) end)
    |> Enum.map(fn(x) -> String.to_integer(x) end)
    case coord do
      [x, y] when x > 0 and x < 100000 and y > 0 and y < 100000 ->
        coord
        _ -> getCoordinates()
      end

  end

  @doc """
  Calculates the sum of two numbers.
  """
  def isValidCoor(str) do
    case Integer.parse(str) do
      {_num, ""} -> true
      _         -> false
    end
  end

end
