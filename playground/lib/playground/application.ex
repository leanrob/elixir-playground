defmodule Playground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Playground.Worker.start_link(arg)
      # {Playground.Worker, arg},
      worker(PlaygroundTweet.TweetServer, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Playground.Supervisor]
    process = Supervisor.start_link(children, opts)
    PlaygroundTweet.Scheduler.schedule_file("* * * * *", Path.join("#{:code.priv_dir(:playground)}", "sampleFile.txt"))

    process
  end
end
