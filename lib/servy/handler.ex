defmodule Servy.Handler do
  import Servy.Plugins, only: [rewrite_path: 1, log: 1, track: 1]
  import Servy.Parse, only: [parse: 1]
  alias Servy.Conv
  @pages_path Path.expand("../../pages", __DIR__)

  def handle(request) do
    request
    |> parse
    |> rewrite_path
    |> log
    |> route
    |> track
    |> format_response
  end

  def route(%Conv{ method: "GET", path: "/wildthings" } = conv) do
    %{ conv | status: 200, resp_body: "Bears, Lions, Tigers" }
  end

  def route(%Conv{ method: "GET", path: "/bears" } = conv) do
    %{ conv | status: 200, resp_body: "Teddy, Smokey, Paddington" }
  end

  def route(%Conv{ method: "GET", path: "/bears/" <> id } = conv) do
    %{ conv | status: 200, resp_body: "Bear #{id}" }
  end

  def route(%Conv{method: "GET", path: "/about"} = conv) do
      @pages_path
      |> Path.join("about.txt")
      |> File.read
      |> handle_file(conv)
  end

  def route(%Conv{ method: "POST", path: "/bears"} = conv) do
    %{ conv | status: 201, resp_body: "Create a #{conv.params["type"]} bear named #{conv.params["name"]}" }
  end

  def route(%{ path: path } = conv) do
    %{ conv | status: 404, resp_body: "No #{path} here!"}
  end

  def handle_file({:ok, content}, conv) do
    %{ conv | status: 200, resp_body: content }
  end

  def handle_file({:error, :enoent}, conv) do
    %{ conv | status: 404, resp_body: "File not found!" }
  end

  def handle_file({:error, reason}, conv) do
    %{ conv | status: 500, resp_body: "File error: #{reason}" }
  end

  def format_response(%Conv{} = conv) do
    """
    HTTP/1.1 #{Conv.full_status(conv)}
    Content-Type: text/html
    Content-Length: #{String.length(conv.resp_body)}

    #{conv.resp_body}
    """
  end

end

