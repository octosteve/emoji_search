defmodule EmojiSearch.Repo do
  use Ecto.Repo,
    otp_app: :emoji_search,
    adapter: Ecto.Adapters.Postgres
end
