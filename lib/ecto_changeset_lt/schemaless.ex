defmodule EctoChangesetLt.Schemaless do
  alias EctoChangesetLt.MoneyType

  def changeset(data, params) do
    types = %{
      age: :integer,
      name: :string,
      role: :string,
      money: MoneyType
    }

    Ecto.Changeset.cast({data, types}, params, Map.keys(types))
  end
end
