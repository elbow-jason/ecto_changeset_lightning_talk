defmodule EctoChangesetLt.Embedded do
  use Ecto.Schema

  alias EctoChangesetLt.{Embedded, MoneyType}

  # remove :id from the struct
  @primary_key false
  embedded_schema do
    field :age, :integer
    field :name, :string
    field :role, :string
    field :money, MoneyType
  end

  def changeset(%Embedded{} = data, params) do
    Ecto.Changeset.cast(data, params, [:age, :name, :role, :money])
  end
end
