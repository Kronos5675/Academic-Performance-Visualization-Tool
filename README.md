# Academic Performance Visualization Tool

## Overview
The **Academic Performance Visualization Tool** is a Python and Bash-based tool for analyzing and visualizing student academic performance data extracted from PDF marksheets. This tool processes student data, performs various analysis, and generates visualizations to help understand student performance trends.

## Project Structure
- **`extract_grades.sh`**: Shell script to extract individual student grade data from a PDF and format it into JSON.
- **`main.py`**: Python script that processes and visualizes the data.
- **`process_batch.sh`**: Processes multiple PDFs in a batch and generates a combined results JSON file.

## Features
- Extracts student details and grades from PDFs.
- Combines all student data into a single JSON file.
- Converts letter grades to numeric values for analysis.
- Visualizations include:
  - Average final grades per subject.
  - Internal (CA), End Sem (ESE), and Practical grade trends.
  - GPA distribution across students.
  - Final grade trend per student.
  - Topper's detailed grade breakdown.

## Requirements
- **Python 3.x**
- **Bash** (for running shell scripts)
- **pdftotext** (for PDF text extraction)
- **GPG** (for encrypting JSON files)
- **Python Libraries**:
  - `pandas`
  - `plotly`
  - `gnupg`
  - `python-dotenv`
  - `jq` (optional, for prettifying JSON)

##  How to Use

### Extract Grades from Individual PDFs
Use the following command to extract grades from a student’s PDF and output the result to a JSON file:

bash
./extract_grades.sh path/to/student.pdf > student.json


---

### Combine All Student JSONs into One File
You can process multiple student PDFs from a folder and combine them into a single `combined_results.json` file:

bash
./combine_json.sh path/to/pdf_folder


---

###  Visualize the Results
Run the Python script to analyze and visualize the data:
env
GPG_PASSWORD=your_passphrase


---

##  Visualizations

- **Average Grade Comparison per Subject**  
  Displays a bar chart showing the average final grade across all subjects.

- **GPA Bar Chart for All Students**  
  Shows the distribution of GPA among all students.

- **Line Graph of Each Student's Subject-Wise Grades**  
  Tracks how each student performs across different subjects.

- **Topper's Detailed Performance Breakdown**  
  Presents the topper's grades across CA, ESE, Practical, and Final components.

---

##  Dependencies

###  Shell Scripts:
- `pdftotext` – For converting PDF content to plain text  
- `jq` *(optional)* – For formatting JSON output  
- `GPG` – For encrypting/decrypting JSON data

### Python Libraries:
- `pandas` – Data processing and manipulation  
- `plotly` – Interactive visualizations  
- `gnupg` – GPG decryption of result files  
- `python-dotenv` – Loading environment variables for secure credentials

---

##  Resolved Issues

1. **Bar Graphs Showing Numeric Grades Instead of Letter Grades**  
   ➤ Modified the bar graphs to display letter grades for clearer visual interpretation.

2. **Colorblind-Friendly Bar Graphs**  
   ➤ Updated color palettes to high-contrast, colorblind-friendly schemes.

3. **Incorrect Extraction of Grades from Course Names**  
   ➤ Enhanced the shell script logic to avoid misidentifying characters in subject names as grades.

4. **Security Risk with Storing Grades in Plain JSON**  
   ➤ Introduced GPG encryption with `.gpg` storage and password-protected access.

5. **Unused Python Code in Shell Scripts**  
   ➤ Removed redundant code to streamline project structure and improve maintainability.

---

##  License

This project is licensed under the [MIT License](LICENSE).

---

##  Contributors

- **Soham** – Repo setup, data security, PR management  
- **Veer** – Scripting, automation, issue resolution  
- **Yasaswini** – Documentation, debugging, data accuracy  
- **Samriddhi** – Visualization, accessibility, script enhancements  


