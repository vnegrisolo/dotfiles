IO.puts IO.ANSI.green() <> "IEX => Elixir's interactive shell\nREADY..." <> IO.ANSI.reset
Application.put_env(:elixir, :ansi_enabled, true)
IEx.configure(
 colors: [
   eval_result: [:green, :bright] ,
   eval_error:  [[:red,:bright,"ERROR"]],
   eval_info:   [:yellow, :bright ],
 ]
)
