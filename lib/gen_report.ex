defmodule GenReport do

  alias GenReport.Parser
  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.map(fn line -> sum_values(line) end)
    |> fetch_higher_cost()
  end

  def fetch_higher_cost(map) do
    {:ok, Enum.min_max_by(map, fn line -> line.hours end)}
  end

  def sum_values([name, hours, date]) do
    users = %{name: name, hours: hours, date: date}

    users
  end

end
