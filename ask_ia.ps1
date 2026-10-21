# ============================================================
# Assistant IA - programme d'aide (deux modes)
# ------------------------------------------------------------
# Mode AUTONOME (avec l'option -Autonome) :
#   Aucun script JAWS requis. Le programme demande la question
#   dans une boite de saisie, interroge une intelligence
#   artificielle gratuite (aucune cle requise), depose la
#   reponse dans le presse-papiers et la fait lire par JAWS
#   (par son interface integree ; sinon, par la voix Windows).
#   CONVERSATION : apres chaque reponse, une nouvelle boite
#   s'ouvre pour la question suivante, et l'assistant garde le
#   fil de la conversation. Laisser le champ vide ou faire
#   Echap pour terminer.
#
# Mode PRESSE-PAPIERS (sans option) :
#   Mode d'origine, utilise par le script JAWS AssistantIA.jss.
#   La question est lue dans le presse-papiers et la reponse
#   y est deposee, sans lecture vocale.
#
# Emplacement attendu : C:\AssistantIA\ask_ia.ps1
# ============================================================

param(
    [switch]$Autonome
)

function Parler-JAWS {
    param([Parameter(Mandatory)][string]$Texte)
    # 1) Faire parler JAWS lui-meme, si JAWS est en cours d'execution
    if (Get-Process jfw -ErrorAction SilentlyContinue) {
        try {
            $jaws = New-Object -ComObject FreedomSci.JawsApi
            [void]$jaws.SayString($Texte)
            return
        } catch { }
    }
    # 2) Repli : voix synthetisee de Windows
    try {
        Add-Type -AssemblyName System.Speech
        $voix = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $voix.Speak($Texte)
    } catch { }
}

function Obtenir-Reponse {
    param([Parameter(Mandatory)][string]$Question)
    $encoded = [uri]::EscapeDataString($Question.Trim())
    $url = "https://text.pollinations.ai/$encoded"
    $answer = Invoke-RestMethod -Uri $url -Method Get -TimeoutSec 90
    if ($answer -isnot [string]) { $answer = $answer | Out-String }
    return $answer.Trim()
}

function Obtenir-ReponseSuivi {
    param(
        [Parameter(Mandatory)][string]$Question,
        [array]$Historique = @()
    )
    # Construit le contexte : instruction, derniers echanges (au plus 5,
    # reponses tronquees a 300 caracteres), puis la nouvelle question.
    $morceaux = @('Tu es un assistant vocal. Reponds en francais, clairement et brievement.')
    foreach ($e in ($Historique | Select-Object -Last 5)) {
        $r = $e.Reponse
        if ($r.Length -gt 300) { $r = $r.Substring(0, 300) }
        $morceaux += "Question : $($e.Question)"
        $morceaux += "Reponse : $r"
    }
    $morceaux += "Nouvelle question : $($Question.Trim())"
    $encoded = [uri]::EscapeDataString(($morceaux -join "`n"))
    $url = "https://text.pollinations.ai/$encoded"
    $answer = Invoke-RestMethod -Uri $url -Method Get -TimeoutSec 90
    if ($answer -isnot [string]) { $answer = $answer | Out-String }
    return $answer.Trim()
}

if ($Autonome) {
    $ErrorActionPreference = 'Stop'
    try {
        Add-Type -AssemblyName Microsoft.VisualBasic
        $historique = @()
        $premier = $true
        while ($true) {
            if ($premier) {
                $invite = "Écrivez votre question, puis faites Entrée :"
            } else {
                $invite = "Écrivez votre question suivante, puis faites Entrée. Laissez le champ vide ou faites Échap pour terminer."
            }
            $question = [Microsoft.VisualBasic.Interaction]::InputBox(
                $invite, "Assistant IA", "")
            if ([string]::IsNullOrWhiteSpace($question)) { break }

            Parler-JAWS "Question envoyée, j'attends la réponse."

            $reponse = Obtenir-ReponseSuivi $question $historique
            $historique += [pscustomobject]@{ Question = $question.Trim(); Reponse = $reponse }
            Set-Clipboard -Value $reponse
            Parler-JAWS $reponse
            $premier = $false
        }
        if ($historique.Count -gt 0) { Parler-JAWS "Conversation terminée." }
    } catch {
        $msg = "Impossible d'obtenir une réponse. Vérifiez votre connexion Internet, puis réessayez."
        try { Set-Clipboard -Value "[ERREUR] $msg $($_.Exception.Message)" } catch { }
        Parler-JAWS $msg
    }
    exit 0
}

# ----- Mode presse-papiers (script JAWS) -----
$ErrorActionPreference = 'Stop'
try {
    $question = Get-Clipboard -Raw
    if ([string]::IsNullOrWhiteSpace($question)) { exit 1 }
    $answer = Obtenir-Reponse $question
    Set-Clipboard -Value $answer
} catch {
    Set-Clipboard -Value "[ERREUR] Impossible d'obtenir une reponse. $($_.Exception.Message)"
}
