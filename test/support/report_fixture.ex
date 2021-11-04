defmodule GenReport.Support.ReportFixture do
  def build do
    %{
      all_hours: %{
        Cleiton: 13797,
        Daniele: 13264,
        Danilo: 13583,
        Diego: 13015,
        Giuliano: 13671,
        Jakeliny: 13909,
        Joseph: 13174,
        Mayk: 13526,
        Rafael: 13597,
        Vinicius: 13412
      },
      hours_per_month: %{
        Cleiton: %{
          abril: 1161,
          agosto: 1149,
          dezembro: 1100,
          fevereiro: 1168,
          janeiro: 1271,
          julho: 1236,
          junho: 1123,
          maio: 998,
          março: 1091,
          novembro: 1266,
          outubro: 1073,
          setembro: 1161
        },
        Daniele: %{
          abril: 1138,
          agosto: 1018,
          dezembro: 1019,
          fevereiro: 1003,
          janeiro: 1130,
          julho: 1135,
          junho: 1092,
          maio: 1170,
          março: 1177,
          novembro: 1131,
          outubro: 1046,
          setembro: 1205
        },
        Danilo: %{
          abril: 1232,
          agosto: 1200,
          dezembro: 1149,
          fevereiro: 1156,
          janeiro: 1121,
          julho: 1114,
          junho: 966,
          maio: 1075,
          março: 1096,
          novembro: 1122,
          outubro: 1237,
          setembro: 1115
        },
        Diego: %{
          abril: 1112,
          agosto: 1129,
          dezembro: 1177,
          fevereiro: 1144,
          janeiro: 1118,
          julho: 1099,
          junho: 1073,
          maio: 1082,
          março: 1029,
          novembro: 995,
          outubro: 928,
          setembro: 1129
        },
        Giuliano: %{
          abril: 1152,
          agosto: 1126,
          dezembro: 1100,
          fevereiro: 1173,
          janeiro: 1107,
          julho: 1169,
          junho: 1197,
          maio: 1182,
          março: 1097,
          novembro: 1105,
          outubro: 1123,
          setembro: 1140
        },
        Jakeliny: %{
          abril: 1172,
          agosto: 1098,
          dezembro: 1122,
          fevereiro: 1119,
          janeiro: 1118,
          julho: 1245,
          junho: 1182,
          maio: 1129,
          março: 1178,
          novembro: 1085,
          outubro: 1197,
          setembro: 1264
        },
        Joseph: %{
          abril: 1047,
          agosto: 1167,
          dezembro: 1122,
          fevereiro: 1202,
          janeiro: 1084,
          julho: 1153,
          junho: 1105,
          maio: 1082,
          março: 1038,
          novembro: 1005,
          outubro: 1058,
          setembro: 1111
        },
        Mayk: %{
          abril: 1016,
          agosto: 1079,
          dezembro: 1159,
          fevereiro: 1085,
          janeiro: 1100,
          julho: 1093,
          junho: 1190,
          maio: 1173,
          março: 1166,
          novembro: 1257,
          outubro: 1094,
          setembro: 1114
        },
        Rafael: %{
          abril: 1171,
          agosto: 1199,
          dezembro: 965,
          fevereiro: 1042,
          janeiro: 1125,
          julho: 1097,
          junho: 1218,
          maio: 1141,
          março: 1220,
          novembro: 1163,
          outubro: 1161,
          setembro: 1095
        },
        Vinicius: %{
          abril: 1149,
          agosto: 1055,
          dezembro: 1186,
          fevereiro: 1102,
          janeiro: 1036,
          julho: 979,
          junho: 1213,
          maio: 1109,
          março: 1191,
          novembro: 1169,
          outubro: 1113,
          setembro: 1110
        }
      },
      hours_per_year: %{
        Cleiton: %{"2016" => 2699, "2017" => 2684, "2018" => 2805, "2019" => 2714, "2020" => 2895},
        Daniele: %{"2016" => 2573, "2017" => 2862, "2018" => 2633, "2019" => 2562, "2020" => 2634},
        Danilo: %{"2016" => 2746, "2017" => 2534, "2018" => 2972, "2019" => 2666, "2020" => 2665},
        Diego: %{"2016" => 2577, "2017" => 2647, "2018" => 2792, "2019" => 2486, "2020" => 2513},
        Giuliano: %{
          "2016" => 2784,
          "2017" => 2696,
          "2018" => 2693,
          "2019" => 2850,
          "2020" => 2648
        },
        Jakeliny: %{
          "2016" => 2869,
          "2017" => 2625,
          "2018" => 2765,
          "2019" => 2709,
          "2020" => 2941
        },
        Joseph: %{"2016" => 2603, "2017" => 2617, "2018" => 2587, "2019" => 2672, "2020" => 2695},
        Mayk: %{"2016" => 2644, "2017" => 2735, "2018" => 2770, "2019" => 2778, "2020" => 2599},
        Rafael: %{"2016" => 2684, "2017" => 2570, "2018" => 2628, "2019" => 2786, "2020" => 2929},
        Vinicius: %{
          "2016" => 2530,
          "2017" => 2720,
          "2018" => 2654,
          "2019" => 2640,
          "2020" => 2868
        }
      }
    }
  end

  def build_from_many do
    {:ok,
     %{
       all_hours: %{
         Cleiton: 4,
         Daniele: 21,
         Danilo: 6,
         Diego: 7,
         Giuliano: 10,
         Jakeliny: 14,
         Joseph: 3,
         Mayk: 19
       },
       hours_per_month: %{
         Cleiton: %{junho: 4},
         Daniele: %{abril: 7, dezembro: 5, junho: 1, maio: 8},
         Danilo: %{fevereiro: 6},
         Diego: %{agosto: 4, setembro: 3},
         Giuliano: %{abril: 1, fevereiro: 9},
         Jakeliny: %{julho: 8, março: 6},
         Joseph: %{março: 3},
         Mayk: %{dezembro: 5, julho: 7, setembro: 7}
       },
       hours_per_year: %{
         Cleiton: %{"2016" => 3, "2020" => 1},
         Daniele: %{"2016" => 10, "2017" => 3, "2018" => 7, "2020" => 1},
         Danilo: %{"2019" => 6},
         Diego: %{"2016" => 3, "2017" => 4},
         Giuliano: %{"2017" => 3, "2019" => 6, "2020" => 1},
         Jakeliny: %{"2017" => 8, "2019" => 6},
         Joseph: %{"2017" => 3},
         Mayk: %{"2016" => 7, "2017" => 8, "2019" => 4}
       }
     }}
  end
end
