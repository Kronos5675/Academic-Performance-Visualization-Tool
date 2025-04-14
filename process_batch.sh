#!/bin/bash

# Usage check
if [ -z "$1" ]; then
  echo "Usage: $0 <folder>"
  exit 1
fi

folder="$1"
output_file="combined_results.json"
gpg_encrypted_file="combined_results.json.gpg"
gpg_passphrase="password123"

echo "[" > "$output_file"
first=1

for pdf in "$folder"/*.pdf; do
  if [[ -f "$pdf" ]]; then
    json=$(./extract_grades.sh "$pdf")

    if [[ $first -eq 0 ]]; then
      echo "," >> "$output_file"
    fi

    echo "$json" >> "$output_file"
    first=0
  fi
done

echo "]" >> "$output_file"

# Optional: Prettify with jq
if command -v jq &> /dev/null; then
  jq '.' "$output_file" > tmp.json && mv tmp.json "$output_file"
fi

# Encrypt the JSON file with GPG
gpg --batch --yes --passphrase "$gpg_passphrase" -c "$output_file"

echo "✅ Encrypted $output_file -> $gpg_encrypted_file"
rm "$output_file"  # Optional: remove unencrypted JSON

# Run the Python visualization
echo "Visualizing results"
python3 main.py
