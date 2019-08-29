defmodule ESClient.Drivers.HTTPoison do
  @moduledoc """
  An adapter implementation that uses HTTPoison to dispatch requests to
  Elasticsearch.
  """

  @behaviour ESClient.Driver

  @impl true
  def request(verb, url, body, headers, opts) do
    {:ok, _} = Application.ensure_all_started(:httpoison)
    HTTPoison.request(verb, URI.to_string(url), body, headers, opts)
  end
end
