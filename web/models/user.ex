import Comeonin.Bcrypt, only: [hashpwsalt: 1]
defmodule Chat2.User do
  use Chat2.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_digest, :string

    timestamps

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    #relations
    has_many :posts, Chat2.Post
  end

  @required_fields ~w(username email password password_confirmation) #password_digest
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:username)
    |> validate_length(:password, min: 1)
    |> validate_length(:password_confirmation, min: 1)
    |> validate_confirmation(:password)
  end

  defp hash_password(changeset) do
    if password = get_change(changeset, :password) do
      changeset |> put_change(:password_digest, hashpwsalt(password))
    else
      changeset
    end
  end

  #def validate_confirmation(changeset, field) do
  #  value = get_field(changeset, field)
  #  confirmation_value = get_field(changeset, :"#{field}_confirmation")
  #  if  do
  #    add_error(changeset, :"#{field}_confirmation", "does not match")
  #  else
  #    changeset
  #  end
  #end
end
