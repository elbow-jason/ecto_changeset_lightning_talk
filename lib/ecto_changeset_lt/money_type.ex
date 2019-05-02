defmodule EctoChangesetLt.MoneyType do
  @behaviour Ecto.Type

  alias EctoChangesetLt.Money
  alias Ecto.Changeset

  @impl Ecto.Type
  @spec type() :: :map
  def type, do: :map

  @impl Ecto.Type
  @spec dump(any()) :: :error | {:ok, map()}
  def dump(%Money{} = money), do: {:ok, Map.from_struct(money)}
  def dump(_), do: :error

  @impl Ecto.Type
  @spec load(map) :: :error | {:ok, map()}
  def load(map) when is_map(map), do: cast_map(map)

  @impl Ecto.Type
  @spec cast(any()) :: :error | {:ok, map()}
  def cast(map) when is_map(map), do: cast_map(map)

  def cast("$" <> money) do
    with(
      # ["1", "00"]
      {int, decimal} <- split_cents(money),
      # {1, ""}
      {dollars, ""} <- Integer.parse(int),
      # {0, ""}
      {cents, ""} <- Integer.parse(decimal),
      # cents is in correct range
      true <- cents in 0..99,
      # dollars is not neg
      true <- dollars >= 0
    ) do
      cast_map(%{kind: "$", units: dollars * 100 + cents})
    else
      _ -> :error
    end
  end
  def cast(_), do: :error

  def split_cents(number) do
    case String.split(number, ".") do
      # without a decimal the cents it "00"
      [int] -> {int, "00"}
      # make sure decimals is 2 chars long
      [int, decimal] when byte_size(decimal) == 2 -> {int, decimal}
      _ -> :error
    end
  end

  defp cast_map(map) do
    case Money.changeset(map) do
      %{valid?: true} = cs -> {:ok, Changeset.apply_changes(cs)}
      %{valid?: false} -> :error
    end
  end
end
