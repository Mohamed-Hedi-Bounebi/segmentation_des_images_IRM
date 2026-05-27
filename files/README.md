# nnUNetv2 — Dataset Conversion Pipeline

Un pipeline complet pour convertir et préparer des datasets médicaux au format nnUNetv2.

## 📁 Structure du projet

```
nnunetv2-dataset-pipeline/
│
├── dataset_conversion/
│   ├── __init__.py
│   ├── convert_MSD_dataset.py
│   ├── convert_raw_dataset_from_old_nnunet_format.py
│   ├── Dataset015_018_RibFrac_RibSeg.py
│   ├── Dataset021_CTAAorta.py
│   ├── Dataset023_AbdomenAtlas1_1Mini.py
│   ├── Dataset027_ACDC.py
│   ├── Dataset042_BraTS18.py
│   ├── Dataset043_BraTS19.py
│   ├── Dataset073_Fluo_C3DH_A549_SIM.py
│   ├── Dataset114_MNMs.py
│   ├── Dataset115_EMIDEC.py
│   ├── Dataset119_ToothFairy2_All.py
│   ├── Dataset120_RoadSegmentation.py
│   ├── Dataset137_BraTS21.py
│   ├── Dataset218_Amos2022_task1.py
│   ├── Dataset219_Amos2022_task2.py
│   ├── Dataset220_KiTS2023.py
│   ├── Dataset221_AutoPETII_2023.py
│   ├── Dataset223_AMOS2022postChallenge.py
│   ├── Dataset224_AbdomenAtlas1.0.py
│   ├── Dataset226_BraTS2024-BraTS-GLI.py
│   ├── Dataset227_TotalSegmentatorMRI.py
│   ├── Dataset987_dummyDataset4.py
│   ├── Dataset989_dummyDataset4_2.py
│   └── generate_dataset_json.py
│
├── notebooks/
│   └── run_all_datasets.ipynb
│
├── requirements.txt
├── setup.sh
└── README.md
```

## 🚀 Installation rapide

### 1. Cloner le repo

```bash
git clone https://github.com/VOTRE_USERNAME/nnunetv2-dataset-pipeline.git
cd nnunetv2-dataset-pipeline
```

### 2. Installer les dépendances

```bash
pip install -r requirements.txt
```

### 3. Configurer les variables d'environnement

```bash
export nnUNet_raw="/path/to/nnUNet_raw"
export nnUNet_preprocessed="/path/to/nnUNet_preprocessed"
export nnUNet_results="/path/to/nnUNet_results"
```

Ou ajoutez-les à votre `~/.bashrc` / `~/.zshrc`.

## 📦 Datasets supportés

| Dataset ID | Nom | Modalité |
|------------|-----|----------|
| 015/018 | RibFrac / RibSeg | CT |
| 021 | CTA Aorta | CT |
| 023 | AbdomenAtlas 1.1 Mini | CT |
| 027 | ACDC | IRM cardiaque |
| 042 | BraTS 2018 | IRM cérébrale |
| 043 | BraTS 2019 | IRM cérébrale |
| 073 | Fluo-C3DH-A549-SIM | Microscopie |
| 114 | MNMs | IRM cardiaque |
| 115 | EMIDEC | IRM cardiaque |
| 119 | ToothFairy2 | CBCT dentaire |
| 120 | Road Segmentation | RGB |
| 137 | BraTS 2021 | IRM cérébrale |
| 218 | AMOS 2022 Task 1 | CT |
| 219 | AMOS 2022 Task 2 | IRM |
| 220 | KiTS 2023 | CT |
| 221 | AutoPET II 2023 | PET/CT |
| 223 | AMOS 2022 Post-Challenge | CT/IRM |
| 224 | AbdomenAtlas 1.0 | CT |
| 226 | BraTS 2024 GLI | IRM cérébrale |
| 227 | TotalSegmentatorMRI | IRM |

## ▶️ Utilisation

### Convertir un dataset spécifique

```bash
python dataset_conversion/Dataset027_ACDC.py
```

### Générer le fichier dataset.json

```bash
python dataset_conversion/generate_dataset_json.py \
    --output_dir /path/to/nnUNet_raw/DatasetXXX_Name \
    --channel_names '{"0": "MRI"}' \
    --labels '{"background": 0, "structure": 1}' \
    --num_training_cases 100
```

### Lancer tous les datasets (Notebook Jupyter)

```bash
jupyter notebook notebooks/run_all_datasets.ipynb
```

## 🔧 Requirements

```
nnunetv2
SimpleITK
numpy
pandas
tqdm
nibabel
```

## 📖 Références

- [nnUNet GitHub officiel](https://github.com/MIC-DKFZ/nnUNet)
- [Documentation nnUNetv2](https://github.com/MIC-DKFZ/nnUNet/tree/master/documentation)

## 📄 Licence

Ce projet suit la licence de nnUNet (Apache 2.0).
