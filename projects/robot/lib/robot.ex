defmodule Robot do

  def start_link(), do: { :ok, spawn(Robot, :loop, []) }

  def talk(robot_pid, new_pid),
    do: Process.send(robot_pid, { :talk, new_pid }, [])

  def walk(robot_pid, location),
    do: Process.send(robot_pid, { :walk, location }, [])

  # private

  def loop(), do: loop("Melbourne")
  def loop(location) do
    receive do
      event -> loop(handle_event(event, location))
    end
  end

  def handle_event({ :talk, pid }, location) do
    Process.send(pid, { :location, "In #{location}" }, [])
    location
  end
  def handle_event({ :walk, location }, _location), do: location
  def handle_event(_event, location), do: location

end
