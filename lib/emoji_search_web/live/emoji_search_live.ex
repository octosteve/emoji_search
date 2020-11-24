defmodule EmojiSearchWeb.EmojiSearchLive do
  use EmojiSearchWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    emojis = EmojiServer.all()
    {:ok, assign(socket, query: "", emojis: emojis)}
  end

  @impl true
  def handle_event("search", %{"q" => query}, socket) do
    {:noreply, assign(socket, emojis: search(socket, query))}
  end

  def per_row(emojis, count) do
    emojis
    |> Enum.chunk_every(count)
  end

  defp search(socket, query) do
    Emojis.search(socket.assigns.emojis, query)
  end
end
