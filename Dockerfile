# This Dockerfile sets up a Python environment for a Flask application. 
# It uses the official Python 3.10 image as the base, installs the required 
# dependencies from the requirements.txt file, and copies the application code into the container. 
# Finally, it specifies the command to run the demo.py script when the container starts.

# Use the official Python 3.10 image as the base image
# This image includes Python 3.10 and is maintained by the Python community, 
# ensuring it has the necessary runtime environment for our application.
# The "FROM" instruction specifies the base image for the Docker image we are building.
# Think of it as: Start building my container from this Python 3.10 image.
FROM python:3.10

# Set the working directory in the container to /app. This is where our application code will reside.
# The "WORKDIR" instruction sets the working directory for any subsequent commands in the Dockerfile.
# By creating the directory, you do not have to type out full paths for commands but can use relative
# paths instead. It also helps to keep the container organized by having a designated directory for 
# the application.

# It also means that when the container is running, it will start in this directory.
# By setting the working directory to /app, we ensure that all our application files are organized 
# in one place within the container.
WORKDIR /app

# Copy the requirements.txt file into the container and install the dependencies.
# The "COPY" instruction copies files from the host machine (where you build the Docker image) 
# into the container. Here, we are copying the requirements.txt file to the /app directory in the container.
# The COPY instruction takes two arguments: the source file (requirements.txt) and the destination 
# path in the container (/app/requirements.txt).
COPY requirements.txt requirements.txt

# The "RUN" instruction executes a command in the container. Here, we are using pip to install the 
# dependencies listed in requirements.txt. The "--no-cache-dir" option tells pip not to cache the 
# downloaded packages, which helps to reduce the size of the Docker image.
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container. This includes the demo.py file and any
# other necessary files for the application to run. By copying all the files, we ensure that the
# application has everything it needs to function properly when the container is running.
COPY . .

# Set the command to run the demo.py script when the container starts
# The "CMD" instruction specifies the command to run when the container starts. Here, we are telling
# the container to execute the demo.py script using Python. This means that when you run the container, 
# it will automatically start the application by running this script.
#    >> python demo.py is the command that will be executed when the container starts. 
CMD ["python", "demo.py"]