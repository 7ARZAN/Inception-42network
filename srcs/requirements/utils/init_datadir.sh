if [ ! -d "/home/elakhfif/data" ]; then
	echo "Creating directories..."

	mkdir -p "/home/$USER/data/database"
    	mkdir -p "/home/$USER/data/wordprss_files"

    	echo "Directories created successfully!"
else
	echo "The directory '/home/elakhfif/data' already exists."
fi
