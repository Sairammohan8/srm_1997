#!/bin/bash

# Function to check Apache2 service status
check_apache_status() {
    # Check if Apache2 is running
    if systemctl is-active --quiet apache2; then
        echo "Apache2 is running."
    else
        echo "Apache2 is not running. Restarting..."
        systemctl restart apache2
        echo "Apache2 has been restarted."
    fi
}

# Main function to execute monitoring
main() {
    echo "Starting Apache2 service monitoring..."
    while true; do
        check_apache_status
        # Check every 60 seconds
        sleep 60
    done
}

# Execute the main function
main
