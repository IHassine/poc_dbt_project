# 1. Image de base officielle Python slim (léger)
FROM python:3.9-slim

# 2. Variables d'environnement pour éviter les fichiers pyc et buffer flush
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3. Création et passage à un répertoire de travail sécurisé
RUN mkdir /app
WORKDIR /app

# 4. Copie des fichiers de dépendances d'abord (optimisation du cache)
COPY requirements.txt .

# 5. Installation des dépendances système nécessaires + nettoyage pour réduire la taille
RUN apt-get update && apt-get install -y --no-install-recommends gcc \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get purge -y --auto-remove gcc \
    && rm -rf /var/lib/apt/lists/*

# 6. Copie du reste du code source
COPY . .

# 7. Création d’un utilisateur non-root pour plus de sécurité

# 9. Commande de lancement de l’application
CMD ["dbt build"]