install:
	uv pip install -e .

install_dev: install
	uv pip install -e .[dev]

lint:
	ruff format .
	ruff check --fix 

lint_check:
	ruff check
	ruff format --check

format:
	ruff format .

check:
	ruff check
	mypy .

all: format check

test:
	pytest -v
