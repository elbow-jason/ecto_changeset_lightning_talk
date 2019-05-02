defmodule EctoChangesetLt.Money do
  alias EctoChangesetLt.Money
  alias Ecto.Changeset
  use Ecto.Schema

  @type t :: %__MODULE__{
          units: non_neg_integer(),
          kind: String.t()
        }

  @primary_key false
  embedded_schema do
    field :units, :integer
    field :kind, :string
  end

  @spec changeset(map()) :: Changeset.t()
  def changeset(params) do
    %Money{}
    |> Changeset.cast(params, [:units, :kind])
    |> Changeset.validate_required([:units, :kind])
    |> Changeset.validate_number(:units, greater_than_or_equal_to: 0)
    |> Changeset.validate_inclusion(:kind, ["$"])
  end
end
