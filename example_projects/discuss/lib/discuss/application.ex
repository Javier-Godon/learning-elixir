defmodule Discuss.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DiscussWeb.Telemetry,
      Discuss.Repo,
      {DNSCluster, query: Application.get_env(:discuss, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Discuss.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Discuss.Finch},
      # Start a worker by calling: Discuss.Worker.start_link(arg)
      # {Discuss.Worker, arg},
      # Start to serve requests, typically the last entry
      DiscussWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Discuss.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DiscussWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
