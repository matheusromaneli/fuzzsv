install-dev:
	python3 -m venv .venv
	.venv/bin/python -m pip install uv
	.venv/bin/uv pip install -e .[dev]
	sudo apt-get install g++ cmake swig
	@ if [ ! -d "~/libiec61850" ]; then\
		git clone https://github.com/mz-automation/libiec61850.git\
		&& cd libiec61850\
		&& cmake .\
		&& make\
		&& cd ..;\
	fi

pytest:
	.venv/bin/pytest .

ruff:
	.venv/bin/ruff check .

fix:
	.venv/bin/ruff check --fix .

mypy:
	.venv/bin/mypy .

qa:
	.venv/bin/ruff check .
	.venv/bin/mypy .
	.venv/bin/pytest .

run:
	.venv/bin/python src

test:
	if [ ! -d "~/libiec61850" ]; then\
		echo "não existe";\
	fi