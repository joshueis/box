defmodule BoxTest do
  use ExUnit.Case
  doctest Box

  test "verify getId function" do
    assert Box.getId([2, 2]) == 5
    assert Box.getId([2, 4]) == 12
    assert Box.getId([4, 1]) == 10
    assert Box.getId([4, 2]) == 14
    # for unexistent coord return nil
    assert Box.getId([333, 222]) == nil
  end

  test "isValidCoor" do
    assert Box.isValidCoor("hello") == false
    assert Box.isValidCoor("4") == true
    assert Box.isValidCoor("4.234") == false
  end

  # # If enabled user must enter coordinates when testing
  # test "getCoordinates" do
  #   # for this case enter "1 1"
  #   assert Box.getCoordinates() == [1, 1]
  #   if two numbers separated by space are not provided
  #   user would be promt again until successful
  #   assert Box.getCoordinates() == []
  # end

end
