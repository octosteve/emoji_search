defmodule Emojis do
  defstruct [:emojis, :results]

  def new(raw_emojis) do
    emojis =
      for {term, url} <- raw_emojis do
        Emoji.new(term, url)
      end

    struct!(__MODULE__, emojis: emojis, results: [])
  end

  def search(%__MODULE__{emojis: emojis} = struct, query) do
    Map.put(struct, :results, emojis |> Enum.filter(&matches?(&1, query)))
  end

  defp matches?(%Emoji{term: term}, query) do
    String.match?(term, ~r/#{query}/)
  end
end
