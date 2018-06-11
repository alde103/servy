defmodule Servy.PledgeServer do
  def listen_loop(state) do
    IO.puts("\n Waiting for a message...")

    receive do
      {:create_pledge, name, amount} ->
        {:ok, id} = send_pledge_to_service(name, amount)
        new_state = [{name, amount} | state]
        IO.puts("#{name} pledge #{amount}!")
        IO.puts("New state is #{inspect new_state}")
        listen_loop(new_state)
      {:recent_pledges, pid} ->
        cache = sim_cache(state, 0)
        send(pid, {:response, cache})
        listen_loop(state)
    end
  end

  # def create_pledge(name,amount) do
  #   {:ok, id} = send_pledge_to_service(name,amount)
  # end

   def send_pledge_to_service(_name, _amount) do
     {:ok, "pledge-#{:rand.uniform(1000)}"}
   end

   #devuelve los primeros 3 elementos
   def sim_cache([h |_t], 3) do [h] end

   def sim_cache([], _n) do [] end

   def sim_cache([h | t], n) when n < 3 do
      [h] ++ sim_cache(t, n + 1)
   end

end
