# Database Name
$databaseName = Read-Host -Prompt "Please enter the name of the database"

# Mailboxes List
$mailboxes = Get-Mailbox -Database $databaseName -ResultSize Unlimited

# Mailbox Information
$mailboxInfos = @()

$totalDbSizeGB = 0
$maxDbSizeGB = 200
$maxMailboxSizeGB = 40
$dbCounter = 1

foreach($mailbox in $mailboxes)
{
    # Mailbox Size GB
    $mailboxSize = (Get-MailboxStatistics $mailbox).TotalItemSize.Value.ToGB()

    
    $totalDbSizeGB += $mailboxSize

    # Databases 200GB 
    if ($totalDbSizeGB -gt $maxDbSizeGB) {
        $dbCounter++
        $totalDbSizeGB = $mailboxSize 
    }

    # For mailboxes larger than 40GB, distribute the DBS evenly
    if ($mailboxSize -gt $maxMailboxSizeGB) {
        $dbCounter++
        $totalDbSizeGB = $mailboxSize 
    }

    # Create a new object with the email address, mailbox size, and database name
    $mailboxInfo = New-Object PSObject -Property @{
        EmailAddress = $mailbox.PrimarySmtpAddress
        MailboxSizeGB = $mailboxSize
        TargetDatabaseName = "DB{0:D2}" -f $dbCounter
    }

    # Add mailbox information to the list October
    $mailboxInfos += $mailboxInfo
}

# CSV
$mailboxInfos | Export-Csv -Path "C:\mailboxReport.csv" -NoTypeInformation -UseCulture
