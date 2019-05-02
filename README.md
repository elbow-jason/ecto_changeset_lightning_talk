# EctoChangesetLt

```elixir
iex(1)> Embedded.changeset(%Embedded{}, %{}) 
#Ecto.Changeset<action: nil, changes: %{}, errors: [],
 data: #EctoChangesetLt.Embedded<>, valid?: true>
iex(2)> Embedded.changeset(%Embedded{}, %{name: "Jason"})
#Ecto.Changeset<
  action: nil,
  changes: %{name: "Jason"},
  errors: [],
  data: #EctoChangesetLt.Embedded<>,
  valid?: true
>
iex(3)> Embedded.changeset(%Embedded{}, %{name: "Jason", money: "$400"})
#Ecto.Changeset<
  action: nil,
  changes: %{
    money: %EctoChangesetLt.Money{kind: "$", units: 40000},
    name: "Jason"
  },
  errors: [],
  data: #EctoChangesetLt.Embedded<>,
  valid?: true
>
iex(4)> Embedded.changeset(%Embedded{}, %{name: "Jason", money: "$400.00"})
#Ecto.Changeset<
  action: nil,
  changes: %{
    money: %EctoChangesetLt.Money{kind: "$", units: 40000},
    name: "Jason"
  },
  errors: [],
  data: #EctoChangesetLt.Embedded<>,
  valid?: true
>
iex(5)> Embedded.changeset(%Embedded{}, %{name: "Jason", money: "$$$400.00"})
#Ecto.Changeset<
  action: nil,
  changes: %{name: "Jason"},
  errors: [
    money: {"is invalid", [type: EctoChangesetLt.MoneyType, validation: :cast]}
  ],
  data: #EctoChangesetLt.Embedded<>,
  valid?: false
>
iex(6)> Embedded.changeset(%Embedded{}, %{name: "Jason", money: "400.00"})   
#Ecto.Changeset<
  action: nil,
  changes: %{name: "Jason"},
  errors: [
    money: {"is invalid", [type: EctoChangesetLt.MoneyType, validation: :cast]}
  ],
  data: #EctoChangesetLt.Embedded<>,
  valid?: false
>
iex(7)> Schemaless.changeset(%Embedded{}, %{name: "Jason"})               
#Ecto.Changeset<
  action: nil,
  changes: %{name: "Jason"},
  errors: [],
  data: #EctoChangesetLt.Embedded<>,
  valid?: true
>
iex(8)> Schemaless.changeset(%Embedded{}, %{name: "Jason", money: "$123"})
#Ecto.Changeset<
  action: nil,
  changes: %{
    money: %EctoChangesetLt.Money{kind: "$", units: 12300},
    name: "Jason"
  },
  errors: [],
  data: #EctoChangesetLt.Embedded<>,
  valid?: true
>

```