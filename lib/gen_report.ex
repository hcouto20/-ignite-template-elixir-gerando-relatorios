defmodule GenReport do
  alias GenReport.Parser

  @available_users [
    :Daniele,
    :Mayk,
    :Giuliano,
    :Cleiton,
    :Jakeliny,
    :Joseph,
    :Diego,
    :Danilo,
    :Rafael,
    :Vinicius
  ]
  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([name, hour, _day, _month, _year], %{all_hours: all_hours, hours_per_month: hours_per_month}) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hour)

    %{all_hours: all_hours, hours_per_month: hours_per_month}
  end

  def report_acc do
    all_hours = Enum.into(@available_users, %{}, &{(&1), 0})

    hours_per_month = Enum.into(1..12, %{}, &{Integer.to_string(&1), 0})

    hours_per_year = Enum.into(2016..2020, %{}, &{Integer.to_string(&1), 0})

    %{all_hours: all_hours, hours_per_month: hours_per_month, hours_per_year: hours_per_year}
  end
end
