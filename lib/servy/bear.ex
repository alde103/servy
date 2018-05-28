defmodule Servy.Bear do
  defstruct [
    id: nil,
    name: "",
    type: "",
    hibernating: false
  ]

  def is_grissly?(bear) do
    bear.type == "Grizzly"
  end

  def order_asc_by_name(x1,x2) do
    x1.name <= x2.name
  end
end
