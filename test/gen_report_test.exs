defmodule GenReportTest do
  use ExUnit.Case

  alias GenReport
  alias GenReport.Support.ReportFixture

  @filename "gen_report.csv"
  @filenames ["gen_report_1.csv", "gen_report_2.csv"]

  describe "build/1" do
    test "When passing filename return a report" do
      response = GenReport.build(@filename)

      assert response == ReportFixture.build()
    end

    test "When no filename was given, returns an error" do
      response = GenReport.build()

      assert response == {:error, "Enter a filename"}
    end
  end

  describe "build_from_many/1" do
    test "When passing list of filenames return a reports" do
      response = GenReport.build_from_many(@filenames)

      assert response == ReportFixture.build_from_many()
    end

    test "When no list of filenames was given, returns an error" do
      response = GenReport.build_from_many()

      assert response == {:error, "Enter a list of files"}
    end

    test "When passing filename was given, returns an error" do
      response = GenReport.build_from_many(@filename)

      assert response == {:error, "Please provide a list of strings"}
    end
  end
end
