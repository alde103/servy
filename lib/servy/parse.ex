defmodule Servy.Parse do
  alias Servy.Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\n\n")

    [req|_header] = String.split(top, "\n")

    [method, path, _] = String.split(req, " ")

    params = parse_params(params_string)

    %Conv{
       method: method,
       path: path,
       params: params
     }
  end

  def parse_params(params_string) do
    params_string |> String.trim |> URI.decode_query
  end
end

request = """
POST /bears HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept:*/*
Content-Type: application/x-www-form-urrlencoded
Content-Length: 21

name=Baloo&type=Brown
"""
