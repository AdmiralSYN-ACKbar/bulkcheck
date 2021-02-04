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
    Import-csv $csvPath -Header "IP" | ForEach {
        if($_.IP -as [ipAddress] -as [Bool]) { # Check if it's an IP Address
            Invoke-WebRequest -Uri ("https://api.abuseipdb.com/api/v2/check?ipAddress=$($_.IP)") -Headers @{'Accept' = 'application/json'; 'Key' = $ApiKey} -usebasicparsing | add-content -path $jsonTempPath
        } else {
            throw "$($_.IP) is not a valid IP!" # Throw an error showing which IP is invalid
        }
        showProgressBar
        $global:lineCount++
        }
    endOutput #Show end output and statistics
    Get-content $jsonTempPath | ConvertFrom-Json | select -ExpandProperty Data | select ipAddress, abuseConfidenceScore, isp, domain, countryCode, totalReports, lastReportedAt | ConvertTo-CSV -NoTypeInformation | add-content $exportPath #Create CSV output file       
    Remove-Item $jsonTempPath.FullName -Force #Remove temp file       
}
[void]$bulkChecker.ShowDialog() #Close WinForms
# SIG # Begin signature block
# MIITmQYJKoZIhvcNAQcCoIITijCCE4YCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUGxn2uwHSUZWW1Cj9SqX66Dij
# 6NygghDRMIIFTzCCBDegAwIBAgIQAwPpYPcjB+z3EBRLi8GwRzANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
# MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxJDAi
# BgNVBAMTG1NlY3RpZ28gUlNBIENvZGUgU2lnbmluZyBDQTAeFw0yMTAyMDIwMDAw
# MDBaFw0yMjAyMDIyMzU5NTlaMIGMMQswCQYDVQQGEwJVUzEOMAwGA1UEEQwFOTg5
# MjYxEzARBgNVBAgMCldhc2hpbmd0b24xEzARBgNVBAcMCkVsbGVuc2J1cmcxFzAV
# BgNVBAkMDjUgVmlld3BvaW50IFJkMRQwEgYDVQQKDAtTdGV2ZW4gTG9lYjEUMBIG
# A1UEAwwLU3RldmVuIExvZWIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCiXJCdMufDBPyyJajRCIUJonxUdLd+7bSQNz1l/p20LeR7yWOBfpCXIOno/zgy
# PMJ0QMbADuxbsj4U5H2wA3e4Kx4oSJekq4lyNEECrRlbpykwMwj4wL2D9SLUQu76
# P6mYCoTZZe6FDBn9BQtY5tf1y6VHcXy3x2bGPaAzIdBkIAMjhg6kys1nUX10dzH3
# TN7ny/KeJ4xlTgjTvteUDOFKhOJkPQF0bj2jLzTgeIsWMdRSbcoKtZ/u5aR5lGwm
# tIHg/ZCa339DQC4N7zvPNJ2A9g3LIM87Chjmv/lCmDnz5n0SLQcPHZXHScWvjdwC
# AqtFXH21Da1MXs1+JJ8kjOvZAgMBAAGjggG6MIIBtjAfBgNVHSMEGDAWgBQO4Tqo
# Uzox1Yq+wbutZxoDha00DjAdBgNVHQ4EFgQUoYidDbnjPB5g6DDsvu0EZD9o3N4w
# DgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUH
# AwMwEQYJYIZIAYb4QgEBBAQDAgQQMEoGA1UdIARDMEEwNQYMKwYBBAGyMQECAQMC
# MCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMAgGBmeBDAEE
# ATBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
# Z29SU0FDb2RlU2lnbmluZ0NBLmNybDBzBggrBgEFBQcBAQRnMGUwPgYIKwYBBQUH
# MAKGMmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNvZGVTaWduaW5n
# Q0EuY3J0MCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTAoBgNV
# HREEITAfgR1hZG1pcmFsQGFkbWlyYWxzeW4tYWNrYmFyLmNvbTANBgkqhkiG9w0B
# AQsFAAOCAQEAZ4TPT0M0ltEm8uvaj6BdJIzwHWVHxL4CcIfdDvuU87qZ/gH4sopd
# xYX2S0qJJXV+q1JqkrlI8l6AiklsryftO3KRTdo764gERkK0cKHDHDvImXwVU/KE
# x+Aoq38vqgMVsuyznQLwANypoHFTNu4iq24X+vm88gexDuSS4MF4f6fPh0Vjf897
# VMoQl+NNO65GZrEehk46v8DxIkeNZ5mSfrnV9pLgvuzMK9dvdTbp9mE2u5NoRQOO
# l2bWIEcfwsZJQnYITlBrLSVmVdAGpQGsi/oDJLxIdJD4YLUfUlwoNy/J858FWmEB
# SiUppi5xgQnEvP/ori41gs/phybVU9NucTCCBYEwggRpoAMCAQICEDlyRDr5IrdR
# 19NsEN0xNZUwDQYJKoZIhvcNAQEMBQAwezELMAkGA1UEBhMCR0IxGzAZBgNVBAgM
# EkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBwwHU2FsZm9yZDEaMBgGA1UECgwR
# Q29tb2RvIENBIExpbWl0ZWQxITAfBgNVBAMMGEFBQSBDZXJ0aWZpY2F0ZSBTZXJ2
# aWNlczAeFw0xOTAzMTIwMDAwMDBaFw0yODEyMzEyMzU5NTlaMIGIMQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkx
# HjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRy
# dXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTCCAiIwDQYJKoZIhvcNAQEB
# BQADggIPADCCAgoCggIBAIASZRc2DsPbCLPQrFcNdu3NJ9NMrVCDYeKqIE0JLWQJ
# 3M6Jn8w9qez2z8Hc8dOx1ns3KBErR9o5xrw6GbRfpr19naNjQrZ28qk7K5H44m/Q
# 7BYgkAk+4uh0yRi0kdRiZNt/owbxiBhqkCI8vP4T8IcUe/bkH47U5FHGEWdGCFHL
# hhRUP7wz/n5snP8WnRi9UY41pqdmyHJn2yFmsdSbeAPAUDrozPDcvJ5M/q8FljUf
# V1q3/875PbcstvZU3cjnEjpNrkyKt1yatLcgPcp/IjSufjtoZgFE5wFORlObM2D3
# lL5TN5BzQ/Myw1Pv26r+dE5px2uMYJPexMcM3+EyrsyTO1F4lWeL7j1W/gzQaQ8b
# D/MlJmszbfduR/pzQ+V+DqVmsSl8MoRjVYnEDcGTVDAZE6zTfTen6106bDVc20HX
# EtqpSQvf2ICKCZNijrVmzyWIzYS4sT+kOQ/ZAp7rEkyVfPNrBaleFoPMuGfi6BOd
# zFuC00yz7Vv/3uVzrCM7LQC/NVV0CUnYSVgaf5I25lGSDvMmfRxNF7zJ7EMm0L9B
# X0CpRET0medXh55QH1dUqD79dGMvsVBlCeZYQi5DGky08CVHWfoEHpPUJkZKUIGy
# 3r54t/xnFeHJV4QeD2PW6WK61l9VLupcxigIBCU5uA4rqfJMlxwHPw1S9e3vL4IP
# AgMBAAGjgfIwge8wHwYDVR0jBBgwFoAUoBEKIz6W8Qfs4q8p74Klf9AwpLQwHQYD
# VR0OBBYEFFN5v1qqK0rPVIDh2JvAnfKyA2bLMA4GA1UdDwEB/wQEAwIBhjAPBgNV
# HRMBAf8EBTADAQH/MBEGA1UdIAQKMAgwBgYEVR0gADBDBgNVHR8EPDA6MDigNqA0
# hjJodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9BQUFDZXJ0aWZpY2F0ZVNlcnZpY2Vz
# LmNybDA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNv
# bW9kb2NhLmNvbTANBgkqhkiG9w0BAQwFAAOCAQEAGIdR3HQhPZyK4Ce3M9AuzOzw
# 5steEd4ib5t1jp5y/uTW/qofnJYt7wNKfq70jW9yPEM7wD/ruN9cqqnGrvL82O6j
# e0P2hjZ8FODN9Pc//t64tIrwkZb+/UNkfv3M0gGhfX34GRnJQisTv1iLuqSiZgR2
# iJFODIkUzqJNyTKzuugUGrxx8VvwQQuYAAoiAxDlDLH5zZI3Ge078eQ6tvlFEyZ1
# r7uq7z97dzvSxAKRPRkA0xdcOds/exgNRc2ThZYvXd9ZFk8/Ub3VRRg/7UqO6AZh
# dCMWtQ1QcydER38QXYkqa4UxFMToqWpMgLxqeM+4f452cpkMnf7XkQgWoaNflTCC
# BfUwggPdoAMCAQICEB2iSDBvmyYY0ILgln0z02owDQYJKoZIhvcNAQEMBQAwgYgx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJz
# ZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
# EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTE4MTEw
# MjAwMDAwMFoXDTMwMTIzMTIzNTk1OVowfDELMAkGA1UEBhMCR0IxGzAZBgNVBAgT
# EkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMP
# U2VjdGlnbyBMaW1pdGVkMSQwIgYDVQQDExtTZWN0aWdvIFJTQSBDb2RlIFNpZ25p
# bmcgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCGIo0yhXoYn0nw
# li9jCB4t3HyfFM/jJrYlZilAhlRGdDFixRDtsocnppnLlTDAVvWkdcapDlBipVGR
# EGrgS2Ku/fD4GKyn/+4uMyD6DBmJqGx7rQDDYaHcaWVtH24nlteXUYam9CflfGqL
# lR5bYNV+1xaSnAAvaPeX7Wpyvjg7Y96Pv25MQV0SIAhZ6DnNj9LWzwa0VwW2TqE+
# V2sfmLzEYtYbC43HZhtKn52BxHJAteJf7wtF/6POF6YtVbC3sLxUap28jVZTxvC6
# eVBJLPcDuf4vZTXyIuosB69G2flGHNyMfHEo8/6nxhTdVZFuihEN3wYklX0Pp6F8
# OtqGNWHTAgMBAAGjggFkMIIBYDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3y
# sgNmyzAdBgNVHQ4EFgQUDuE6qFM6MdWKvsG7rWcaA4WtNA4wDgYDVR0PAQH/BAQD
# AgGGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwMGCCsG
# AQUFBwMIMBEGA1UdIAQKMAgwBgYEVR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRw
# Oi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNBQ2VydGlmaWNhdGlvbkF1
# dGhvcml0eS5jcmwwdgYIKwYBBQUHAQEEajBoMD8GCCsGAQUFBzAChjNodHRwOi8v
# Y3J0LnVzZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNBQWRkVHJ1c3RDQS5jcnQwJQYI
# KwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVzdC5jb20wDQYJKoZIhvcNAQEM
# BQADggIBAE1jUO1HNEphpNveaiqMm/EAAB4dYns61zLC9rPgY7P7YQCImhttEAcE
# T7646ol4IusPRuzzRl5ARokS9At3WpwqQTr81vTr5/cVlTPDoYMot94v5JT3hTOD
# LUpASL+awk9KsY8k9LOBN9O3ZLCmI2pZaFJCX/8E6+F0ZXkI9amT3mtxQJmWunjx
# ucjiwwgWsatjWsgVgG10Xkp1fqW4w2y1z99KeYdcx0BNYzX2MNPPtQoOCwR/oEuu
# u6Ol0IQAkz5TXTSlADVpbL6fICUQDRn7UJBhvjmPeo5N9p8OHv4HURJmgyYZSJXO
# SsnBf/M6BZv5b9+If8AjntIeQ3pFMcGcTanwWbJZGehqjSkEAnd8S0vNcL46slVa
# eD68u28DECV3FTSK+TbMQ5Lkuk/xYpMoJVcp+1EZx6ElQGqEV8aynbG8HArafGd+
# fS7pKEwYfsR7MUFxmksp7As9V1DSyt39ngVR5UR43QHesXWYDVQk/fBO4+L4g71y
# uss9Ou7wXheSaG3IYfmm8SoKC6W59J7umDIFhZ7r+YMp08Ysfb06dy6LN0KgaoLt
# O0qqlBCk4Q34F8W2WnkzGJLjtXX4oemOCiUe5B7xn1qHI/+fpFGe+zmAEc3btcSn
# qIBv5VPU4OOiwtJbGvoyJi1qV3AcPKRYLqPzW0sH3DJZ84enGm1YMYICMjCCAi4C
# AQEwgZAwfDELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3Rl
# cjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSQw
# IgYDVQQDExtTZWN0aWdvIFJTQSBDb2RlIFNpZ25pbmcgQ0ECEAMD6WD3Iwfs9xAU
# S4vBsEcwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJ
# KoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQB
# gjcCARUwIwYJKoZIhvcNAQkEMRYEFBGIAFvR8+7KMwR4Yl7XnuAiZCjyMA0GCSqG
# SIb3DQEBAQUABIIBAFJ48WPOY8SoxogpoZOktq006t8QrqS7ThO3D3fNOrJcKmYL
# KY+z/d+n6yH9MadRFtttjzz3yGz7QCRNiwfM6wZAzD4k61EQoUlzMj3dj0RHVu+I
# /SbIec8pBTLz5t26H6bkbpWtAsH8d72gctcqpPxBnzoE08v0z89xkFbB8Yqh8fHu
# sCj5+77rl/2zIAhrKGUlwKyPDKrKQFReJV57Wtr+cO/ZWiP/IMswzh+GLOqzr/P9
# pL/Qcq/DzdvYiJIp3fVDM8Avgd9vMj76eu7j4/1x70iWagillQ507RNAECVpJhVM
# mSH+8/MsDezGZBrOOxwJTcayNHt7xz1mTkBKKyU=
# SIG # End signature block
