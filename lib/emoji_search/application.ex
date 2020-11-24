defmodule EmojiSearch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      EmojiSearch.Repo,
      # Start the Telemetry supervisor
      EmojiSearchWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: EmojiSearch.PubSub},
      # Start the Endpoint (http/https)
      EmojiSearchWeb.Endpoint,
      EmojiServer
      # Start a worker by calling: EmojiSearch.Worker.start_link(arg)
      # {EmojiSearch.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EmojiSearch.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EmojiSearchWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
