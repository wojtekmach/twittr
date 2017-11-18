defmodule Twittr.Status do
  use Ecto.Schema
  import Ecto.Changeset
  alias Twittr.Status


  schema "statuses" do
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(%Status{} = status, attrs) do
    status
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
