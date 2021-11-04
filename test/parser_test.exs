defmodule GenReport.ParserTest do
  use ExUnit.Case

  alias GenReport.Parser

  describe "parse_file/1" do
    test "parses the file" do
      filename = "gen_report.csv"

      response =
        filename
        |> Parser.parse_file()
        |> Enum.map(& (&1))
        |> Enum.member?([:Daniele, 7, "29", :abril, "2018"])

      assert response == true
    end
  end
end
