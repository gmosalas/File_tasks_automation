#!/bin/bash

# File Manipulation Script

# Function to rename files in a directory

rename_files() {
	 read -p "Enter the directory path: " directory
	 read -p "Enter the pattern to match: " pattern
	 read -p "Enter the new name: " new_name

	 cd "$directory" || exit 1

	 for file in *"$pattern"*; do
		 new_file="${file//$pattern/$new_name}"
		 mv "$file" "$new_file"
		 echo "Renamed $file to $new_file"
	done
}

# Function to copy files from one directory to another
copy_files() {
	 read -p "Enter the source directory path: " source_dir
	 read -p "Enter the destination directory path: " dest_dir

	 cp -r "$source_dir"/* "$dest_dir"
	 echo "Files copied successfully."
}

# Function to search for a pattern within files
search_files() {
	read -p "Enter the directory path: " directory
	read -p "Enter the pattern to search: " pattern

	grep -rnw "$directory" -e "$pattern"
}

# Display available options
display_options() {
	echo "Available options:"
	echo "1. Rename files"
	echo "2. Copy files"
	echo "3. Search for a pattern within files"
	echo "4. Exit"
}

# Main menu
while true; do
	display_options

	# Read user input
	read -p "Enter your choice: " choice

	case $choice in
		1)
			rename_files
			;;
		2)
			copy_files
			;;
		3)
			search_files
			;;
		4)
			echo "Exiting..."
			exit 0
			;;
		*)
			echo "Invalid option. Please try again."
			;;
	esac
	echo ""
done

