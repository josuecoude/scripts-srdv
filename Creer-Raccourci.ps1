# ============================================================
# Assistant IA - creation du raccourci Bureau (a executer UNE fois)
# ------------------------------------------------------------
# Cree sur le Bureau un raccourci « Assistant IA » associe a la
# combinaison Ctrl+Alt+Q. Ensuite, cette touche fonctionne
# partout dans Windows, sans aucun script JAWS.
#
# Prerequis : ask_ia.ps1 doit etre dans C:\AssistantIA\
# ============================================================

$dossier = 'C:\AssistantIA'
$cible = Join-Path $dossier 'ask_ia.ps1'

if (-not (Test-Path $cible)) {
    Write-Host "ATTENTION : ask_ia.ps1 est introuvable dans $dossier."
    Write-Host "Copiez d'abord ask_ia.ps1 dans ce dossier, puis relancez ce programme."
    Read-Host "Appuyez sur Entree pour fermer"
    exit 1
}

try {
    $ws = New-Object -ComObject WScript.Shell
    $bureau = [Environment]::GetFolderPath('Desktop')
    $lnk = $ws.CreateShortcut((Join-Path $bureau 'Assistant IA.lnk'))
    $lnk.TargetPath = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe"
    $lnk.Arguments = "-STA -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$cible`" -Autonome"
    $lnk.WorkingDirectory = $dossier
    $lnk.Hotkey = 'CTRL+ALT+Q'
    $lnk.Description = 'Assistant IA : poser une question et entendre la reponse'
    $lnk.Save()
    Write-Host "Raccourci cree sur le Bureau : Assistant IA (touche : Ctrl+Alt+Q)."
    Write-Host "Vous pouvez des maintenant appuyer sur Ctrl+Alt+Q n'importe ou dans Windows."
} catch {
    Write-Host "ERREUR : $($_.Exception.Message)"
}
Read-Host "Appuyez sur Entree pour fermer"
