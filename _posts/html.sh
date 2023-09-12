#!/bin/bash

# Set the folder path
folder_path="/mnt/c/Users/ian88/java/SateilliteGuessr/Cities"

# Define the HTML file name
html_file="table.html"

# Start building the HTML content
echo "<html>
<head>
    <title>City Information Table</title>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
</head>
<body>
    <table border='1'>
        <thead>
            <tr>
                <th>City</th>
                <th>County</th>
                <th>State</th>
                <th>Population</th>
            </tr>
        </thead>
        <tbody>" > "$html_file"

# Loop through the files in the folder
for file in "$folder_path"/*; do
    # Get the file name without the path
    file_name=$(basename "$file")

    # Split the file name into an array using underscores
    IFS="_" read -ra elements <<< "$file_name"

    # Ensure that there are exactly four elements in the array
    if [ "${#elements[@]}" -eq 4 ]; then
        city="${elements[0]}"
        county="${elements[1]}"
        state="${elements[2]}"
        population="${elements[3]}"

        # Start building the table row for each file
        echo "            <tr>
                <td>$city</td>
                <td>$county</td>
                <td>$state</td>
                <td>$population</td>
            </tr>" >> "$html_file"
    else
        echo "Skipping invalid file name: $file_name"
    fi
done

# Finish building the HTML content
echo "        </tbody>
    </table>
</body>
</html>" >> "$html_file"

echo "HTML table generated in $html_file"
