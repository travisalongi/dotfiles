
#!/bin/bash

# Check if at least one argument (input file) is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <input.tex> [bibliography.bib]"
    exit 1
fi

# Extract the input filename and its base name (without extension)
input_file="$1"
base_name="${input_file%.tex}"

# Check if a bibliography file is provided
if [ -n "$2" ]; then
    bib_file="--bibliography=$2"
else
    bib_file=""
fi

# Run pandoc to convert the LaTeX file to a Word document
pandoc -s "$input_file" $bib_file --citeproc -o "${base_name}.docx"

echo "Conversion complete: ${base_name}.docx"

