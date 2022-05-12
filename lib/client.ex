defmodule LoadFestBookClub.Client do
  require Logger

  def post_async(count, url) do
    for _c <- 1..count do
      Task.Supervisor.start_child(LoadFestBookClub.TaskSupervisor, fn ->
        post(url)
      end)
    end
  end

  defp post(url) do
    Req.post!(url, "", [])
  end
end
