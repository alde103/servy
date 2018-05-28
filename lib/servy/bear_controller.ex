defmodule Servy.BearController do
  alias Servy.Wildthings
  def index(conv) do
    bears= Wildthings.list_bears()

    %{ conv | status: 200, resp_body: "Teddy, Smokey, Paddington"}
  end

  def show(conv, %{"id" => id}) do
    %{ conv | status: 200, resp_body: "Bear #{id}" }
  end

  def create(conv, %{"name" => name, "type" => type} = _params) do
    %{ conv | status: 201, resp_body: "Create a #{type} bear named #{name}" }
  end

  def create(conv, %{}) do
    %{ conv | status: 201, resp_body: "Create a bear with no name has been added" }
  end

end
