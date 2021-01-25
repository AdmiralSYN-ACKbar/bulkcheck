#GUI created with POSHGUI.com, a free online PowerShell GUI tool.

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$bulkChecker                     = New-Object system.Windows.Forms.Form
$bulkChecker.ClientSize          = New-Object System.Drawing.Point(433,722)
$bulkChecker.text                = "AbuseIPDB Bulk Checker"
$bulkChecker.TopMost             = $false

$APIKeyLabel                     = New-Object system.Windows.Forms.Label
$APIKeyLabel.text                = "API Key"
$APIKeyLabel.AutoSize            = $true
$APIKeyLabel.width               = 25
$APIKeyLabel.height              = 10
$APIKeyLabel.location            = New-Object System.Drawing.Point(28,140)
$APIKeyLabel.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$InputFilePathLabel              = New-Object system.Windows.Forms.Label
$InputFilePathLabel.text         = "CSV Input File Path / Name"
$InputFilePathLabel.AutoSize     = $true
$InputFilePathLabel.width        = 25
$InputFilePathLabel.height       = 10
$InputFilePathLabel.location     = New-Object System.Drawing.Point(25,196)
$InputFilePathLabel.Font         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$csvPathTextBox                  = New-Object system.Windows.Forms.TextBox
$csvPathTextBox.multiline        = $false
$csvPathTextBox.width            = 224
$csvPathTextBox.height           = 20
$csvPathTextBox.location         = New-Object System.Drawing.Point(22,221)
$csvPathTextBox.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$browseCsvPath                   = New-Object system.Windows.Forms.Button
$browseCsvPath.text              = "Browse"
$browseCsvPath.width             = 60
$browseCsvPath.height            = 30
$browseCsvPath.location          = New-Object System.Drawing.Point(263,216)
$browseCsvPath.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$exportPathLabel                 = New-Object system.Windows.Forms.Label
$exportPathLabel.text            = "CSV Export File Path / Name"
$exportPathLabel.AutoSize        = $true
$exportPathLabel.width           = 25
$exportPathLabel.height          = 10
$exportPathLabel.location        = New-Object System.Drawing.Point(23,265)
$exportPathLabel.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$exportPathTextBox               = New-Object system.Windows.Forms.TextBox
$exportPathTextBox.multiline     = $false
$exportPathTextBox.width         = 225
$exportPathTextBox.height        = 20
$exportPathTextBox.location      = New-Object System.Drawing.Point(23,287)
$exportPathTextBox.Font          = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$browseExportPath                = New-Object system.Windows.Forms.Button
$browseExportPath.text           = "Browse"
$browseExportPath.width          = 60
$browseExportPath.height         = 30
$browseExportPath.location       = New-Object System.Drawing.Point(263,282)
$browseExportPath.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$AbuseIPDBLink                   = New-Object system.Windows.Forms.Button
$AbuseIPDBLink.text              = "No key? Click here!"
$AbuseIPDBLink.width             = 132
$AbuseIPDBLink.height            = 36
$AbuseIPDBLink.location          = New-Object System.Drawing.Point(264,153)
$AbuseIPDBLink.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$outputLabel                     = New-Object system.Windows.Forms.Label
$outputLabel.text                = "Output"
$outputLabel.AutoSize            = $true
$outputLabel.width               = 25
$outputLabel.height              = 10
$outputLabel.location            = New-Object System.Drawing.Point(163,399)
$outputLabel.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',16)

$inputLabel                      = New-Object system.Windows.Forms.Label
$inputLabel.text                 = "Input"
$inputLabel.AutoSize             = $true
$inputLabel.width                = 25
$inputLabel.height               = 10
$inputLabel.location             = New-Object System.Drawing.Point(170,103)
$inputLabel.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',16)

$topTitle                        = New-Object system.Windows.Forms.Label
$topTitle.text                   = "AbuseIPDB Bulk Checker"
$topTitle.AutoSize               = $true
$topTitle.width                  = 25
$topTitle.height                 = 10
$topTitle.location               = New-Object System.Drawing.Point(78,51)
$topTitle.Font                   = New-Object System.Drawing.Font('Sylfaen',18,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Admiral SYN-ACKbar`'s"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(112,22)
$Label1.Font                     = New-Object System.Drawing.Font('Jokerman',12,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Italic))

$ToolTip2                        = New-Object system.Windows.Forms.ToolTip
$ToolTip2.ToolTipTitle           = "Unleash the bulk check"
$ToolTip2.isBalloon              = $false

$outputBox                       = New-Object system.Windows.Forms.TextBox
$outputBox.multiline             = $true
$outputBox.width                 = 371
$outputBox.height                = 130
$outputBox.enabled               = $false
$outputBox.location              = New-Object System.Drawing.Point(8,518)
$outputBox.Font                  = New-Object System.Drawing.Font('Lucida Console',10)
$outputBox.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$outputProgress                  = New-Object system.Windows.Forms.ProgressBar
$outputProgress.width            = 370
$outputProgress.height           = 30
$outputProgress.location         = New-Object System.Drawing.Point(10,438)

$currentIPBox                    = New-Object system.Windows.Forms.TextBox
$currentIPBox.multiline          = $false
$currentIPBox.width              = 222
$currentIPBox.height             = 20
$currentIPBox.visible            = $true
$currentIPBox.enabled            = $false
$currentIPBox.location           = New-Object System.Drawing.Point(11,477)
$currentIPBox.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$apiKeyTextBox                   = New-Object system.Windows.Forms.MaskedTextBox
$apiKeyTextBox.multiline         = $false
$apiKeyTextBox.width             = 226
$apiKeyTextBox.height            = 20
$apiKeyTextBox.location          = New-Object System.Drawing.Point(23,160)
$apiKeyTextBox.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$bulkCheck                       = New-Object system.Windows.Forms.Button
$bulkCheck.text                  = "ENGAGE"
$bulkCheck.width                 = 175
$bulkCheck.height                = 41
$bulkCheck.location              = New-Object System.Drawing.Point(107,338)
$bulkCheck.Font                  = New-Object System.Drawing.Font('Franklin Gothic Book',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$bulkCheck.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#d0021b")

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "RUN AWAY"
$Button1.width                   = 168
$Button1.height                  = 45
$Button1.location                = New-Object System.Drawing.Point(105,661)
$Button1.Font                    = New-Object System.Drawing.Font('Franklin Gothic Book',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$Button1.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#0040f2")

$ToolTip2.SetToolTip($bulkCheck,'')
$bulkChecker.controls.AddRange(@($APIKeyLabel,$InputFilePathLabel,$csvPathTextBox,$browseCsvPath,$exportPathLabel,$exportPathTextBox,$browseExportPath,$AbuseIPDBLink,$outputLabel,$inputLabel,$topTitle,$Label1,$outputBox,$outputProgress,$currentIPBox,$apiKeyTextBox,$bulkCheck,$Button1))

$bulkCheck.Add_Click({ bulkCheck })
$browseCsvPath.Add_Click({ getCsvPath })
$browseExportPath.Add_Click({ ExportPathRoot })
$AbuseIPDBLink.Add_Click({ keyLogin })
$Button1.Add_Click({ exitProgram })

#End of PoshGUI auto-config

$apiKeyTextBox.PasswordChar = '*' #Not definable in PoshGUI auto-config

#Function Definitions

function clearOutputFile {
    $fileExists=Test-Path -Path $exportPath #returns true/false based on if export file already exists
    if ( $fileExists -eq 'True') #Clears
    {
        Remove-Item -Path $exportPath     
    }
}

function setApiKey #sets API key to input box value
{
    $global:apiKey = $apiKeyTextBox.Text
}

function getCsvName #Browse functionality for input path
{
     $csvFileDialog = New-Object System.Windows.Forms.OpenFileDialog
     $csvFileDialog.initialDirectory = $initialDirectoryry
     $csvFileDialog.filter = "CSV (*.CSV)| *.CSV"
     $csvFileDialog.ShowDialog() | Out-Null
     $csvFileDialog.filename
}

function getCsvPath
{
     $csvPathTextBox.Text = getCsvName -initialDirectory $csvPathTextBox.Text
}


function setCsvPath #Sets CSV Path variable to input box value
{ 
    $global:csvPath= $csvPathTextBox.Text
    $global:ipTotal= (Get-Content $csvPath).Length #Total number of IPs to check

}

function setExportPath #Sets Export Path variable to input box value
{
     $global:exportPath= $exportPathTextBox.text

}

function ExportPathRoot
{
    $ExportPathTextBox.Text = Get-Folder
}

function Get-Folder
{
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

function keyLogin #Open browser window to AbuseIPDB account registration where API can be generated
{
    Start-Process "https://www.abuseipdb.com/account/api"
    
}

function clearOutputBox #Clear output box and line count
{
    $global:lineCount=1
    $outputBox.Text=""
}

function setProgressBar #Sets up the progress bar in output
{
    $outputProgress.Maximum = $ipTotal
    $outputProgress.Step = 1
    $outputProgress.Value = 1
}

function outputText #Bottom output text box
{
    $outputBox.Text += "Checking $lineCount of $ipTotal IP addresses `r`n"
}

function showProgressBar #Shows progress bar and text directly below
{
    $outputProgress.PerformStep()
    $currentIPBox.Text = "Checking $lineCount of $ipTotal IP addresses"
}

function startOutput #Initial timestamp and output
{
    $global:startTime=Get-Date -format HH:mm:ss
    $outputBox.Text = "Started check of $ipTotal IPs at $startTime `r`n"
}

function endOutput #Post-check output and statistics
{
    $endTime=Get-Date -format HH:mm:ss
    $outputBox.Text += "Completed check at $endTime `r`n"
    $global:timeElapsed = New-Timespan -Start $startTime -End $endTime
    $global:timeElapsedMinutes = $timeElapsed.Minutes
    $global:timeElapsedSeconds = $timeElapsed.Seconds
    $global:timePerIP = [math]::Round(($timeElapsedSeconds / $ipTotal), 2)
    $outputBox.Text += "Time elapsed was $timeElapsedMinutes minutes and $timeElapsedSeconds seconds `r`n"
    $outputBox.Text += "Average time per IP checked was $timePerIP seconds `r`n `r`n"
    $outputBox.Text += "The Admiralty commends you for your efforts!"
}

function exitProgram #Run Away button functionality
{
    $bulkChecker.close()
}

#Program Execution
function bulkCheck {
    $jsonTempPath= New-TemporaryFile #Results are initially returned as JSON, stored in temporary file
    setApiKey
    setCsvPath
    setExportPath
    clearOutputFile
    clearOutputBox
    setProgressBar
    startOutput
    Import-csv $csvPath -Header "IP" | ForEach { #Import input file and loop through each line
    Invoke-WebRequest -Uri ("https://api.abuseipdb.com/api/v2/check?ipAddress=$($_.IP)") -Headers @{'Accept' = 'application/json'; 'Key' = $ApiKey} -usebasicparsing | add-content -path $jsonTempPath #Execute check on each IP
    showProgressBar #Increments Progress Bar
    $lineCount++ #Increment statistic
    }
    endOutput #Show end output and statistics
    Get-content $jsonTempPath | ConvertFrom-Json | select -ExpandProperty Data | select ipAddress, abuseConfidenceScore, isp, domain, countryCode, totalReports, lastReportedAt | ConvertTo-CSV -NoTypeInformation | add-content $exportPath #Create CSV output file       
    Remove-Item $jsonTempPath.FullName -Force #Remove temp file       
}
[void]$bulkChecker.ShowDialog() #Close WinForms