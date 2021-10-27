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
    |> parse_date()
  end

  defp parse_date(line) do
    [name, hours, day, month, year] = line

    date =
      [year, month, day]
      |> Enum.join("-")
      |> Datex.Date.add(0, :elixir)

    line = [name, hours, date]

    {:ok, line}
  end
end
