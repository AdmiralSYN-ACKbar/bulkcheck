#!/bin/bash
#Prerequisites - See ReadMe function built into program

#Function Section

cancelReturnToMenu () #If "cancel" is selected in Whiptail, returns the user to the main CSV menu after displaying a message.
{
	exitstatus=$? 
	if [ $exitstatus = 1 ]
		then 
		whiptail --title "Input Canceled" --msgbox "Input Canceled. Press OK to return to the menu. Please re-run setup prior to execution of the bulk check." 8 78
			$cancelMenu
	fi
}

filePresent () #checks to see if appropriate input file exists
{
	if test -f $inputFile;
			then
				inputExists=yes
			else
				inputExists=no
		fi	
}

apiCharLengthCheck () #checks character length of API key and writes to variable apiCharLength.
{ 
	apiCharLength=$(sed -n 1p $inputFile | wc -m) #$1 is file path
}

readApiFirstFour () #Read the first 4 characters of the API key
{
	firstFourApi=$(sed -n 1p $inputFile | cut -c1-4)
}

whiptailInputApi () #input API key through whiptail
{
	apiUserInput=$(whiptail --inputbox "Input 81-character API Key:" 8 78 --title "Input API Key" 3>&1 1>&2 2>&3)
	cancelReturnToMenu
	echo $apiUserInput > $inputFile
	apiCharLengthCheck
	while [[ $apiCharLength -ne 81 ]]
		do
			if [ $apiCharLength -ne 81 ]
				then
					apiUserInput=$(whiptail --inputbox "Invalid input. The key you entered was $apiCharLength characters. Re-input 81-character API Key:" 8 78 --title "Invalid API Key" 3>&1 1>&2 2>&3)	
					cancelReturnToMenu
					echo $apiUserInput > $inputFile
					apiCharLengthCheck
			fi
	done
}

emptyLineTest () #check to see if line is empty and enters result into lineEmpty variable
{
	lineValue=$(sed -n $1p $inputFile) #reads specified line of file
	if [ "$lineValue" = "" ]
		then
			lineEmpty=true
		else
			lineEmpty=false
	fi
}

inputSourcePath () #input source path of CSV file of IP addresses
{
	ipFile=$(whiptail --inputbox "Input path to CSV file with IP address list to be checked" 8 78 ./ --title "Input Source Path" 3>&1 1>&2 2>&3)
	cancelReturnToMenu
	if [ $lineEmpty = false ]
		then
			ipFileSedFriendly=$(echo "$ipFile" | sed 's/\//\\\//g') #converts slashes in path to format that can be written by sed
			sed -i '2s/.*/'$ipFileSedFriendly'/' $inputFile #replaces line 2 of input with input file path
		else
			echo $ipFile >> $inputFile #if line 2 is empty, write file as input without sed processing
	fi
}

inputApiSubscription () #For block checks, asks the user to enter subscription level, which determines which block checks they can conduct
{
	subscriptionLevel=$(whiptail --title "Select Subscription Level" --backtitle "Use the \"SPACE\" key to select an option, and the \"ENTER\" key to exit" --radiolist \
	"Select the subscription level associated with your AbuseIP Key. This will effect the size of CIDR blocks you can check as well as the maximum age of included reports returned in CIDR Block mode. \n\nUse the arrow keys to navigate \n\nUse the \"SPACE\" key to select an option \n\nUse the \"ENTER\" key to exit." 20 78 4 \
	"Free" "/24 maximum block size, 30 days maximum age" ON \
	"Basic" "/20 maximum block size, 60 days maximum age" OFF \
	"Premium" "/16 maximum block size, 365 days maximum age" OFF 3>&1 1>&2 2>&3)
	exitStatus=$?
	if [ $exitStatus = 0 ] 
		then
			whiptail --title "Confirm Subscription Level" --yesno "You selected $subscriptionLevel. Is this correct?" 7 50
				if [ $? = 0 ]
					then
						echo "Confirmed subscription level" > /dev/null 2>&1
							if [ "$lineEmpty" = false ]
								then
									sed -i '2s/.*/'$subscriptionLevel'/' $inputFile #Use sed to replace value if one exists
									else
						echo $subscriptionLevel >> $inputFile #Write value if no value exists
							fi
					else
						inputApiSubscription
				fi
			else
				cancelReturnToMenu
	fi		
}

inputOutputPath () #user inputs output path of report on IP addreses
{
	outputPath=$(whiptail --inputbox "Input the full file path, including file name and extension, where you want to store your results file. CSV format is recommended." 8 78 ./bulkresults.csv --title "Enter Output Path" 3>&1 1>&2 2>&3)
	cancelReturnToMenu
	if [ $lineEmpty = false ]
		then
			outputPathSedFriendly=$(echo "$outputPath" | sed 's/\//\\\//g') #converts slashes in path to format that can be written by sed
			sed -i '3s/.*/'$outputPathSedFriendly'/' $inputFile  #replaces line 3 of input file with output file path
		else
			echo $outputPath >> $inputFile #if line 3 is empty, write file as without sed processing
	fi
}

maxAgeAcceptable () #Calculates the maxAgeLegit variable for acceptable range of max age of reports. Subscription level statements only apply to block checks. CSV and Premium have same values, so Premium range is used for CSV
{	
if [[ "$mode" == "csv" ]] #CSV mode has premium ranges allowed for max days regardless of subscription level
	then
		subscriptionLevel="Premium"
	else
		subscriptionLevel=$(sed -n 2p $inputFile) #Second line of input file used for subscription level if none found
fi

if [[ $subscriptionLevel = "Premium" ]]
	then
		if [ "$maxAge" -ge 1 -a "$maxAge" -le 365 ]
			then
			maxAgeLegit="Yes"
			else
			maxAgeLegit="No"
		fi
	acceptableRange="1-365" #String for dialog box
fi

if [[ $subscriptionLevel = "Basic" ]]
	then
		if [ "$maxAge" -ge 1 -a "$maxAge" -le 60 ]
			then
			maxAgeLegit="Yes"
			else
			maxAgeLegit="No"
		fi
	acceptableRange="1-60" #String for dialog box
fi

if [[ $subscriptionLevel = "Free" ]]
	then
		if [ "$maxAge" -ge 1 -a "$maxAge" -le 30 ]
			then
			maxAgeLegit="Yes"
			else
			maxAgeLegit="No"
		fi
	acceptableRange="1-30" #String for dialog box
fi

}

validateMaxAge () #Checks to make sure max age of abuse reports are within acceptable range of 1 - 365 and prompts user to re-input if not
{
	maxAgeAcceptable
	while [[ $maxAgeLegit == "No" ]]
		do
			if [ $maxAgeLegit == "No" ]
			then
				maxAge=$(whiptail --inputbox "Invalid age entered. Input must be between $acceptableRange. Please input the maximum age in days of AbuseIP Database reports to be returned. This does not effect the % confidence estimate." 10 78 30 --title "Invalid Input" 3>&1 1>&2 2>&3)
				cancelReturnToMenu
				maxAgeAcceptable
			fi
	done

}
inputMaxAge () #Sets the max age of reports to be returned
{
	maxAge=$(whiptail --inputbox "Input the maximum age in days of AbuseIP Database reports to be returned. This does not effect the % confidence estimate. Acceptable values are 1 - 365, default value is 30." 10 78 30 --title "Enter Maximum Report Age" 3>&1 1>&2 2>&3)
	cancelReturnToMenu
	validateMaxAge
	if [ "$lineEmpty" = false ]
		then
			sed -i '4s/.*/'$maxAge'/' $inputFile  #replaces line 4 of input with maxAge variable
	else
		echo $maxAge >> $inputFile #if line 4 is empty, write max age in line 4
	fi
}

jqPresent () #Sets the jqPresent variable, which detects for JQ installation
{
	if command -v jq >/dev/null; 
		then
		jqPresent="Yes"
		else
		jqPresent="No"
	fi
}
jqCheck () #Checks for installation of JQ, needed for executing bulk checks. Make a separate function? Cleanup code
{
	jqPresent
	if [[ $jqPresent == "Yes" ]]
		then 
		echo "JQ is present" > /dev/null 2>&1 #Suppresses output
		else
		whiptail --title "Install JQ" --msgbox "JQ not found and is needed for program functioning. Press OK to install JQ through apt-get." 8 78
		sudo apt-get install jq
		jqPresent
		if [[ $jqPresent == "Yes" ]]
			then
				whiptail --title "Installation Successful" --msgbox "JQ installation successful. Press OK to continue with setup." 8 78
			else
				whiptail --title "Install Unsuccessful" --msgbox "JQ installation unsuccessful. JQ is needed to run this program. Press OK to quit. Retry running setup after JQ is installed." 8 78
				echo -e "\e[31mExiting Program\e[0m"
				exit
		fi
	fi			
}

apiPrompt () #Main function for API user input
{
filePresent #Checks to see if input file is present
	if [ $inputExists == no ]
		then
				whiptailInputApi	
		else 	
				apiCharLengthCheck #Checks API character length and asks user if they would like to change keys if it is of valid length. 
					if [ $apiCharLength -eq 81 ]
						then
							readApiFirstFour
							if (whiptail --title "Keep Using API Key?" --yesno "Existing 81-character API Key Found. First 4 characters of existing API key are \"$firstFourApi\". Would you like to keep using it?" 8 78); 
								then
									echo "Maintaing current API Key" > /dev/null 2>&1
								else
									whiptailInputApi
							fi
						else
							whiptailInputApi	
					fi
	fi
}

csvSourcePrompt () #Main function for user CSV source file input
{
	emptyLineTest 2 #Reads line 2 of input text file, which is where input file path is written, and determines if anything is written to it
	if [ $lineEmpty == false ]
		then
			if (whiptail --title "Maintain Existing Source File?" --yesno "Existing source IP file path is set to $lineValue. Would you like to keep using it?" 8 78); 
				then
				echo "Maintaining current source path" > /dev/null 2>&1
				else
				inputSourcePath
			fi
		else
			inputSourcePath
	fi			
}

outputPathPrompt () #Main function for user input of output path
{
	emptyLineTest 3 #Reads line 3 of input file, which is where output file path is written
	if [ $lineEmpty == false ]
		then
			if (whiptail --title "Maintain Output Path?" --yesno "Existing output file path is set to $lineValue. Would you like to keep using it?" 8 78); 
				then
					echo "Maintaining current output path" > /dev/null 2>&1
				else
					inputOutputPath
			fi
		else
			inputOutputPath
	fi
}

maxAgePrompt () #Main function for user input of Maximum Age of reports
{
emptyLineTest 4 	#Reads line 4 of input file, which is where the inputMaxAge variable is stored
	if [ $lineEmpty == false ]
		then
			if (whiptail --title "Maintain Existing Maximum Age?" --yesno "Current Max Report Age is currently set to $lineValue. Do you wish to keep this? This will not effect the % Abuse Confidence returned." 8 78); 
				then
					echo "Maintaining existing maximum age" > /dev/null 2>&1
				else
					inputMaxAge
		fi
		else
			inputMaxAge
	fi
}

readInputFileCsv () #Reads variables from input file for execution for CSV check. Section may be redundant, can consider how to remove.
{ 
	apiUserInput=$(sed -n 1p $inputFile) #Reads API key, 1st line text created in setup script. Sets to apiUserInput variable.
	ipFile=$(sed -n 2p $inputFile) #Reads CSV file path, 2nd line of text created in setup script. Sets to ipFile variable.
	outputPath=$(sed -n 3p $inputFile) #Reads the output file path. Sets to outputPath variable
	maxAge=$(sed -n 4p $inputFile) #Reads the maxAge line of the input file file.
}

confirmInputFile () #Confirms that input file created during setup exists
{
	if [ -e $inputFile ]
		then
			echo "Confirmed that input file exists" > /dev/null 2>&1 #echo for testing
	 	else   
	  		whiptail --title "No Input File" --msgbox "Input file created during setup not found. Press OK to return to the Main Menu. 
			run setup prior to re-execution of the program." 8 78
			$cancelMenu
	fi
}

setupBulkCheckCsv () #Function for setup for running bulk checks against a CSV file
{
	jqCheck
	apiPrompt
	csvSourcePrompt
	outputPathPrompt
	maxAgePrompt
	readInputFileCsv
}

runBulkCheckCsv () #IP check section. Reads specified IP from Abuse IP database and returns only the IP and Confidence of Abuse score. Outputs to CSV. First value outputted is the IP, second value is confidence of abuse.
{
	confirmInputFile	
	readInputFileCsv
	i=1 #loop counting
	echo "Using API Key" $apiUserInput
	echo "Processing IP Addresses from" $ipFile 
	echo "Output path is" $outputPath
	if [ -f "$outputPath" ]; then
		rm $outputPath #removes existing file at outputPath, can add feature later asking user if they want to do this, or give it a different name
	fi
	numIps=$( wc -l < $ipFile) #Determines number of IPs to be processed and assigns to numIps variable
	cat $ipFile | while read line #Read file specified in ipFile variable and runs through while loop for every line of file
	do
		echo "IP #" $i "of" $numIps"," $line
	curl -G https://api.abuseipdb.com/api/v2/check \
		 --data-urlencode "ipAddress=$line" \
		  -d maxAgeInDays=$maxAge \
		  -H "Key: $apiUserInput" \
		  -H "Accept: application/json" \
		-o "currentip.json" 
	cat currentip.json | jq -r '.[] | "\(.ipAddress), \(.abuseConfidenceScore), \(.totalReports), \(.isp), \(.countryCode), \(.domain), \(.numDistinctUsers), \(.lastReportedAt)"' >> $outputPath #Selects fields to write to output file
	i=$[$i+1] #Increments line to be read
	done
	sed -i 1i"IP Address, % Confidence of Abuse, Total Reports within "$maxAge" days, ISP, Country Code, Domain, Distinct Users Reporting, Last Reported At" $outputPath #Adds header to CSV file
	rm currentip.json #removes temporary file
}

csvMenu () #Menu for CSV List mode
{
    menuSelection=$(whiptail --title "CSV List Mode Menu" --fb --menu "Choose an option" 15 60 4 \
        "1" "Setup Bulk Check" \
        "2" "Execute Bulk Check" \
        "3" "Exit to Top Menu" 3>&1 1>&2 2>&3)
    case $menuSelection in
        1)        
			setupBulkCheckCsv
			whiptail --title "Setup Complete" --msgbox "" 6 40
			csvMenu
        ;;
        2)
			echo -e "\e[31mExecuting Bulk Check\e[0m"
            runBulkCheckCsv
			whiptail --title "Bulk Check Complete" --msgbox "" 6 40
            csvMenu
        ;;
        3)
        		topMenu
        ;;
    esac
}

inputBlockValidation () #Makes sure that CIDR block is of proper format and in subscription size range. 
#Format only does a check for 3 dots and 1 slash in CIDR. Need to develop better input validation to ensure valid CIDR input is made.
{
	numPeriod=$(echo "{$blockToCheck}" | awk -F"." '{print NF-1}') #counts number of periods
	numSlash=$(echo "{$blockToCheck}" | awk -F"\/" '{print NF-1}') #counts number of periods
	while [ $numPeriod -ne 3 ] || [ $numSlash -ne 1 ]
		do
			if [ $numPeriod -ne 3 ] || [ $numSlash -ne 1 ]
				then
					numPeriod=$(echo "{$blockToCheck}" | awk -F"." '{print NF-1}') #counts number of periods
					numSlash=$(echo "{$blockToCheck}" | awk -F"\/" '{print NF-1}') #counts number of periods
					blockToCheck=$(whiptail --inputbox "Invalid CIDR input. Your input had $numPeriod \".\" and $numSlash \"/\" characters. Your CIDR block input must have 3 \".\" characters and 1 \"/\" character (i.e. 192.168.0.0/24). Please re-input CIDR block:" 10 78 --title "Invalid CIDR Block" 3>&1 1>&2 2>&3)	
					cancelReturnToMenu
					blockToCheckSedFriendly=$(echo "$blockToCheck" | sed 's/\//\\\//g') #converts slashes in path to format that can be written by sed
					sed -i '5s/.*/'$blockToCheckSedFriendly'/' $inputFile #replaces line 5 of input with new input
				fi
		done
	blockLast2=${blockToCheck: -2} #Reads last 2 characters of CIDR block for validation
	
	subscriptionLevel=$(sed -n 2p $inputFile) #Reads subscription variable from 2nd level of input file
	
	if [[ $subscriptionLevel = "Premium" ]]
		then
			maxCidr=16
	fi
			
	if [[ $subscriptionLevel = "Basic" ]]
		then
			maxCidr=20
	fi
	
	if [[ $subscriptionLevel = "Free" ]]
		then
			maxCidr=24
	fi
	while [ $maxCidr -gt $blockLast2 ]
		do
			if [ $maxCidr -gt $blockLast2 ]
				then
					blockToCheck=$(whiptail --inputbox "Invalid CIDR input. You entered a block size of /$blockLast2. Your subscription level of $subscriptionLevel is only allowed a block size of $maxCidr. Number input must be greater than /$maxCidr. Please re-input CIDR block:" 8 78 --title "Invalid CIDR Block" 3>&1 1>&2 2>&3)	
					cancelReturnToMenu
					echo $blockToCheck >> $inputFile
					inputBlockValidation
			fi
		done
}

inputBlockToCheck () #input CIDR block to check.
{
	blockToCheck=$(whiptail --inputbox "Input CIDR Block to check (i.e. 192.168.1.0/24). Do not use spaces." 8 78 --title "Input CIDR Block" 3>&1 1>&2 2>&3)
	cancelReturnToMenu
	if [ $lineEmpty = false ]
		then
			blockToCheckSedFriendly=$(echo "$blockToCheck" | sed 's/\//\\\//g') #converts slashes in path to format that can be written by sed
			sed -i '5s/.*/'$blockToCheckSedFriendly'/' $inputFile #replaces line 5 of input with new input
		else
			echo $blockToCheck >> $inputFile #if line 5 is empty, write file as input without sed processing
	fi
	inputBlockValidation
	}

blockToCheckPrompt () #Main function for user block to check input
{
	emptyLineTest 5 #Reads line 5 of input text file, which is where input file path is written, and determines if anything is written to it
	if [ $lineEmpty == false ]
		then
			if (whiptail --title "Maintain existing CIDR block?" --yesno "Existing CIDR block to check is set to $lineValue. Would you like to keep this value?" 8 78); 
				then
				echo "Maintaining current CIDR block to check" > /dev/null 2>&1
				else
				inputBlockToCheck
			fi
		else
			inputBlockToCheck
	fi			
}

subscriptionLevelPrompt () #Main function for user block to check input
{
	emptyLineTest 2 #Reads line 2 of input text file, which is where input file path is written, and determines if anything is written to it
	if [ "$lineEmpty" = false ]
		then
			if (whiptail --title "Maintain existing Subscription Level?" --yesno "Subscription level of $lineValue associated with this API key. Would you like to keep this value?" 8 78); 
				then
				echo "Maintaining subscription level" > /dev/null 2>&1
				else
				inputApiSubscription
			fi
		else
			inputApiSubscription
	fi			
}

readInputFileBlock () #Reads variables from input file for execution for Block checks. Section may be redundant, can consider how to remove.
{ 
	apiUserInput=$(sed -n 1p $inputFile) #Reads API key, 1st line text created in setup script. Sets to apiUserInput variable.
	subscriptionLevel=$(sed -n 2p $inputFile) #Reads API subscription level, which influences which CIDR blocks can be checked
	outputPath=$(sed -n 3p $inputFile) #Reads the output file path. Sets to outputPath variable
	maxAge=$(sed -n 4p $inputFile) #Reads the maxAge line of the input file file.
	blockToCheck=$(sed -n 5p $inputFile) #CIDR block to check
}

setupBulkCheckBlock () #Function for setup for running bulk checks against a CSV file
{
	jqCheck
	apiPrompt
	subscriptionLevelPrompt
	outputPathPrompt
	maxAgePrompt
	blockToCheckPrompt
}

blockMenu ()
{
    menuSelection=$(whiptail --title "CIDR Block Mode Menu" --fb --menu "Choose an option" 15 60 4 \
        "1" "Setup Bulk Check" \
        "2" "Execute Bulk Check" \
        "3" "Exit to Top Menu" 3>&1 1>&2 2>&3)
    case $menuSelection in
        1)        
				setupBulkCheckBlock
				whiptail --title "Setup Complete" --msgbox "" 6 40
				blockMenu
        ;;
        2)
				echo -e "\e[31mExecuting Bulk Check\e[0m"
				runBulkCheckBlock
				whiptail --title "Bulk Check Complete" --msgbox "" 6 40
				blockMenu
        ;;
        3)
	        topMenu
        ;;
    esac
}

emptyLineTestOutput () #check to see if line in Bulk Check output file is empty 
{
	lineValueOutput=$(sed -n $1p $outputPath)
	if [ "$lineValueOutput" = "" ]
		then
			lineEmptyOutput=true
		else
			lineEmptyOutput=false
	fi
}

#End Function Section

#Block check section - (Network used for testing is 68.183.21.0/24)

runBulkCheckBlock ()
{
	confirmInputFile	
	readInputFileBlock
	curl -G https://api.abuseipdb.com/api/v2/check-block \
	  --data-urlencode "network=$blockToCheck" \
	  -d maxAgeInDays=$maxAge \
	  -H "Key: $apiUserInput" \
	  -H "Accept: application/json" \
	 -o "currentip.json" 

#I'm sure there's a more efficient way to do this, but this works. May modify later. Writes variables from query results.
	ip=$(cat currentip.json | jq -r '.data."reportedAddress" | .[] .ipAddress')
	abuseConfidence=$(cat currentip.json | jq -r '.data."reportedAddress" | .[] .abuseConfidenceScore')
	numReports=$(cat currentip.json | jq -r '.data."reportedAddress" | .[] .numReports')
	countryCode=$(cat currentip.json | jq -r '.data."reportedAddress" | .[] .countryCode')
	mostRecentReport=$(cat currentip.json | jq -r '.data."reportedAddress" | .[] .mostRecentReport')
	networkAddress=$(cat currentip.json | jq -r '.data."networkAddress"')
	netmask=$(cat currentip.json | jq -r '.data."netmask"')
	minAddress=$(cat currentip.json | jq -r '.data."minAddress"')
	maxAddress=$(cat currentip.json | jq -r '.data."maxAddress"')
	numPossibleHosts=$(cat currentip.json | jq -r '.data."numPossibleHosts"')

#Writes variables to temp files
	echo $ip | tr " " "\n" > temp1.csv
	echo $abuseConfidence | tr " " "\n" > temp2.csv
	echo $numReports | tr " " "\n" > temp3.csv
	echo $countryCode | tr " " "\n" > temp4.csv
	echo $mostRecentReport | tr " " "\n" > temp5.csv
	paste -d , temp1.csv temp2.csv temp3.csv temp4.csv temp5.csv > $outputPath #Writes temp variables to CSV

#Inserts heading into results file
	sed -i 1i"Parameters \n " $outputPath
	sed -i 2i"Network Address,Netmask,User CIDR Input, Minimum Address,Maximum Address,Possible Hosts" $outputPath
	sed -i 3i"$networkAddress,$netmask,$blockToCheck,$minAddress,$maxAddress,$numPossibleHosts" $outputPath
	sed -i 5i"Results" $outputPath
	sed -i 6i"IP Address,% Confidence of Abuse,Total Reports within "$maxAge" days,Country Code,Last Reported At" $outputPath

#Writes footer line of CSV file depending on if any potentially abusive IPs were found in block. Starts on line 8, not sure why 7 doesn't work.
	emptyLineTestOutput 8 
		if [ $lineEmptyOutput = true ]
			then
				sed -i "\$aNo Abusive IPs found in block" $outputPath
			else #counts found IPs and puts in footer of CSV
				(( ipsFound=$(wc -l < $outputPath) - 6 ))
				sed -i '$a \ ' $outputPath
				sed -i "\$a Total: $ipsFound IPs" $outputPath
				echo $lineEmptyOutput
		fi
	rm temp1.csv temp2.csv temp3.csv temp4.csv temp5.csv currentip.json #Removes temporary files
}

#ReadMe function. Creates text file and removes after veiwing. Viewable from Top Menu.
readMe ()
{
	echo -e "\t\t\tAbuseIP Bulk Check Script\n\t\t\tby Admiral SYN-ACKbar" | sed 's/^/           /' > readMeAbuseIpBulkCheck
	echo -e "\nPurpose \n \nThis program enables you to check either a CSV list of IP addresses or a CIDR block against the Abuse IP Database. It returns information about the IPs checked as a CSV file." >> readMeAbuseIpBulkCheck
	echo -e "\nPrerequisites \n \nYou will need an API key from the AbuseIP Database, available for free at https://www.abuseipdb.com/pricing. Create an account and generate an API key. When running in CSV List mode, you will need a CSV file that contains 1 IP address per line. Do not include any headings. \n\nJQ, which is used for JSON processing, is also required. When you run a bulk-check, the program will check to see if this is installed and prompt you for installation if it is not. " >> readMeAbuseIpBulkCheck
	echo -e "\nTimeout errors \n\nTimeout errors will sometimes occur if AbuseIPDb.com is having availability issues. The program will generally spend up to a minute on a query before returning a \"parse error: Invalid numeric literal at line 1, column 10\". This generally coincides with being unable to run queries on the site through a web browser. These occur regularly but are generally resolved within minutes. If you see one, try running the script again in a few minutes and seeing if the issue resolves. " >> readMeAbuseIpBulkCheck
	echo -e "\nSetup File Information \n\nCurrently, CSV List Mode and CIDR Block Check Mode have separate setup functions. The setup functions create text files that store the last-used parameters for re-use. CSV List Mode will create a file called inputcsv.txt and CIDR Block Check Mode will create a file caled inputblock.txt. If you do not want to save your API key in a text file for security purposes, remove this file after program use. You can modify the contents of these files by re-running the setup function or through a text editor." >> readMeAbuseIpBulkCheck
	whiptail --title "AbuseIP Bulk Check Readme" --backtitle "Use the arrow keys to scroll, and tab/enter or Esc to exit" --scrolltext --textbox readMeAbuseIpBulkCheck 20 80 #--scrolltext
	rm readMeAbuseIpBulkCheck #Removes readme file after created.
}

#Menu section for initial launch
topMenu ()
{
	menuSelection=$(whiptail --title "Abuse IP Bulk Checker" --fb --menu "Choose an option" 15 60 4 \
		"1" "View Readme" \
		"2" "CSV List Mode" \
		"3" "CIDR Block Mode" \
		"4" "Exit Program" 3>&1 1>&2 2>&3)

	case $menuSelection in
		1) 
			readMe
			topMenu
		;;
		2)
			inputFile=inputcsv.txt
			cancelMenu=csvMenu
			mode="csv"
			csvMenu
		;;
		3)
			inputFile=inputblock.txt
			cancelMenu=blockMenu
			mode="block"
			blockMenu
		;;
		4)
		  	 echo -e "\e[31mExiting Program\e[0m"
          exit
		;;
	esac
}

#Program Section
topMenu

#Great menu tutorial - https://www.bradgillap.com/guide/post/bash-gui-whiptail-menu-tutorial-series-1
