# 📋 Guide : Mettre votre projet sur GitHub
# Exécutez ces commandes une par une dans votre terminal Jupyter

# ===============================
# ÉTAPE 1 : Initialiser Git
# ===============================
cd ~/nnUNet/nnunetv2/dataset_conversion
git init

# ===============================
# ÉTAPE 2 : Copier les fichiers du projet
# ===============================
# Copiez README.md, .gitignore, requirements.txt, setup.sh, notebooks/
# dans votre dossier dataset_conversion

# ===============================
# ÉTAPE 3 : Configurer votre identité Git (1 seule fois)
# ===============================
git config --global user.name  "VotrePrenom NomDeFamille"
git config --global user.email "votre@email.com"

# ===============================
# ÉTAPE 4 : Ajouter tous les fichiers
# ===============================
git add .
git status   # Vérifiez ce qui va être commité

# ===============================
# ÉTAPE 5 : Premier commit
# ===============================
git commit -m "Initial commit : nnUNetv2 dataset conversion pipeline"

# ===============================
# ÉTAPE 6 : Créer le repo sur GitHub
# ===============================
# 1. Allez sur https://github.com/new
# 2. Nom du repo : nnunetv2-dataset-pipeline
# 3. Laissez VIDE (sans README, sans .gitignore)
# 4. Cliquez "Create repository"

# ===============================
# ÉTAPE 7 : Connecter et pousser
# ===============================
git remote add origin https://github.com/VOTRE_USERNAME/nnunetv2-dataset-pipeline.git
git branch -M main
git push -u origin main

# ✅ Votre projet est maintenant sur GitHub !
