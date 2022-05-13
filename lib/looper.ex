defmodule LoadFestBookClub.Looper do
  use GenServer

  alias LoadFestBookClub.Client

  # @url Application.get_env(:load_fest_book_club, :looper)[:url]
  # @tasks Application.get_env(:load_fest_book_club, :looper)[:tasks]
  # @every Application.get_env(:load_fest_book_club, :looper)[:every]

  @url "https://book-club.fly.dev/repos/7/requests/new"
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
    1..100
    |> Task.async_stream(fn _n -> Client.post(@url) end, max_concurrency: 10)
    |> Enum.to_list()

    loop()

    {:noreply, state}
  end

  defp loop(every \\ @every) do
    Process.send_after(self(), :loop, every)
  end
end
