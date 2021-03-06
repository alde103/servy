defmodule Servy.Parse do
  alias Servy.Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\r\n\r\n")

    [req| header] = String.split(top, "\r\n")

    [method, path, _] = String.split(req, " ")

    headers = parse_headers(header, %{})

    params = parse_params(headers["Content-Type"], params_string)

    %Conv{
       method: method,
       path: path,
       params: params,
       headers: headers
     }
  end



  def parse_headers([header_a| header_r], map) do
    [key, value] = String.split(header_a, ": ")
    # map = Map.put(map, String.to_atom(key), value)      #el atom no acepta valores de "-" etc
    map = Map.put(map, key, value)
    parse_headers(header_r, map)
  end

  def parse_headers([ ], map), do: map

  @doc """
  Parses the given param string of the form 'key1=value1&key2=value2' into a map with corresponding keys and values.
    #Example
    iex> params_string = "name=Baloo&type=Brown"
    iex> Servy.Parse.parse_params("application/x-www-form-urlencoded", params_string)
    %{"name" => "Baloo", "type" => "Brown"}
    iex> Servy.Parse.parse_params("application/x-www-form-urlencode", params_string)
    %{}
  """


  def parse_params("application/x-www-form-urlencoded", params_string) do
    params_string |> String.trim |> URI.decode_query
  end

  def parse_params(_,_), do: %{}
end

