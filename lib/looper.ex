defmodule LoadFestBookClub.Looper do
  use GenServer

  alias LoadFestBookClub.Client

  @url Application.get_env(:load_fest_book_club, __MODULE__)[:url]
  @max_concurrency 10
  @stream_len 100
  @every 0

  def start_link(args \\ []) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(stack) do
    loop(0)

    {:ok, stack}
  end

  @impl true
  def handle_info(:loop, state) do
    1..@stream_len
    |> Task.async_stream(fn _n -> Client.post(@url) end, max_concurrency: @max_concurrency)
    |> Enum.to_list()

    loop()

    {:noreply, state}
  end

  defp loop(every \\ @every) do
    Process.send_after(self(), :loop, every)
  end
end
