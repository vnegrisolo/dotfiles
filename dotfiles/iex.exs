IO.puts IO.ANSI.red_background() <> IO.ANSI.white() <> " #### IEX => Elixir's interactive shell ##### " <> IO.ANSI.reset
Application.put_env(:elixir, :ansi_enabled, true)
IEx.configure(
 colors: [
   eval_result: [:green, :bright] ,
   eval_error:  [[:red,:bright,"ERROR"]],
   eval_info:   [:yellow, :bright ],
 ]
)
