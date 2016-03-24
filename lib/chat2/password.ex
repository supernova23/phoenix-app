defmodule Chat2.Password do
  alias Chat2.Repo
  import Ecto.Changeset, only: [put_change: 3]
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]


  def generate_password(changeset) do
    put_change(changeset, :password_digest, hashpwsalt(changeset.params["password"]))
  end

  def generate_password_and_store_user(changeset) do
    changeset
      |> generate_password
      |> Repo.insert
  end
end
