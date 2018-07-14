defmodule Mix.Tasks.Yarn do
  use Mix.Task

  @doc """
  Mix task for building the static web interface
  Run ```mix yarn```
  """
  def run(_) do
    build_cmd(Mix.env)
  end

  defp build_cmd(:prod) do
    Mix.Shell.cmd("cd web-interface; yarn build", fn(stdout)-> IO.puts stdout end)
  end

  defp build_cmd(:dev) do
    Mix.Shell.cmd("cd web-interface; yarn build-dev", fn(stdout)-> IO.puts stdout end)
  end

  defp build_cmd(:test) do
    Mix.Shell.cmd("cd web-interface; yarn build", fn(stdout)-> IO.puts stdout end)
  end
end
