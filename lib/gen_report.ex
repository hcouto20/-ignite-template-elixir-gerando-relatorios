defmodule GenReport do
  alias GenReport.Parser

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def build_from_many(filenames) when not is_list(filenames) do
    {:error, "Please provide a list of strings"}
  end

  def build_from_many(filenames) do
    result =
      filenames
      |> Task.async_stream(&build/1)
      |> Enum.reduce(report_acc(), fn {:ok, result}, report -> sum_reports(result, report) end)

    {:ok, result}
  end

  defp sum_values([name, hour, _day, month, year], %{
         all_hours: all_hours,
         hours_per_month: hours_per_month,
         hours_per_year: hours_per_year
       }) do
    all_hours = merge_maps(all_hours, %{name => hour})

    hours_per_month = merge_sub(hours_per_month, %{name => %{month => hour}})

    hours_per_year = merge_sub(hours_per_year, %{name => %{year => hour}})

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp merge_sub(map1, map2) do
    Map.merge(map1, map2, fn _k, value1, value2 ->
      merge_maps(value1, value2)
    end)
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _k, value1, value2 -> value1 + value2 end)
  end

  defp sum_reports(
         %{
           :all_hours => all_hours1,
           :hours_per_month => hours_per_month1,
           :hours_per_year => hours_per_year1
         },
         %{
           :all_hours => all_hours2,
           :hours_per_month => hours_per_month2,
           :hours_per_year => hours_per_year2
         }
       ) do
    all_hours = merge_maps(all_hours1, all_hours2)

    hours_per_month = merge_sub(hours_per_month1, hours_per_month2)

    hours_per_year = merge_sub(hours_per_year1, hours_per_year2)

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp report_acc() do
    build_report(%{}, %{}, %{})
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      :all_hours => all_hours,
      :hours_per_month => hours_per_month,
      :hours_per_year => hours_per_year
    }
  end
end
