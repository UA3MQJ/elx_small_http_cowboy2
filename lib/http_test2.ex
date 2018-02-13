defmodule HttpTest2 do
  # @compile :native
  # @compile {:hipe, [:verbose, :o3]}

  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    dispatch = :cowboy_router.compile([
      {:_,
       [
         {"/test", DynamicTestHandler, []}
       ]}
    ])

    {:ok, _} = :cowboy.start_clear(
      :my_http_listener,
      [{:port, 4000}],
      %{:env => %{:dispatch => dispatch}}
    )

  end

end
