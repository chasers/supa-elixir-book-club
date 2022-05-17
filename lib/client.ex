defmodule LoadFestBookClub.Client do
  require Logger

  def post_async(url) do
    Task.Supervisor.start_child(LoadFestBookClub.TaskSupervisor, fn ->
      post(url)
    end)
  end

  def post_async_many(count, url) do
    for _c <- 1..count do
      Task.Supervisor.start_child(LoadFestBookClub.TaskSupervisor, fn ->
        post(url)
      end)
    end
  end

  def post(url) do
    Req.post!(url, "", finch: LoadFestBookClub.BookClubPool)
  end
end
