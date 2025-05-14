defmodule LeMeilleurBanc.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  # @password_hash_salt_name "le_meilleur_banc_user_password"

  schema "users" do
    field(:email, :string)
    field(:hashed_password, :string)
    # Champ virtuel pour le mot de passe en clair
    field(:password, :string, virtual: true)

    timestamps(type: :utc_datetime)
  end

  @doc """
  A user changeset for registration.

  It is important to always call `transform_changes/1` on the changeset
  before calling `apply_action`.
  """
  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_email()
    |> validate_password()
    |> unique_constraint(:email)
  end

  defp validate_email(changeset) do
    changeset
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[\w.!#$%&'*+\/=?^`{|}~-]+@[\w-]+(?:\.[\w-]+)*$/i)
    |> unsafe_validate_unique(:email, LeMeilleurBanc.Repo)
    |> unique_constraint(:email)
  end

  defp validate_password(changeset) do
    changeset
    |> validate_required([:password])
    |> validate_length(:password, min: 8, max: 72)

    # Vous pouvez ajouter d'autres validations de mot de passe ici (ex: confirmation)
  end

  @doc """
  A user changeset for changing the password.

  It is important to always call `transform_changes/1` on the changeset
  before calling `apply_action`.
  """
  def password_changeset(user, attrs) do
    user
    |> cast(attrs, [:password])
    |> validate_password()
  end

  @doc false
  def changeset(user, attrs) do
    # Ce changeset est pour les mises à jour générales, NE PAS inclure :password ou :hashed_password directement ici
    # sauf si c'est géré avec une logique spécifique (ex: changement de mot de passe admin)
    user
    # Uniquement l'email pour cet exemple de changeset de base
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end

  # Fonction pour hacher et mettre le mot de passe dans le changeset
  # Cette fonction doit être appelée par votre contexte Accounts avant Repo.insert/update
  def put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} when is_binary(password) ->
        # Bcrypt.hash_pwd_salt/1 génère un salt unique et l'inclut dans le hash
        put_change(changeset, :hashed_password, Bcrypt.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
