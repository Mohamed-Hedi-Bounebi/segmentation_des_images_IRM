# 🧠 Segmentation 2D des lésions ischémiques (ISLES‑2022)

Ce projet implémente un réseau de type **U‑Net 2D** pour segmenter automatiquement les lésions de l’accident vasculaire cérébral (AVC) à partir d’images de diffusion (DWI) de la campagne **ISLES‑2022** (Ischemic Stroke Lesion Segmentation). Le code permet l’entraînement complet d’un modèle, l’évaluation sur un jeu de validation, ainsi que l’inférence sur des données de test.

---

## 📌 Contexte médical

L’imagerie de diffusion (DWI) est la modalité de référence pour détecter l’œdème cytotoxique précoce lors d’un AVC ischémique. La segmentation automatique du noyau ischémique est un enjeu clinique majeur pour la prise de décision thérapeutique. Ce projet applique une approche d’apprentissage profond pour segmenter les lésions en 2D coupe par coupe.

---

## 🗂️ Structure du dépôt
├── best_modelDWIv_2DUnet.h5 # Modèle entraîné (poids sauvegardés)
├── 2dunet_model_isles2022_dwi_...h5 # Modèle final après entraînement
├── main_training.py # Script complet d’entraînement et d’évaluation
├── test_inference.py # Script de test sur des données nouvelles
├── README.md
└── requirements.txt

text

---

## 📊 Jeu de données – ISLES‑2022

- **Source** : [ISLES‑2022 Challenge](https://isles22.grand-challenge.org/) (données non partagées directement, mais le code suppose une organisation locale)
- **Modalité** : DWI (diffusion‑weighted imaging) + masques de référence (`msk.nii.gz`)
- **Format** : NIfTI (`.nii.gz`) + métadonnées JSON (valeur b)
- **Structure attendue** :
ISLES-2022/
├── sub-strokecase/ses-0001/dwi/sub-strokecase_ses-0001_dwi.nii.gz
└── derivatives/sub-strokecase/ses-0001/sub-strokecase_ses-0001_msk.nii.gz

text
`****` est remplacé par l’identifiant patient (ex. `0001`, `0002`).

> ⚠️ Les fichiers doivent être organisés selon ce pattern. Les chemins dans le code sont à adapter.

---

## 🧠 Architecture du modèle

- **U‑Net 2D classique** avec blocs convolutionnels (conv 3×3 + BatchNorm + Dropout 0.1)
- **Pathologie de contraction** : 3 niveaux (16 → 32 → 64 filtres)
- **Pathologie d’expansion** : transposée de convolution + concaténation
- **Fonction de perte** : binary cross‑entropy
- **Métrique** : Dice score (également calculé en post‑traitement)
- **Optimiseur** : Adam
- **Callback** : EarlyStopping (patience 10), ReduceLROnPlateau, ModelCheckpoint

---

## 🛠️ Installation et prérequis

### Environnement recommandé
- Python 3.8+
- TensorFlow 2.10+ (ou 2.x compatible)
- CUDA / cuDNN pour accélération GPU

### Dépendances
Installer avec `pip install -r requirements.txt` :
numpy
scipy
matplotlib
scikit-image
scikit-learn
tensorflow
SimpleITK
nibabel
nilearn
pydicom

text

### Vérification rapide
```bash
python -c "import tensorflow as tf; print(tf.__version__)"
🚀 Utilisation
1. Adapter les chemins des données
Dans main_training.py (ou test_inference.py), modifiez les variables :

python
nifti_images_folder = r"VOTRE_CHEMIN/sub-strokecase****/ses-0001/dwi/sub-strokecase****_ses-0001_dwi.nii.gz"
nifti_masks_folder  = r"VOTRE_CHEMIN/derivatives/sub-strokecase****/ses-0001/sub-strokecase****_ses-0001_msk.nii.gz"
2. Entraînement
bash
python main_training.py
Ce script :

Charge les patients de l’indice start=1 à end=250

Redimensionne toutes les coupes à 128×128

Normalise les intensités

Entraîne le modèle avec une validation split 0.1

Sauvegarde le meilleur modèle (best_modelDWIv_2DUnet.h5) et le modèle final

3. Inférence sur un jeu de test
Le script séparé test_inference.py charge le modèle sauvegardé et prédit sur les patients start=3 à end=4.

bash
python test_inference.py
Il produit :

Affichage des images DWI, masques vérité terrain, masques prédits

Calcul du coefficient de Dice

Sauvegarde des figures (p.ex. DWI_input.png, Ground_truth.png, Prediction.png)

📈 Métriques d’évaluation
Le code calcule et affiche :

Accuracy, Sensitivity (Recall), Specificity, Precision, F1‑Score

Matrice de confusion

Courbe ROC avec AUC

Dice Similarity Coefficient (validation et test)

Graphiques d’entraînement (accuracy / loss)

Exemple de sortie :

text
Accuracy: 0.986
Sensitivity (Recall): 0.801
Specificity: 0.992
Precision: 0.762
F1-Score: 0.781
Dice Similarity Coefficient: 0.742
🖼️ Visualisations générées
Comparaison image + masque réel + masque prédit (exemple aléatoire)

Grille des images de test (entrée, vérité, prédiction)

Courbe ROC

Matrice de confusion

Évolution de l’accuracy et de la loss au fil des époques

🔧 Personnalisation
Taille d’entrée : modifier target_shape (ex. (256,256))

Nombre de filtres : ajuster dans create_unet_model

Seuil de binarisation : variable threshold (0.5 par défaut)

Patients : modifier les indices start / end dans get_nifti_data_set_from_folder

📝 Notes importantes
Le filtre mri_array.shape[1] == 112 et slice_thickness == 2 est spécifique aux données ISLES‑2022. Si vos données diffèrent, ajustez ou supprimez ces conditions.

Les valeurs b sont extraites des fichiers JSON. En l’absence du fichier ou de la clé, le patient est ignoré.

Les masques sont arrondis après redimensionnement pour rester binaires.

🙏 Remerciements
Organisation ISLES‑2022 pour la mise à disposition des données

L’équipe nnU‑Net pour l’inspiration architecturale (adaptée ici en 2D)

Communauté TensorFlow / Keras

📄 Licence
Ce projet est distribué sous licence MIT. Les données ISLES‑2022 restent soumises à leurs conditions d’utilisation propres (accord challenge).

✍️ Auteur
Mohamed‑Hédi Bounebi
GitHub : @Mohamed-Hedi-Bounebi


Ce README décrit clairement le projet, son objectif clinique, l’architecture, l’installation, l’utilisation et les résultats. Il est prêt à être copié dans votre dépôt GitHub.
