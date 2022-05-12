defmodule LoadFestBookClub.Looper do
  use GenServer

  alias LoadFestBookClub.Client

  # @url Application.get_env(:load_fest_book_club, :looper)[:url]
  # @tasks Application.get_env(:load_fest_book_club, :looper)[:tasks]
  # @every Application.get_env(:load_fest_book_club, :looper)[:every]

  @url "https://book-club.fly.dev/repos/7/requests/new"
  @tasks 10
  @every 500

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
    Client.post_async(@tasks, @url)

    loop()

    {:noreply, state}
  end

  defp loop(every \\ @every) do
    Process.send_after(self(), :loop, every)
  end
end
