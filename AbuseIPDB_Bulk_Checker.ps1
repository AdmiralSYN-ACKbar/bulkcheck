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
$browseCsvPath.width             = 70
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
$browseExportPath.width          = 70
$browseExportPath.height         = 30
$browseExportPath.location       = New-Object System.Drawing.Point(263,282)
$browseExportPath.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$AbuseIPDBLink                   = New-Object system.Windows.Forms.Button
$AbuseIPDBLink.text              = "No key? Click here"
$AbuseIPDBLink.width             = 160
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

$bulkCheck.Add_Click({ validate })
$browseCsvPath.Add_Click({ getCsvPath })
$browseExportPath.Add_Click({ ExportPathRoot })
$AbuseIPDBLink.Add_Click({ keyLogin })
$Button1.Add_Click({ exitProgram })

#End of PoshGUI auto-config

$apiKeyTextBox.PasswordChar = '*' #Not definable in PoshGUI auto-config

#Function Definitions

function clearOutputFile {
    $fileExists=Test-Path -Path $exportPath #returns true/false based on if export file already exists
    if ( $fileExists -eq 'True')
    {
		Add-Type -AssemblyName PresentationCore,PresentationFramework
        $ButtonType = [System.Windows.MessageBoxButton]::OK
		$MessageIcon = [System.Windows.MessageBoxImage]::Error
		$MessageBody = "Error, please enter a file path where nothing exists"
		$MessageTitle = "Error"    
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
	$global:exportPath = $exportPathTextBox.text
	
	
}

function validate
{
	$global:exportPath = $exportPathTextBox.text
	$fileExists = Test-Path -Path $exportPath #returns true/false based on if export file already exists
	$isFolder = Test-Path -Path $exportPath -PathType Container #returns if path is a folder
	if ($isFolder -eq 'True')
	{
		[void][System.Windows.Forms.MessageBox]::Show('Please specify file path as well as folder path', 'Error')
		$bulkChecker.Update()
	}
	elseif ($fileExists -eq 'True')
	{
		#Add-Type -AssemblyName "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
		[void][System.Windows.Forms.MessageBox]::Show('File exists at path, please re-enter file path', 'Error')
		$bulkChecker.Update()
	}
	else
	{
		bulkCheck
	}
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
	setExportPath
	setApiKey
    setCsvPath
    #clearOutputFile
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
# MIIwowYJKoZIhvcNAQcCoIIwlDCCMJACAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDp2QJak/uYevyL
# IlkYxgHLtS1epUL/yFOM/dnVWgNcq6CCKnswggNfMIICR6ADAgECAgsEAAAAAAEh
# WFMIojANBgkqhkiG9w0BAQsFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3Qg
# Q0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2ln
# bjAeFw0wOTAzMTgxMDAwMDBaFw0yOTAzMTgxMDAwMDBaMEwxIDAeBgNVBAsTF0ds
# b2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYD
# VQQDEwpHbG9iYWxTaWduMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
# zCV2kHkGeCIW9cCDtoTKKJ79BXYRxa2IcvxGAkPHsoqdBF8kyy5L4WCCRuFSqwyB
# R3Bs3WTR6/Usow+CPQwrrpfXthSGEHm7OxOAd4wI4UnSamIvH176lmjfiSeVOJ8G
# 1z7JyyZZDXPesMjpJg6DFcbvW4vSBGDKSaYo9mk79svIKJHlnYphVzesdBTcdOA6
# 7nIvLpz70Lu/9T0A4QYz6IIrrlOmOhZzjN1BDiA6wLSnoemyT5AuMmDpV8u5BJJo
# aOU4JmB1sp93/5EU764gSfytQBVI0QIxYRleuJfvrXe3ZJp6v1/BE++bYvsNbOBU
# aRapA9pu6YOTcXbGaYWCFwIDAQABo0IwQDAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0T
# AQH/BAUwAwEB/zAdBgNVHQ4EFgQUj/BLf6guRSSuTVD6Y5qL3uLdG7wwDQYJKoZI
# hvcNAQELBQADggEBAEtA28BQqv7IDO/3llRFSbuWAAlBrLMThoYoBzPKa+Z0uboA
# La6kCtP18fEPir9zZ0qDx0R7eOCvbmxvAymOMzlFw47kuVdsqvwSluxTxi3kJGy5
# lGP73FNoZ1Y+g7jPNSHDyWj+ztrCU6rMkIrp8F1GjJXdelgoGi8d3s0AN0GP7URt
# 11Mol37zZwQeFdeKlrTT3kwnpEwbc3N29BeZwh96DuMtCK0KHCz/PKtVDg+Rfjbr
# w1dJvuEuLXxgi8NBURMjnc73MmuUAaiZ5ywzHzo7JdKGQM47LIZ4yWEvFLru21Vv
# 34TuBQlNvSjYcs7TYlBlHuuSl4Mx2bO1ykdYP18wggQyMIIDGqADAgECAgEBMA0G
# CSqGSIb3DQEBBQUAMHsxCzAJBgNVBAYTAkdCMRswGQYDVQQIDBJHcmVhdGVyIE1h
# bmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAYBgNVBAoMEUNvbW9kbyBDQSBM
# aW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2VydmljZXMwHhcNMDQw
# MTAxMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjB7MQswCQYDVQQGEwJHQjEbMBkGA1UE
# CAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdTYWxmb3JkMRowGAYDVQQK
# DBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRpZmljYXRlIFNl
# cnZpY2VzMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvkCd9G7h6naH
# HE1FRI6+RsiDBp3BKv4YH47kAvrzq11QihYxC5oG0MVwIs1JLVRjzLZuaEYLU+rL
# TCTAvHJO6vEVrvRUmhIKw3qyM2Di2olV8yJY897cz++DhqKMlE+faPKYkEaEJ8d2
# v+PMNSyLXgdkZYLASLCokflhn3YgUKiRx2a163hiA1bwihoT6jGjHqCZ/Tj29icy
# WG8H9Wu4+xQrr7eqzNZjX3OM2gWZqDioyxd4NlGs6Z70eDqNzw/ZQuKYDKsvnw4B
# 3u+fmUnxLd+sdE0bmLVHxeUp0fmQGMdinL6DxyZ7Poolx8DdneY1aBAgnY/Y3tLD
# hJwNXugvyQIDAQABo4HAMIG9MB0GA1UdDgQWBBSgEQojPpbxB+zirynvgqV/0DCk
# tDAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB/zB7BgNVHR8EdDByMDig
# NqA0hjJodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9BQUFDZXJ0aWZpY2F0ZVNlcnZp
# Y2VzLmNybDA2oDSgMoYwaHR0cDovL2NybC5jb21vZG8ubmV0L0FBQUNlcnRpZmlj
# YXRlU2VydmljZXMuY3JsMA0GCSqGSIb3DQEBBQUAA4IBAQAIVvwC8Jvo/6T61nvG
# RIDOT8TF9gBYzKa2vBRJaAR26ObuXewCD2DWjVAYTyZOAePmsKXuv7x0VEG//fwS
# uMdPWvSJYAV/YLcFSvP28cK/xLl0hrYtfWvM0vNG3S/G4GrDwzQDLH2W3VrCDqcK
# mcEFi6sML/NcOs9sN1UJh95TQGxY7/y2q2VuBPYb3DzgWhXGntnxWUgwIWUDbOzp
# IXPsmwOh4DetoBUYj/q6As6nLKkQEyzU5QgmqyKXYPiQXnTUoppTvfKpaOCibsLX
# bLGjD56/62jnVvKu8uMrODoJgbVrhde+Le0/GreyY+L1YiyC1GoAQVDxOYOflek2
# lphuMIIFRzCCBC+gAwIBAgINAfJAQkDO/SLb6Wxx/DANBgkqhkiG9w0BAQwFADBM
# MSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xv
# YmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xOTAyMjAwMDAwMDBaFw0y
# OTAzMTgxMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2
# MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIICIjAN
# BgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRFCyyC
# tEjG61s8roO4QZIzFKRvf+kqzMawiGvFtonRxrL/FM5RFCHsSt0bWsbWh+5NOhUG
# 7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5KE1SGooagLcZgQ5+xIq8ZEwh
# HENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ3+QPefXqoh8q
# 0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBhd8hY
# dLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw77Yc
# E1eTtt6y+OKFt3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5aC0fz
# BjZJdzC8cTflpuwhCHX85mEWP3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL6f7u
# j+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoRh3CBCqiadR2eOoYFAJ7bgNYl+dwF
# nidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sIScWVZBpjDnk99bOM
# ylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HUGie/
# Nx4yB9gUYzwoTK8CAwEAAaOCASYwggEiMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
# Af8EBTADAQH/MB0GA1UdDgQWBBSubAWjkxPioufi1xzWx/B/yGdToDAfBgNVHSME
# GDAWgBSP8Et/qC5FJK5NUPpjmove4t0bvDA+BggrBgEFBQcBAQQyMDAwLgYIKwYB
# BQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9iYWxzaWduLmNvbS9yb290cjMwNgYDVR0f
# BC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIzLmNy
# bDBHBgNVHSAEQDA+MDwGBFUdIAAwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cu
# Z2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQEMBQADggEBAEms
# XsWD81rLYSpNl0oVKZ/kFJCqCfnEep81GIoKMxVtcociTkE/bQqeGK7b4l/8ldEs
# mBQ7jsHwNll5842Bz3T2GKTk4WjP739lWULpylU5vNPFJu5xOPrXIQMPt07ZW2Bq
# Q7R9CdBgYd2q7QBeTjIe4LJsnjyywruY05B2ammtGtyoidpYT9LCizJKzlT7OOk7
# Bwt1ChHbC3wlJ/GsJs8RU+bcxuJhNTL0zt2D4xk668Joo3IAyCQ8TrhTPLEXq+Y1
# LPnTQinmX2ADrEJhprFXajNC3zUxhso+NyvaxNok9U4S8ra5t0fquyCtYRa3oDPj
# LYmnvLM8AX8jGoAJNOkwggVPMIIEN6ADAgECAhADA+lg9yMH7PcQFEuLwbBHMA0G
# CSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1h
# bmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
# aXRlZDEkMCIGA1UEAxMbU2VjdGlnbyBSU0EgQ29kZSBTaWduaW5nIENBMB4XDTIx
# MDIwMjAwMDAwMFoXDTIyMDIwMjIzNTk1OVowgYwxCzAJBgNVBAYTAlVTMQ4wDAYD
# VQQRDAU5ODkyNjETMBEGA1UECAwKV2FzaGluZ3RvbjETMBEGA1UEBwwKRWxsZW5z
# YnVyZzEXMBUGA1UECQwONSBWaWV3cG9pbnQgUmQxFDASBgNVBAoMC1N0ZXZlbiBM
# b2ViMRQwEgYDVQQDDAtTdGV2ZW4gTG9lYjCCASIwDQYJKoZIhvcNAQEBBQADggEP
# ADCCAQoCggEBAKJckJ0y58ME/LIlqNEIhQmifFR0t37ttJA3PWX+nbQt5HvJY4F+
# kJcg6ej/ODI8wnRAxsAO7FuyPhTkfbADd7grHihIl6SriXI0QQKtGVunKTAzCPjA
# vYP1ItRC7vo/qZgKhNll7oUMGf0FC1jm1/XLpUdxfLfHZsY9oDMh0GQgAyOGDqTK
# zWdRfXR3MfdM3ufL8p4njGVOCNO+15QM4UqE4mQ9AXRuPaMvNOB4ixYx1FJtygq1
# n+7lpHmUbCa0geD9kJrff0NALg3vO880nYD2DcsgzzsKGOa/+UKYOfPmfRItBw8d
# lcdJxa+N3AICq0VcfbUNrUxezX4knySM69kCAwEAAaOCAbowggG2MB8GA1UdIwQY
# MBaAFA7hOqhTOjHVir7Bu61nGgOFrTQOMB0GA1UdDgQWBBShiJ0NueM8HmDoMOy+
# 7QRkP2jc3jAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADATBgNVHSUEDDAK
# BggrBgEFBQcDAzARBglghkgBhvhCAQEEBAMCBBAwSgYDVR0gBEMwQTA1BgwrBgEE
# AbIxAQIBAwIwJTAjBggrBgEFBQcCARYXaHR0cHM6Ly9zZWN0aWdvLmNvbS9DUFMw
# CAYGZ4EMAQQBMEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuc2VjdGlnby5j
# b20vU2VjdGlnb1JTQUNvZGVTaWduaW5nQ0EuY3JsMHMGCCsGAQUFBwEBBGcwZTA+
# BggrBgEFBQcwAoYyaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ29k
# ZVNpZ25pbmdDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28u
# Y29tMCgGA1UdEQQhMB+BHWFkbWlyYWxAYWRtaXJhbHN5bi1hY2tiYXIuY29tMA0G
# CSqGSIb3DQEBCwUAA4IBAQBnhM9PQzSW0Sby69qPoF0kjPAdZUfEvgJwh90O+5Tz
# upn+Afiyil3FhfZLSokldX6rUmqSuUjyXoCKSWyvJ+07cpFN2jvriARGQrRwocMc
# O8iZfBVT8oTH4Cirfy+qAxWy7LOdAvAA3KmgcVM27iKrbhf6+bzyB7EO5JLgwXh/
# p8+HRWN/z3tUyhCX4007rkZmsR6GTjq/wPEiR41nmZJ+udX2kuC+7Mwr1291Nun2
# YTa7k2hFA46XZtYgRx/CxklCdghOUGstJWZV0AalAayL+gMkvEh0kPhgtR9SXCg3
# L8nznwVaYQFKJSmmLnGBCcS8/+iuLjWCz+mHJtVT025xMIIFgTCCBGmgAwIBAgIQ
# OXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7MQswCQYDVQQGEwJHQjEb
# MBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdTYWxmb3JkMRow
# GAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRpZmlj
# YXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJz
# ZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
# EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkq
# hkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh
# 4qogTQktZAnczomfzD2p7PbPwdzx07HWezcoEStH2jnGvDoZtF+mvX2do2NCtnby
# qTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQIjy8/hPwhxR79uQfjtTk
# UcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4A8BQOujM8Ny8
# nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hmAUTn
# AU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vu
# PVb+DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6fr
# XTpsNVzbQdcS2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4W
# g8y4Z+LoE53MW4LTTLPtW//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0X
# vMnsQybQv0FfQKlERPSZ51eHnlAfV1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQe
# k9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrWX1Uu6lzGKAgEJTm4Diup8kyXHAc/
# DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSgEQojPpbxB+zirynvgqV/
# 0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYDVR0PAQH/BAQD
# AgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1UdHwQ8
# MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRl
# U2VydmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDov
# L29jc3AuY29tb2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrg
# J7cz0C7M7PDmy14R3iJvm3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yq
# qcau8vzY7qN7Q/aGNnwU4M309z/+3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/
# WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHxW/BBC5gACiIDEOUMsfnNkjcZ7Tvx
# 5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1FzZOFli9d31kWTz9RvdVF
# GD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/jnZymQyd/teR
# CBaho1+VMIIF9TCCA92gAwIBAgIQHaJIMG+bJhjQguCWfTPTajANBgkqhkiG9w0B
# AQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNV
# BAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsx
# LjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkw
# HhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjB8MQswCQYDVQQGEwJHQjEb
# MBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgw
# FgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxJDAiBgNVBAMTG1NlY3RpZ28gUlNBIENv
# ZGUgU2lnbmluZyBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIYi
# jTKFehifSfCWL2MIHi3cfJ8Uz+MmtiVmKUCGVEZ0MWLFEO2yhyemmcuVMMBW9aR1
# xqkOUGKlUZEQauBLYq798PgYrKf/7i4zIPoMGYmobHutAMNhodxpZW0fbieW15dR
# hqb0J+V8aouVHltg1X7XFpKcAC9o95ftanK+ODtj3o+/bkxBXRIgCFnoOc2P0tbP
# BrRXBbZOoT5Xax+YvMRi1hsLjcdmG0qfnYHEckC14l/vC0X/o84Xpi1VsLewvFRq
# nbyNVlPG8Lp5UEks9wO5/i9lNfIi6iwHr0bZ+UYc3Ix8cSjz/qfGFN1VkW6KEQ3f
# BiSVfQ+noXw62oY1YdMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rP
# VIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQO4TqoUzox1Yq+wbutZxoDha00DjAOBgNV
# HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEF
# BQcDAwYIKwYBBQUHAwgwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBD
# oEGGP2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZp
# Y2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKG
# M2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENB
# LmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkq
# hkiG9w0BAQwFAAOCAgEATWNQ7Uc0SmGk295qKoyb8QAAHh1iezrXMsL2s+Bjs/th
# AIiaG20QBwRPvrjqiXgi6w9G7PNGXkBGiRL0C3danCpBOvzW9Ovn9xWVM8Ohgyi3
# 3i/klPeFM4MtSkBIv5rCT0qxjyT0s4E307dksKYjalloUkJf/wTr4XRleQj1qZPe
# a3FAmZa6ePG5yOLDCBaxq2NayBWAbXReSnV+pbjDbLXP30p5h1zHQE1jNfYw08+1
# Cg4LBH+gS667o6XQhACTPlNdNKUANWlsvp8gJRANGftQkGG+OY96jk32nw4e/gdR
# EmaDJhlIlc5KycF/8zoFm/lv34h/wCOe0h5DekUxwZxNqfBZslkZ6GqNKQQCd3xL
# S81wvjqyVVp4Pry7bwMQJXcVNIr5NsxDkuS6T/FikyglVyn7URnHoSVAaoRXxrKd
# sbwcCtp8Z359LukoTBh+xHsxQXGaSynsCz1XUNLK3f2eBVHlRHjdAd6xdZgNVCT9
# 8E7j4viDvXK6yz067vBeF5Jobchh+abxKgoLpbn0nu6YMgWFnuv5gynTxix9vTp3
# Los3QqBqgu07SqqUEKThDfgXxbZaeTMYkuO1dfih6Y4KJR7kHvGfWocj/5+kUZ77
# OYARzdu1xKeogG/lU9Tg46LC0lsa+jImLWpXcBw8pFguo/NbSwfcMlnzh6cabVgw
# ggZZMIIEQaADAgECAg0B7BySQN79LkBdfEd0MA0GCSqGSIb3DQEBDAUAMEwxIDAe
# BgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxT
# aWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTE4MDYyMDAwMDAwMFoXDTM0MTIx
# MDAwMDAwMFowWzELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
# c2ExMTAvBgNVBAMTKEdsb2JhbFNpZ24gVGltZXN0YW1waW5nIENBIC0gU0hBMzg0
# IC0gRzQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDwAuIwI/rgG+Ga
# dLOvdYNfqUdSx2E6Y3w5I3ltdPwx5HQSGZb6zidiW64HiifuV6PENe2zNMeswwzr
# gGZt0ShKwSy7uXDycq6M95laXXauv0SofEEkjo+6xU//NkGrpy39eE5DiP6TGRfZ
# 7jHPvIo7bmrEiPDul/bc8xigS5kcDoenJuGIyaDlmeKe9JxMP11b7Lbv0mXPRQtU
# PbFUUweLmW64VJmKqDGSO/J6ffwOWN+BauGwbB5lgirUIceU/kKWO/ELsX9/RpgO
# hz16ZevRVqkuvftYPbWF+lOZTVt07XJLog2CNxkM0KvqWsHvD9WZuT/0TzXxnA/T
# NxNS2SU07Zbv+GfqCL6PSXr/kLHU9ykV1/kNXdaHQx50xHAotIB7vSqbu4ThDqxv
# Dbm19m1W/oodCT4kDmcmx/yyDaCUsLKUzHvmZ/6mWLLU2EESwVX9bpHFu7FMCEue
# 1EIGbxsY1TbqZK7O/fUF5uJm0A4FIayxEQYjGeT7BTRE6giunUlnEYuC5a1ahqdm
# /TMDAd6ZJflxbumcXQJMYDzPAo8B/XLukvGnEt5CEk3sqSbldwKsDlcMCdFhniaI
# /MiyTdtk8EWfusE/VKPYdgKVbGqNyiJc9gwE4yn6S7Ac0zd0hNkdZqs0c48efXxe
# ltY9GbCX6oxQkW2vV4Z+EDcdaxoU3wIDAQABo4IBKTCCASUwDgYDVR0PAQH/BAQD
# AgGGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFOoWxmnn48tXRTkzpPBA
# vtDDvWWWMB8GA1UdIwQYMBaAFK5sBaOTE+Ki5+LXHNbH8H/IZ1OgMD4GCCsGAQUF
# BwEBBDIwMDAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29t
# L3Jvb3RyNjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24u
# Y29tL3Jvb3QtcjYuY3JsMEcGA1UdIARAMD4wPAYEVR0gADA0MDIGCCsGAQUFBwIB
# FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG
# 9w0BAQwFAAOCAgEAf+KI2VdnK0JfgacJC7rEuygYVtZMv9sbB3DG+wsJrQA6YDMf
# OcYWaxlASSUIHuSb99akDY8elvKGohfeQb9P4byrze7AI4zGhf5LFST5GETsH8Kk
# rNCyz+zCVmUdvX/23oLIt59h07VGSJiXAmd6FpVK22LG0LMCzDRIRVXd7OlKn14U
# 7XIQcXZw0g+W8+o3V5SRGK/cjZk4GVjCqaF+om4VJuq0+X8q5+dIZGkv0pqhcvb3
# JEt0Wn1yhjWzAlcfi5z8u6xM3vreU0yD/RKxtklVT3WdrG9KyC5qucqIwxIwTrII
# c59eodaZzul9S5YszBZrGM3kWTeGCSziRdayzW6CdaXajR63Wy+ILj198fKRMAWc
# znt8oMWsr1EG8BHHHTDFUVZg6HyVPSLj1QokUyeXgPpIiScseeI85Zse46qEgok+
# wEr1If5iEO0dMPz2zOpIJ3yLdUJ/a8vzpWuVHwRYNAqJ7YJQ5NF7qMnmvkiqK1XZ
# jbclIA4bUaDUY6qD6mxyYUrJ+kPExlfFnbY8sIuwuRwx773vFNgUQGwgHcIt6AvG
# jW2MtnHtUiH+PvafnzkarqzSL3ogsfSsqh3iLRSd+pZqHcY8yvPZHL9TTaRHWXyV
# xENB+SXiLBB+gfkNlKd98rUJ9dhgckBQlSDUQ0S++qCV5yBZtnjGpGqqIpswggZl
# MIIETaADAgECAhABhNOozjeB61f0/Yd7g66yMA0GCSqGSIb3DQEBCwUAMFsxCzAJ
# BgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
# bG9iYWxTaWduIFRpbWVzdGFtcGluZyBDQSAtIFNIQTM4NCAtIEc0MB4XDTIxMDUy
# NzEwMDAxNloXDTMyMDYyODEwMDAxNVowYzELMAkGA1UEBhMCQkUxGTAXBgNVBAoM
# EEdsb2JhbFNpZ24gbnYtc2ExOTA3BgNVBAMMMEdsb2JhbHNpZ24gVFNBIGZvciBN
# UyBBdXRoZW50aWNvZGUgQWR2YW5jZWQgLSBHNDCCAaIwDQYJKoZIhvcNAQEBBQAD
# ggGPADCCAYoCggGBAOKim7ZJ+zRIKCMHhv1SE026y6o14vlAHBt7acWYKszJXO8n
# xuy4JWXDPx1E597hCO8EFwCVlwz9212DtIjroI6bT4O6+d9eGFRqAg4O5lTwN6Qe
# nGcxBbU3cXx6ftiBZTPkmuqwMTfHZrSjugUn6m5SgljZglYkjfnrsxT7ZACheyof
# ep6oY5Hm2NEixj/SnTg/r5VpWye/6EAkmccf2XuSBQJ9KMY8Ofd6zfdlJqA3rzIF
# d5dq4RAbmIUshK3lJYZ8c57NiI1LKnqdD1l5vfLaNn5mrC74u4iXyW158rPU1cwa
# 9E+LRZV28oeVgI4oebr9xXCvvBoUApB8JlsRi131uuQRAsWBHGZoS95ozp0MiGGq
# tpQjneCkPEZdBFHbP1kL5+y+0tkTKkfvSxISbsg1z+4WMrbQX4W4T/J82AkrEl7A
# wu8TMXA2c9zWV1TTV2CeHBCV8OaqLxCKG37JzY/OUEscJajAF2RRFQuMz9fJXUps
# SXSuWvFqBnU+iTc7kQIDAQABo4IBmzCCAZcwDgYDVR0PAQH/BAQDAgeAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMB0GA1UdDgQWBBR1ryc/uNua7G8c7sNqZPa/hDWw
# zjBMBgNVHSAERTBDMEEGCSsGAQQBoDIBHjA0MDIGCCsGAQUFBwIBFiZodHRwczov
# L3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMIGQBggr
# BgEFBQcBAQSBgzCBgDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2ln
# bi5jb20vY2EvZ3N0c2FjYXNoYTM4NGc0MEMGCCsGAQUFBzAChjdodHRwOi8vc2Vj
# dXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc3RzYWNhc2hhMzg0ZzQuY3J0MB8G
# A1UdIwQYMBaAFOoWxmnn48tXRTkzpPBAvtDDvWWWMEEGA1UdHwQ6MDgwNqA0oDKG
# MGh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vY2EvZ3N0c2FjYXNoYTM4NGc0LmNy
# bDANBgkqhkiG9w0BAQsFAAOCAgEAOJO3fTWJNOoa1qp6zo2E2+E0t3Sl/9hdlDYl
# j9KAfqFlsZvPNVFd26BLbvchQC7sT28WQHIcdRswABc5j8gvpHHOJDMmkNXk/zm5
# Ye8LyjnzLV6NoP9O4VZkH9ScdgSkRFw9YoVwL/lOpPeGVtt6SSZDLQWb4sOJtzqh
# LScnGMZDi9xDobZyLT/ZxjSKAtNiOSnwfSjQqcNkikZts0McdIvduaYLIXsRpx9d
# otuM4FXTafp30V0UuZbskUUbG2x+QkAkpO1AxmX6QY9IMZzjuLMXV4J5yswewtBP
# TwUODXnXad2VoXFdip7nWsJPqAYPCIl721jIJX3/aLwoonCcuwy1U+iOBrGygoGH
# Eqled0yTqxj4RFdYEcv2kxVJMbdTUCHa1fxgf90wxaxRRAtnpfrWdzStEh8o+4ja
# UZtEmt53Du4yEmBWDJGdWI+8mVfyvs25w3MkGdp3puTs8d5v4LyEHW/D8dvh1UJR
# hlESQiY+0+oT9CicrU16t6K6FGo/QFVYToxlHLP2ddZ/rg+EgC++iHhcJx9HF8I9
# 5Gmey66e7wJoiDcQwmwmisiMZZBTTa5d2rhGENSQCor/9ChAgeBSyPIBZEgYhHhq
# IvrKnKoOHcWOcsM2Ihnr+JQfv8LFAVbppoDqAR0TNQfiuXQU/Zo4ngPSSfZM66G9
# HBTS45kxggV+MIIFegIBATCBkDB8MQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
# YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0
# aWdvIExpbWl0ZWQxJDAiBgNVBAMTG1NlY3RpZ28gUlNBIENvZGUgU2lnbmluZyBD
# QQIQAwPpYPcjB+z3EBRLi8GwRzANBglghkgBZQMEAgEFAKBMMBkGCSqGSIb3DQEJ
# AzEMBgorBgEEAYI3AgEEMC8GCSqGSIb3DQEJBDEiBCCqchPEsPUTupi6YvTdmUj+
# SQlwF2IL5VBNZucxBAcEfDANBgkqhkiG9w0BAQEFAASCAQAP4z+D12KKdF1PtwQN
# fCuuHhGHyto+oi0e/0+jw12rDLgJoHkgGoB3v3dBjK1j1naSPo23vCoWF0doyX74
# lTc+WnOjblE/Iidj07rM2eOLjjoXB0eqNg+i5+W761CpscOXYExFmcg1eBdNI9wG
# BPiW297+2BhgQXxu9ctGsGfsQ/IsCNjIzNlHgTm0UKE2l1VdPsBe4yynF3YwCjWP
# khBMXiaAISqtatKohl6182ciFFtBb9dcGmNadyqbuLgsssp8yn4O2Ml0GDaPxveU
# kpU7MyR6YlkT3rHh/DkKEZnVPJjHfHLmiEcVYbZA7Sqj42niIg2ndh0YPgDC0aXe
# tgGzoYIDcDCCA2wGCSqGSIb3DQEJBjGCA10wggNZAgEBMG8wWzELMAkGA1UEBhMC
# QkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMTAvBgNVBAMTKEdsb2JhbFNp
# Z24gVGltZXN0YW1waW5nIENBIC0gU0hBMzg0IC0gRzQCEAGE06jON4HrV/T9h3uD
# rrIwDQYJYIZIAWUDBAIBBQCgggE/MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
# HAYJKoZIhvcNAQkFMQ8XDTIxMDYxMjE5NDAyMFowLQYJKoZIhvcNAQk0MSAwHjAN
# BglghkgBZQMEAgEFAKENBgkqhkiG9w0BAQsFADAvBgkqhkiG9w0BCQQxIgQgfzLG
# r7CKT0WiQ6+s/WRXHLjjTTq+hJi5CQL6pk3+s/cwgaQGCyqGSIb3DQEJEAIMMYGU
# MIGRMIGOMIGLBBTdV7WzhzyGGynGrsRzGvvojXXBSTBzMF+kXTBbMQswCQYDVQQG
# EwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFs
# U2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBTSEEzODQgLSBHNAIQAYTTqM43getX9P2H
# e4OusjANBgkqhkiG9w0BAQsFAASCAYAccJnYj8JDfHUla42nshKY7SV9bC/Jgj60
# r9Wnhxwa5zPsq6/QVsTBpzTIdqKgikOYpK3bChSAqJCegsThwy3vTvzixaS5+IwX
# YnF2gUo+o39CoimlXPunM0MoLBJc4oDDLQRYpY0bN5/2h9wOuEvAFECfFtWnQWdh
# 5JzwYwOueuCQFQPdDSh4Cem+FpwJTl1vWBvM8mE0w4qpuJmy8+tu7dv0gvZhbNxu
# liG1zhZGwWt9S2zoSQ+9v05YOmaYLDcGQjzLEXh8oHLYPWrLG9008pGX4oDHoX+h
# CaGBxgEercIkKcW2v4aZk8u+PxZYkTiEx19rHrGLRkPi4k/IVHG7ul6eA16qpWDw
# zx686IaDf7znCArdnDWZfmsin5NlS0lA6VcMOUqWmzlB+j6zH1Ax/7FfhzARH26X
# mTfy5JxwRu3TVt3TtkeQBtilDlBM2CPZZivMcIBgS5vXI3NhDRooQD4Wxnn9S71r
# Pfn5p6UGZSsCRFj1y2J1FxwikCgn328=
# SIG # End signature block
