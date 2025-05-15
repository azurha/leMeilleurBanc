alias LeMeilleurBanc.Repo
# Alias corrigé pour le schéma Bench
alias LeMeilleurBanc.Listings.Bench
# Supposant que vous avez un contexte Accounts pour les utilisateurs
alias LeMeilleurBanc.Accounts.User

# --- Création d'un utilisateur de test ---
email_test = "benoit@example.com"
password_test = "supersecret"

case Repo.get_by(User, email: email_test) do
  nil ->
    case LeMeilleurBanc.Accounts.create_user(%{email: email_test, password: password_test}) do
      {:ok, user} ->
        IO.puts("Utilisateur de test #{user.email} créé avec ID: #{user.id}")

      {:error, changeset} ->
        IO.inspect(changeset.errors, label: "Erreur lors de la création de l'utilisateur de test")
    end

  user ->
    IO.puts("Utilisateur de test #{user.email} existe déjà avec ID: #{user.id}")
end

IO.puts("Insertion des données de test (seeds)...")

# --- Bancs ---

%Bench{
  name: "Banc de France",
  status: "active",
  address: "123 Rue de la Paix, Paris, France",
  latitude: 48.8566,
  longitude: 2.3522,
  # Modifié
  photo_url: "/images/benches/bench_1.png",
  uploader_comment: "Commentaire de l'utilisateur",
  uploader_rating: 4.5,
  # Assurez-vous que cet utilisateur avec ID 1 existe
  user_id: 1
}
|> Repo.insert!()

%Bench{
  name: "Banc du Parc Central",
  status: "active",
  address: "Avenue des Arbres, Lyon, France",
  latitude: 45.7640,
  longitude: 4.8357,
  # Modifié
  photo_url: "/images/benches/bench_2.png",
  uploader_comment: "Très agréable pour une pause déjeuner.",
  uploader_rating: 5.0,
  user_id: 1
}
|> Repo.insert!()

%Bench{
  name: "Vue sur la Mer",
  status: "active",
  address: "Promenade du Littoral, Nice, France",
  latitude: 43.6950,
  longitude: 7.2735,
  # Modifié
  photo_url: "/images/benches/bench_3.png",
  uploader_comment: "Le meilleur endroit pour admirer le coucher de soleil.",
  uploader_rating: 5.0,
  user_id: 1
}
|> Repo.insert!()

%Bench{
  name: "Banc Urbain Caché",
  status: "pending_approval",
  address: "Ruelle des Secrets, Marseille, France",
  latitude: 43.2965,
  longitude: 5.3698,
  # Modifié
  photo_url: "/images/benches/bench_4.png",
  uploader_comment: "Petite trouvaille, très calme.",
  uploader_rating: 4.1,
  user_id: 1
}
|> Repo.insert!()

%Bench{
  name: "Halte Montagnarde",
  status: "active",
  address: "Sentier des Cimes, Chamonix, France",
  latitude: 45.9237,
  longitude: 6.8694,
  # Modifié
  photo_url: "/images/benches/bench_5.png",
  uploader_comment: "Parfait après une bonne randonnée.",
  uploader_rating: 4.2,
  user_id: 1
}
|> Repo.insert!()

%Bench{
  name: "Repos du Voyageur",
  status: "active",
  address: "Aire d'autoroute A7, France",
  latitude: 44.5580,
  longitude: 4.7860,
  # Modifié (cycle)
  photo_url: "/images/benches/bench_6.png",
  uploader_comment: "Bien utile pour une pause sur la route.",
  uploader_rating: 3.9,
  user_id: 1
}
|> Repo.insert!()

%Bench{
  name: "Banc de la Place du Village",
  status: "active",
  address: "Place de la Mairie, Giverny, France",
  latitude: 49.0756,
  longitude: 1.5300,
  # Modifié (cycle)
  photo_url: "/images/benches/bench_7.png",
  uploader_comment: "Ambiance charmante et paisible.",
  uploader_rating: 5.0,
  user_id: 1
}
|> Repo.insert!()

%Bench{
  name: "Banc Forestier",
  status: "pending_approval",
  address: "Forêt de Fontainebleau, France",
  latitude: 48.4047,
  longitude: 2.6960,
  # Modifié (cycle)
  photo_url: "/images/benches/bench_8.png",
  uploader_comment: "Pour les amoureux de la nature.",
  uploader_rating: 4.4,
  user_id: 1
}
|> Repo.insert!()

%Bench{
  name: "Panorama Urbain",
  status: "active",
  address: "Belvédère de Belleville, Paris, France",
  latitude: 48.8729,
  longitude: 2.3825,
  # Modifié (cycle)
  photo_url: "/images/benches/bench_9.png",
  uploader_comment: "Superbe vue sur la ville !",
  uploader_rating: 5.0,
  user_id: 1
}
|> Repo.insert!()

IO.puts("Données de test insérées avec succès !")
