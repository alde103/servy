defmodule Servy.PledgeServer do
  @name :pledge_server

  #Client
  def start do
    IO.puts("Starting the server")
    pid = spawn(__MODULE__, :listen_loop, [[]])
    Process.register(pid, @name)
    pid
  end

  def create_pledge(name,amount) do
    send(@name, {self(), :create_pledge, name, amount})
    receive do {:response, status} -> status end
  end

  def recent_pledge() do
   send(@name, {self(), :recent_pledges})
   receive do {:response, pledges} -> pledges end
  end

  def total_pledged do
    send(@name, {self(), :total_pledged})
    receive do {:response, total} -> total end
  end

  #Server
  def listen_loop(state) do
    IO.puts("\n Waiting for a message...")
    receive do
      {sender, :create_pledge, name, amount} ->
        {:ok, id} = send_pledge_to_service(name, amount)
        most_rec_pledges = Enum.take(state, 2)
        new_state = [{name, amount} | most_rec_pledges]
        send(sender, {:response, id})
        listen_loop(new_state)
      {sender, :recent_pledges} ->
        send(sender, {:response, state})
        listen_loop(state)
      {sender, :total_pledged} ->
        total = Enum.map(state, &elem(&1,1)) |> Enum.sum
        send(sender, {:response, total})
        listen_loop(state)
      unexpected ->
        IO.puts "Unexpected messaged: #{inspect unexpected}"
        listen_loop(state)
    end
  end


  def send_pledge_to_service(_name, _amount) do
    {:ok, "pledge-#{:rand.uniform(1000)}"}
  end

   #devuelve los primeros 3 elementos
  def sim_cache([h |_t], 2) do [h] end

  def sim_cache([], _n) do [] end

  def sim_cache([h | t], n) when n < 2 do
     [h] ++ sim_cache(t, n + 1)
  end

end


 alias Servy.PledgeServer

 pid = PledgeServer.start()
 send(pid, {:stop, "hammertime"})

 IO.inspect(PledgeServer.create_pledge("alde1", 10))
 IO.inspect(PledgeServer.create_pledge("alde2", 10))
 IO.inspect(PledgeServer.create_pledge("alde3", 10))
 IO.inspect(PledgeServer.create_pledge("alde4", 10))
 IO.inspect(PledgeServer.create_pledge("alde5", 10))

 IO.inspect(PledgeServer.recent_pledge())

 IO.inspect(PledgeServer.total_pledged())
 IO.inspect(Process.info(pid, :messages))
