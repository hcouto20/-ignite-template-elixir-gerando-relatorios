defmodule GenReport.Parser do

  alias Date
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(&parse_line(&1))

  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, &String.to_integer/1)
    |> List.update_at(4, &String.to_integer/1)
    |> parse_date()
  end

  defp parse_date(line) do
    [name, hours, day, month, year] = line

    {_key, date} =
      {year, month, day}
      |> Date.from_erl()

   [name, hours, date]
  end
end
