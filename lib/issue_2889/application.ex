defmodule Issue2889.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Issue2889Web.Telemetry,
      # Start the Ecto repository
      # Issue2889.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Issue2889.PubSub},
      # Start Finch
      {Finch, name: Issue2889.Finch},
      # Start the Endpoint (http/https)
      Issue2889Web.Endpoint
      # Start a worker by calling: Issue2889.Worker.start_link(arg)
      # {Issue2889.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Issue2889.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Issue2889Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
