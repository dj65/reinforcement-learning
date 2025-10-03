.PHONY: install
PYTHON := python # Update to python or python3 or python3.11 etc
install:
	# Downloads the PyGame-Learning-Environment.zip from Github. Avoids using Git to limit the dependencies for this install.
	@$(PYTHON) -c 'from urllib.request import urlopen; from pathlib import Path; Path("PyGame-Learning-Environment.zip").write_bytes(urlopen("https://github.com/ntasfi/PyGame-Learning-Environment/archive/refs/heads/master.zip").read())'
	
	# Extracts the PyGame-Learning-Environment.zip to the local fileshare.
	@$(PYTHON) -c 'import zipfile; zipfile.ZipFile("PyGame-Learning-Environment.zip", "r").extractall("PyGame-Learning-Environment")'
	
	# Installs pipenv to use to manage the virtual environment and the installation of all of the dependencies referenced in the Pipfile.lock. 
	@$(PYTHON) -m pip install pipenv
	
	# Installs all of the dependencies to the virtual environment. Uses the dev flag to install the Flappybird compatible form of PLE.
	@$(PYTHON) -m pipenv install --dev --python 3.11
	
	@echo Done!!! If Jupyter Notebooks does not open automatically then please follow the localhost URL to manually open it.

	# Starts a Juypter Notebook session.
	@$(PYTHON) -m pipenv run jupyter lab
