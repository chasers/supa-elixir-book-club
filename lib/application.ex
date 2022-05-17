defmodule LoadFestBookClub.Application do
  @moduledoc """
  Starts a dynamic supervisor for LoadFest tasks.
  """

  use Application

  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: LoadFestBookClub.TaskSupervisor},
      {Finch,
       name: LoadFestBookClub.BookClubPool,
       pools: %{
         :default => [size: 200]
       }},
      LoadFestBookClub.Looper
    ]

    opts = [strategy: :one_for_one, name: LoadFest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
