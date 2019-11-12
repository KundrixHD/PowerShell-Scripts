

# Erstellen des Arrays mit den gewünschten Zeichen für das Passwort            
    $meinpw = @()            
    $meinpw += [char[]]([char]65..[char]90) # Grossbuchstaben            
    $meinpw += [char[]]([char]97..[char]122) # Kleinbuchstaben                       
    $meinpw += [char[]]([char]33..[char]38) # Sonderzeichen 1            
    $meinpw += [char[]]([char]40..[char]47) # Sonderzeichen 2            
            
# Abfrage in der Konsole wieviele Zeichen das Passwort haben soll            
[int]$anzahl = Read-Host -Prompt "Wieviele Zeichen möchtest du haben? {min 8}" 
if ($anzahl += 8) {$anzahl = 8}

$confirmation = Read-Host "Sollen Zahlen in deinem Passwort sein:"
if ($confirmation -eq 'y') {
    $meinpw += 0..9
    } 

$confirmation = Read-Host "Sollen Sonderzeichen in deinem Passwort sein:"
if ($confirmation -eq 'y') {
    $meinpw += [char[]]([char]33..[char]38)  
    $meinpw += [char[]]([char]40..[char]47) 
    } # Zahlen
            
# Runden der Abfrage auf 0 Dezimalstellen            
$anzahl = [math]::Round($anzahl,0)            
            
# Generieren des Passwortes mit Get-Random            
$pwausgabe = (Get-Random -InputObject $meinpw -Count $anzahl) -join ""            
            
# Ausgabe des Passwortes und der Länge            
Write-Host $pwausgabe " >> Hat " $pwausgabe.Length " Zeichen"            
            
# Kopieren des Passwortes in die Zwischenablage            
$pwausgabe | clip
read-host
