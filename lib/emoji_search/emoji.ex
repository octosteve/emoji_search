defmodule Emoji do
  defstruct [:term, :url]

  def new(term, url) do
    struct!(__MODULE__, term: term, url: url)
  end
end
