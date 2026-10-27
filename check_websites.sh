#!/bin/bash

# List of websites to check
websites=(
    "https://google.com"
    "https://github.com"
    "https://stackoverflow.com"
    "https://nonexistentwebsite12345.com"
)

echo "Starting website reachability check..."
echo "-------------------------------------"

for site in "${websites[@]}"; do
    # Use curl to check HTTP status code with a 5-second timeout
    http_code=$(curl -s -L -o /dev/null --max-time 5 -w "%{http_code}" "$site")

    if [ "$http_code" -eq 200 ] || [ "$http_code" -eq 301 ] || [ "$http_code" -eq 302 ]; then
        echo "[REACHABLE] $site (HTTP Status: $http_code)"
    else
        echo "[UNREACHABLE] $site (HTTP Status: ${http_code:-Connection Failed})"
    fi
done