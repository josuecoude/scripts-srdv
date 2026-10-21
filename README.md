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
