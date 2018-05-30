defmodule ServyTest do
  use ExUnit.Case
  doctest Servy

  # test "greets the world" do
  #   assert Servy.hello() == :world
  # end

  # test "Prueba1" do
  #   request = """
  #   GET /wildthings HTTP/1.1
  #   Host: example.com
  #   User-Agent: ExampleBrowser/1.0
  #   Accept: */*

  #   """
  #   assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 20\n\nBears, Lions, Tigers\n"
  # end

  # test "Prueba2" do
  #   request = """
  #   GET /bears HTTP/1.1
  #   Host: example.com
  #   User-Agent: ExampleBrowser/1.0
  #   Accept: */*

  #   """
  #   assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 338\n\n<h1>All The Bears!</h1>\n<ul>\n    \n    <li>Brutus - Grizzly</li> \n    <li>Iceman - Polar</li> \n    <li>Kenai - Grizzly</li> \n    <li>Paddington - Brown</li> \n    <li>Roscoe - Panda</li> \n    <li>Rosie - Black</li> \n    <li>Scarface - Grizzly</li> \n    <li>Smokey - Black</li> \n    <li>Snow - Polar</li> \n    <li>Teddy - Brown</li> \n</ul>\n\n\n"
  # end

  # test "Prueba3" do
  #   request = """
  #   GET /bigfoot HTTP/1.1
  #   Host: example.com
  #   User-Agent: ExampleBrowser/1.0
  #   Accept: */*

  #   """
  #   assert Servy.Handler.handle(request) == "HTTP/1.1 404 Not Found\nContent-Type: text/html\nContent-Length: 17\n\nNo /bigfoot here!\n"
  # end

  # test "Prueba4" do
  #   request = """
  #   GET /bears/1 HTTP/1.1
  #   Host: example.com
  #   User-Agent: ExampleBrowser/1.0
  #   Accept: */*

  #   """
  #   assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 66\n\n<h1>Show Bear</h1>\n<p>\nIs  hibernating? <strong>true</strong>\n</p>\n"

  # end

  # test "Prueba5" do
  #   request = """
  #   GET /wildlife HTTP/1.1
  #   Host: example.com
  #   User-Agent: ExampleBrowser/1.0
  #   Accept: */*

  #   """
  #   assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 20\n\nBears, Lions, Tigers\n"
  # end

  # test "Prueba6" do
  #   request = """
  #   GET /about HTTP/1.1
  #   Host: example.com
  #   User-Agent: ExampleBrowser/1.0
  #   Accept: */*

  #   """
  #   assert Servy.Handler.handle(request) == "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 18\n\n\"abriendo un .txt\"\n"
  # end

  # test "Prueba7" do
  #   request = """
  #   POST /bears HTTP/1.1
  #   Host: example.com
  #   User-Agent: ExampleBrowser/1.0
  #   Accept: */*
  #   Content-Type: application/x-www-form-urrlencoded
  #   Content-Length: 21

  #   name=Baloo&type=Brown
  #   """
  #   assert Servy.Handler.handle(request) == "HTTP/1.1 201 Created\nContent-Type: text/html\nContent-Length: 31\n\nCreate a Brown bear named Baloo\n"
  # end

  # test "Prueba8" do
  #   request = """
  #   POST /bears HTTP/1.1
  #   Host: example.com
  #   User-Agent: ExampleBrowser/1.0
  #   Accept: */*
  #   Content-Type: multipart/form-data
  #   Content-Length: 21

  #   name=Baloo&type=Brown
  #   """
  #   assert Servy.Handler.handle(request) == "HTTP/1.1 201 Created\nContent-Type: text/html\nContent-Length: 41\n\nCreate a bear with no name has been added\n"
  # end

end
