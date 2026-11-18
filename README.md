# Scripts SRDV

Scripts partagés par Josué Coudé — outils d'accessibilité pour les usagers de JAWS (SRDV).

## Contenu

- **ask_ia.ps1** : l'« Assistant IA » pour JAWS. Une touche de raccourci ouvre une boîte où l'on écrit une question ; une intelligence artificielle gratuite répond (aucune clé requise), JAWS lit la réponse et la copie dans le presse-papiers. Mode conversation : on peut enchaîner les questions.
- **Creer-Raccourci.ps1** : crée le raccourci Bureau « Assistant IA » et sa touche Ctrl+Alt+Q. À exécuter une seule fois.
- **Guide d'installation.docx** : le guide d'installation et d'utilisation de l'assistant IA, étape par étape.

## Installation rapide

1. Créez le dossier `C:\AssistantIA\` sur votre ordinateur et copiez-y `ask_ia.ps1` et `Creer-Raccourci.ps1`.
2. Ouvrez PowerShell et lancez :
   `powershell -ExecutionPolicy Bypass -File C:\AssistantIA\Creer-Raccourci.ps1`
3. Appuyez ensuite sur **Ctrl+Alt+Q** n'importe où dans Windows pour poser une question.

Le guide (.docx) explique tout en détail.


## Nouveaux outils (parution v2, novembre 2026)

Archives ZIP complètes, prêtes à télécharger d'un seul clic :

- **Recherche de vidéos YouTube** : chercher une vidéo par son titre, l'écouter pour vérifier le son, copier son lien ou la télécharger en MP3. Texte seulement, pensé pour un lecteur d'écran (JAWS). Lanceur : Lancer-Recherche-Video.vbs.
  https://github.com/josuecoude/scripts-srdv/releases/download/v2/Recherche-Video-YouTube.zip
- **Graver-CD** : graver un CD audio à partir de fichiers MP3, en deux versions (par le presse-papiers et par recherche de titres).
  https://github.com/josuecoude/scripts-srdv/releases/download/v2/Graver-CD.zip
- **Analyse-Stockfish** : analyser une partie d'échecs (fichier PGN) avec le moteur Stockfish et produire un rapport texte, coup par coup. Aucune installation requise.
  https://github.com/josuecoude/scripts-srdv/releases/download/v2/Analyse-Stockfish.zip
- **ICI Tou.tv** : écouter le son d'un épisode ou télécharger sa vidéo, à partir du lien de l'épisode ou de la série. Attention : en ce moment, Radio-Canada refuse les demandes de l'outil ; il se réparera tout seul quand une correction de yt-dlp existera.
  https://github.com/josuecoude/scripts-srdv/releases/download/v2/TouTV.zip

Chaque archive contient le script, son lanceur et son guide.

## Nouveaux outils (parution v3, novembre 2026)

Archives ZIP complètes, prêtes à télécharger d'un seul clic :

- **Transcrire-Audio-Whisper** : transcrire un fichier audio en texte, en local sur Windows, avec Whisper (français par défaut). Le fichier texte est créé dans le même dossier que l'audio.
  https://github.com/josuecoude/scripts-srdv/releases/download/v3/Transcrire-Audio-Whisper.zip
- **Copier la réponse de Copilot** : copier la réponse de Microsoft 365 Copilot avec Ctrl+Alt+Maj+C, pour JAWS. Contient le script AutoHotkey, la bibliothèque UIA et son guide. Première version, à essayer sur le poste.
  https://github.com/josuecoude/scripts-srdv/releases/download/v3/CopierReponseCopilot.zip
- **Entraîneur de raccourcis clavier** : s'entraîner aux raccourcis clavier Windows, version 14, 5 leçons, avec voix française. Contient le programme, son lanceur et son guide. (Archive d'environ 40 Mo.)
  https://github.com/josuecoude/scripts-srdv/releases/download/v3/Entraineur-Raccourcis-Clavier.zip
- **Assistant IA en VBScript** : l'assistant IA pour JAWS en un seul fichier VBScript, sans PowerShell. Contient le script, une copie .txt pour envoi par courriel, son guide et les instructions d'envoi.
  https://github.com/josuecoude/scripts-srdv/releases/download/v3/AssistantIA-VBS.zip

Chaque archive contient le programme, son lanceur et son guide.

## Standards Windows (novembre 2026)

- **Standards Windows** : script de standardisation Windows 11 pour les postes de clients aveugles (JAWS, NVDA, ZoomText), version 2.21 du 7 novembre 2026. L'archive contient le script, son lanceur, les réglages à faire à la main et la liste complète des actions du script.
  https://github.com/josuecoude/scripts-srdv/releases/download/standards-windows-v2.21/Standards-Windows.zip

## Jeux et entraînement en ligne

Fichiers HTML à ouvrir directement en ligne, sans téléchargement :

- **Jeu Simon** : jeu de mémoire sonore.
  En ligne : https://josuecoude.github.io/scripts-srdv/Jeu-Simon.html
  Téléchargement : https://github.com/josuecoude/scripts-srdv/releases/download/jeu-simon/Jeu-Simon.html
- **Entraînement clavier QWERTY** : entraînement au clavier français Canada QWERTY.
  En ligne : https://josuecoude.github.io/scripts-srdv/Entrainement-clavier-QWERTY.html
  Téléchargement : https://github.com/josuecoude/scripts-srdv/releases/download/clavier-qwerty/Entrainement-clavier-QWERTY.html
- **Jeu de fléchettes** : jeu de fléchettes sonore. En ligne seulement :
  https://josuecoude.github.io/scripts-srdv/Jeu-Flechettes.html

Note : l'outil Recherche-Web a été retiré le 18 novembre 2026, car il ne fonctionnait pas bien.
