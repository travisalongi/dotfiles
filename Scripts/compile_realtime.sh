
# Assign input argument to a variable
input_file=$1

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "File not found: $input_file"
    exit 1
fi

# Perform an action on the file (for example, display its contents)
echo "Processing file: $input_file"
latexmk -pdf -pvc  "$input_file"
