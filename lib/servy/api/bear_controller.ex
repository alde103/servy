defmodule Servy.Api.BearController do
  def index(conv) do
   json = Servy.Wildthings.list_bears()
   |> Poison.encode!
   resp_content_type = %{modo: "application/json"}
   %{conv| status: 200, resp_body: json, resp_content_type: resp_content_type}
  end
end
