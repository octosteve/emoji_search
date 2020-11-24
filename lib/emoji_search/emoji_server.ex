defmodule EmojiServer do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def all do
    GenServer.call(__MODULE__, :all)
  end

  def init(:ok) do
    emojis = EmojiClient.fetch_local()
    {:ok, %{emojis: emojis}}
  end

  def handle_call(:all, _from, state) do
    {:reply, state.emojis, state}
  end
end
