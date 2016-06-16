defmodule RobotTest do
  use ExUnit.Case
  doctest Robot

  test "a talking robot" do
    { :ok, pid } = Robot.start_link()

    Robot.talk(pid, self)
    assert_receive { :location, "In Melbourne" }

    Robot.talk(pid, self)
    assert_receive { :location, "In Melbourne" }
  end

  test "a walking, talking robot" do
    { :ok, pid } = Robot.start_link()

    Robot.walk(pid, "New York")
    Robot.walk(pid, "San Francisco")
    Robot.talk(pid, self)
    assert_receive { :location, "In San Francisco" }
  end
end
