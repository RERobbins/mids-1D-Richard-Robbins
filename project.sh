#!/bin/bash

FILES="images/*"

# Pass each filename through iconv where non ASCII characters are translated to
# their nearest equivalents and rename only the files with non ASCII characters

for original_name in $FILES
do
    refined_name=$(iconv -t ASCII//TRANSLIT <<< $original_name)
    if [[ "$original_name" != "$refined_name" ]]
    then
	mv "$original_name" "$refined_name"
    fi
done

# Assemble the index header file up to the rows of images.

cat <<EOF
<!doctype html>
<html>
  <head>
    <title>This is the title of the webpage!</title>
  </head>
  <body>
   <center>
    <h1>MATH COLLECTION</h1>
   </center>

  <table border="5" bordercolor="red" align="center">
    <tr>
        <th colspan="3">PICTURES</th> 
    </tr>
EOF

# Read from the list of files in the image directory three names at a time.
# Build a row in the index with the three files to appear in that row.
# Read returns an empty string for reads past the end of the input stream.
# So, we look to see if the second and third names are set before adding
# either to that row.

while read -r name_1; do
    read -r name_2
    read -r name_3
    echo "<tr>"
    echo "    <td><img src=\""$name_1"\" alt="" border=3 height=100 width=300></th>"
    if [ -n "$name_2" ]
    then
	echo "    <td><img src=\""$name_2"\" alt="" border=3 height=100 width=300></th>"
    fi

    if [ -n "$name_3" ]
    then
	echo "    <td><img src=\""$name_3"\" alt="" border=3 height=100 width=300></th>"
    fi

    echo "</tr>"
    echo
done <<< $(ls $FILES)


# Assemble the tail of the index file.

cat <<EOF
  </table>
  </body>
</html>
EOF
