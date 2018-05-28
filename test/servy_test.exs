defmodule ServyTest do
  use ExUnit.Case
  doctest Servy

  test "greets the world" do
    assert Servy.hello() == :world
  end

  test "Prueba1" do
    request = """
    GET /wildthings HTTP/1.1
    Host: example.com
    User-Agent: ExampleBrowser/1.0
    Accept: */*

    """
    assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 20\n\nBears, Lions, Tigers\n"
  end

  test "Prueba2" do
    request = """
    GET /bears HTTP/1.1
    Host: example.com
    User-Agent: ExampleBrowser/1.0
    Accept: */*

    """
    assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 85\n\n<ul><li>Brutus - Grizzly</li><li>Kenai - Grizzly</li><li>Scarface - Grizzly</li></ul>\n"
  end

  test "Prueba3" do
    request = """
    GET /bigfoot HTTP/1.1
    Host: example.com
    User-Agent: ExampleBrowser/1.0
    Accept: */*

    """
    assert Servy.Handler.handle(request) == "HTTP/1.1 404 Not Found\nContent-Type: text/html\nContent-Length: 17\n\nNo /bigfoot here!\n"
  end

  test "Prueba4" do
    request = """
    GET /bears/1 HTTP/1.1
    Host: example.com
    User-Agent: ExampleBrowser/1.0
    Accept: */*

    """
    assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 23\n\n<h1>Bear 1: Teddy </h1>\n"
  end

  test "Prueba5" do
    request = """
    GET /wildlife HTTP/1.1
    Host: example.com
    User-Agent: ExampleBrowser/1.0
    Accept: */*

    """
    assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 20\n\nBears, Lions, Tigers\n"
  end

  test "Prueba6" do
    request = """
    GET /about HTTP/1.1
    Host: example.com
    User-Agent: ExampleBrowser/1.0
    Accept: */*

    """
    assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 18\n\n\"abriendo un .txt\"\n"
  end

  test "Prueba7" do
    request = """
    POST /bears HTTP/1.1
    Host: example.com
    User-Agent: ExampleBrowser/1.0
    Accept: */*
    Content-Type: application/x-www-form-urrlencoded
    Content-Length: 21

    name=Baloo&type=Brown
    """
    assert Servy.Handler.handle(request) == "HTTP/1.1 201 Created\nContent-Type: text/html\nContent-Length: 31\n\nCreate a Brown bear named Baloo\n"
  end

  test "Prueba8" do
    request = """
    POST /bears HTTP/1.1
    Host: example.com
    User-Agent: ExampleBrowser/1.0
    Accept: */*
    Content-Type: multipart/form-data
    Content-Length: 21

    name=Baloo&type=Brown
    """
    assert Servy.Handler.handle(request) == "HTTP/1.1 201 Created\nContent-Type: text/html\nContent-Length: 41\n\nCreate a bear with no name has been added\n"
  end

end
