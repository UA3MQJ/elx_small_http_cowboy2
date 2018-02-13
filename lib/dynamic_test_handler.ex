
defmodule DynamicTestHandler do
 
  def init(req0, opts) do
    req = :cowboy_req.reply(
      200,
      %{"content-type" => "text/plain"},
      "Hello!", req0)

    {:ok, req, opts}
  end

end
