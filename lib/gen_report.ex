defmodule GenReport do

  alias GenReport.Parser
  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.map(fn line -> sum_values(line) end)
    |> fetch_higher_cost()
  end

  def fetch_higher_cost(map) do
    map
    |> Enum.min_max_by(fn line -> line.hours end)
  end

  def sum_values({:ok, line}) do
   line
  end

  def sum_values({:error, _reason}), do: {:error, "Invalid date"}
end
