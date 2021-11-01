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

  @available_month [
    :janeiro,
    :fevereiro,
    :março,
    :abril,
    :maio,
    :junho,
    :julho,
    :agosto,
    :setembro,
    :outubro,
    :novembro,
    :dezembro
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([name, hour, _day, month, year], %{all_hours: all_hours, hours_per_month: hours_per_month, hours_per_year: hours_per_year}) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hour)

    hours_per_month = Map.put(hours_per_month, month, %{name => %{month => hour}})

    hours_per_year = Map.put(hours_per_year, year, %{name => %{year => hour}})

    %{all_hours: all_hours, hours_per_month: hours_per_month, hours_per_year: hours_per_year}
  end

  defp report_acc() do
    all_hours = Enum.into(@available_users, %{}, &{(&1), 0})

    hours_per_month = Enum.into(@available_month, %{}, &{(&1), 0})

    hours_per_year = Enum.into(2016..2020, %{}, &{Integer.to_string(&1), 0})

    %{all_hours: all_hours, hours_per_month: hours_per_month, hours_per_year: hours_per_year}
  end
end
