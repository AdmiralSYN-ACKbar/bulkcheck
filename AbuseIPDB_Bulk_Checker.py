# Admiral SYN-ACKbar's AbuseIPDB Bulk Checker (https://github.com/AdmiralSYN-ACKbar/AbuseIPDB-Bulk-Checker)

import csv          #implements classes to read and write tabular data in CSV format
import requests     #allows sending/receiving HTTP requests
import json         #parse JSON strings
import os           #provides functions for interacting with the operating system
import tkinter as tk    #GUI toolkit
from tkinter import filedialog, ttk, messagebox #filedialog: open/save files; ttk: themed widgets; messagebox: display message boxes
import time        #time-related functions
import math        #mathematical functions

def bulk_check(csv_path, api_key, export_path, progress, output_box):
    start_time = time.time()

    json_temp_path = os.path.join(os.path.dirname(export_path), 'aipdbulkchecktempfile.json')  # Create a named temporary file in the output directory

    try:
        with open(csv_path, 'r') as file:  # Open the input CSV file
            csv_reader = csv.reader(file)
            total_rows = sum(1 for row in csv_reader)  # Calculate the total number of rows in the CSV file
            file.seek(0)  # Reset file pointer to beginning

            for i, row in enumerate(csv_reader):  # Process each row in the CSV file
                ip = row[0]  # Extract the IP address from the row

                # Send a request to the AbuseIPDB API to check the IP address
                response = requests.get(f"https://api.abuseipdb.com/api/v2/check?ipAddress={ip}", headers={'Accept': 'application/json', 'Key': api_key})

                if response.status_code == 200:  # If the API request was successful
                    with open(json_temp_path, 'a') as json_file:  # Write the response to the temporary JSON file
                        json_file.write(json.dumps(response.json()) + "\n")
                else:  # If the API request was not successful
                    output_box.delete('1.0', tk.END)  # Clear the output box
                    output_box.insert(tk.END, f"{ip} is not a valid IP!")  # Display an error message

                progress['value'] = (i + 1) / total_rows * 100  # Update the progress bar
                output_box.delete('1.0', tk.END)  # Clear the output box
                output_box.insert(tk.END, f"Processing {i + 1} of {total_rows}")  # Display the current progress
                root.update_idletasks()  # Update the Tkinter GUI

        end_time = time.time()  # Record the end time of the function
        elapsed_time = end_time - start_time  # Calculate the total elapsed time
        elapsed_minutes, elapsed_seconds = divmod(elapsed_time, 60)  # Convert the elapsed time from seconds to minutes and seconds
        elapsed_minutes = math.floor(elapsed_minutes)  # Round down the number of elapsed minutes to the nearest whole number
        elapsed_seconds = round(elapsed_seconds, 1)  # Round the number of elapsed seconds to one decimal place

        # Calculate the average time per IP address. If no rows were processed, set the average time to 0 to avoid division by zero.
        avg_time_per_ip = elapsed_time / total_rows if total_rows > 0 else 0
        avg_time_per_ip = round(avg_time_per_ip, 1)  # Round the average time per IP address to one decimal place

        with open(json_temp_path, 'r') as json_file, open(export_path, 'w', newline='') as csv_file:  # Open the temporary JSON file and the output CSV file
            csv_writer = csv.writer(csv_file)  # Create a CSV writer
            csv_writer.writerow(["ipAddress", "abuseConfidenceScore", "isp", "domain", "countryCode", "totalReports", "lastReportedAt"])  # Write the header row to the CSV file
            for line in json_file:  # Process each line in the JSON file
                data = json.loads(line)["data"]  # Parse the JSON data
                csv_writer.writerow([data["ipAddress"], data["abuseConfidenceScore"], data["isp"], data["domain"], data["countryCode"], data["totalReports"], data["lastReportedAt"]])  # Write the data to the CSV file
    
    except Exception as e:  # Handle any exceptions that occur during the file processing
        output_box.delete('1.0', tk.END)  # Clear the output box
        output_box.insert(tk.END, f"An error occurred: {str(e)}")  # Display the error message

    finally:
        if os.path.exists(json_temp_path):  # If the temporary file exists
            os.remove(json_temp_path)  # Delete the temporary file

    output_box.delete('1.0', tk.END)  # Clear the output box
    output_box.insert(tk.END, f"Started check of {total_rows} IPs at {time.strftime('%b %d %H:%M:%S', time.localtime(start_time))}\nCompleted check at {time.strftime('%b %d %H:%M:%S', time.localtime(end_time))}\nTime elapsed was {elapsed_minutes} minutes and {elapsed_seconds} seconds\nAverage time per IP checked was {avg_time_per_ip} seconds\n\nThe Admiralty commends you for your efforts!") # Display the final results
    
def browse_file(entry):     # Define a function to browse for a file
    filename = filedialog.askopenfilename() # Open a file dialog and get the selected filename
    entry.delete(0, tk.END) # Clear the entry box
    entry.insert(0, filename) # Insert the filename into the entry box

def browse_save_file(entry):  # Define a function to browse for a file save
    filename = filedialog.asksaveasfilename(defaultextension=".csv", filetypes=[("CSV files", "*.csv")])  # Open a save file dialog and get the selected filename
    if filename:  # If a filename was selected
        if os.path.exists(filename):  # If the file already exists
            if messagebox.askokcancel("Warning", "The file already exists. Do you want to overwrite it?"):  # Ask the user if they want to overwrite the existing file
                entry.delete(0, tk.END)  # Clear the entry box
                entry.insert(0, filename)  # Insert the filename into the entry box
        else:  # If the file does not exist
            entry.delete(0, tk.END)  # Clear the entry box
            entry.insert(0, filename)  # Insert the filename into the entry box
def main():
    global root
    root = tk.Tk()  # Create the main window
    root.title("Admiral SYN-ACKbar's AbuseIPDB Bulk Checker")  # Set the title of the window
    root.geometry("500x600")  # Set the size of the window

    frame = ttk.Frame(root, padding="10")  # Create a frame widget
    frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))  # Place the frame on the grid

    # Create and place two title labels
    title_label1 = ttk.Label(frame, text="Admiral SYN-ACKbar's", font=("Sylfaen", 14, "italic"))
    title_label1.grid(row=0, column=0, columnspan=3)
    title_label2 = ttk.Label(frame, text="AbuseIPDB Bulk Checker", font=("Sylfaen", 18, "bold"))
    title_label2.grid(row=1, column=0, columnspan=3)

    # Create and place the API key label and entry box
    api_label = ttk.Label(frame, text="API Key:")
    api_label.grid(row=2, column=0, sticky=tk.W)
    api_entry = ttk.Entry(frame, width=30, show="*")
    api_entry.grid(row=2, column=1, sticky=(tk.W, tk.E))

    # Create and place the CSV input file path label, entry box, and browse button
    csv_label = ttk.Label(frame, text="CSV Input File Path / Name:")
    csv_label.grid(row=3, column=0, sticky=tk.W)
    csv_entry = ttk.Entry(frame, width=30)
    csv_entry.grid(row=3, column=1, sticky=(tk.W, tk.E))
    csv_button = ttk.Button(frame, text="Browse", command=lambda: browse_file(csv_entry))
    csv_button.grid(row=3, column=2, sticky=tk.W)

    # Create and place the CSV export file path label, entry box, and browse button
    export_label = ttk.Label(frame, text="CSV Export File Path / Name:")
    export_label.grid(row=4, column=0, sticky=tk.W)
    export_entry = ttk.Entry(frame, width=30)
    export_entry.grid(row=4, column=1, sticky=(tk.W, tk.E))
    export_button = ttk.Button(frame, text="Browse", command=lambda: browse_save_file(export_entry))
    export_button.grid(row=4, column=2, sticky=tk.W)

    # Create and place the submit button
    style = ttk.Style()
    style.configure('Engage.TButton', font=("Sylfaen", 14, "bold"))
    style.configure('Engage.TButton', background='red')
    submit_button = ttk.Button(frame, text="ENGAGE", command=lambda: bulk_check(csv_entry.get(), api_entry.get(), export_entry.get(), progress, output_box), style='Engage.TButton')
    submit_button.grid(row=5, column=0, columnspan=3, sticky=(tk.W, tk.E))

    # Create and place the output label, progress bar, and output box
    output_label = ttk.Label(frame, text="Output:", font=("Sylfaen", 14, "bold"))
    output_label.grid(row=6, column=0, sticky=tk.W)
    progress = ttk.Progressbar(frame, orient='horizontal', length=300, mode='determinate')
    progress.grid(row=7, column=0, columnspan=3, sticky=(tk.W, tk.E))
    output_box = tk.Text(frame, width=50, height=9)
    output_box.grid(row=8, column=0, columnspan=3, sticky=(tk.W, tk.E))

    # Create and place the quit button
    style.configure('RunAway.TButton', font=("Sylfaen", 14, "bold"))
    style.configure('RunAway.TButton', background='blue')
    quit_button = ttk.Button(frame, text="RUN AWAY", command=root.destroy, style='RunAway.TButton')
    quit_button.grid(row=9, column=0, columnspan=3, sticky=(tk.W, tk.E))

    # Add padding to all child widgets of the frame
    for child in frame.winfo_children(): 
        child.grid_configure(padx=5, pady=5)

    root.mainloop()  # Start the Tkinter event loop

if __name__ == "__main__":
    main()  # Call the main function if the script is being run directly