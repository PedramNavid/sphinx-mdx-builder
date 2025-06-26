# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is `sphinxcontrib-mdxbuilder`, a Sphinx extension that converts reStructuredText (RST) documentation to MDX format for Docusaurus and other React-based documentation frameworks. The package is designed as a standalone, generic solution that can be used with any Sphinx project.

## Development Commands

### Setup
```bash
# Install for development
make install_dev
# or manually: uv pip install -e .[dev]
```

### Testing
```bash
# Run all tests
make test
# or: pytest -v

# Run specific test
pytest tests/test_mdx_builder.py::TestMdxBuilder::test_mdx_files_generated -v

# Run tests across multiple Python/Sphinx versions
tox
```

### Code Quality
```bash
# Format and check code
make all

# Individual commands:
make format    # Format with ruff
make check     # Lint with ruff + type check with mypy
make lint      # Format and auto-fix issues
```

### Building
```bash
# Build package for distribution
uv build

# Test installation from built package
uv pip install dist/sphinxcontrib_mdxbuilder-*.whl
```

### Testing the Extension
```bash
# Build test documentation using the MDX builder
sphinx-build -b mdx tests/test_docs/ /tmp/test_output/
```

## Architecture

### Core Components

**Entry Point (`sphinxcontrib/mdxbuilder/__init__.py`)**
- Registers the `MdxBuilder` with Sphinx
- Defines all configuration options (11 total) that control MDX output behavior
- Configuration includes file naming, GitHub source links, frontmatter generation, and text formatting

**Builder (`sphinxcontrib/mdxbuilder/builders/mdx.py`)**
- `MdxBuilder` class extends Sphinx's `Builder` base class
- Handles parallel processing, file tracking, and orchestrates the conversion process
- Manages configuration inheritance and default value resolution

**Writer/Translator (`sphinxcontrib/mdxbuilder/writers/mdx.py`)**
- `MdxWriter` and `MdxTranslator` handle the actual RST→MDX conversion
- `MdxTranslator` (1200+ lines) contains visit/depart methods for each RST node type
- Handles complex conversions: tables, code blocks, cross-references, API documentation
- Generates Docusaurus-compatible frontmatter with title, description, and metadata
- Manages GitHub source link generation with function unwrapping for decorated objects

### Key Features

**Configuration System**: 11 configuration options in `__init__.py` control all aspects of MDX generation, from file naming to GitHub source links. All options are optional with sensible defaults.

**Source Link Generation**: Complex logic in `writers/mdx.py` (`get_source_github_url` method) unwraps decorated functions to find original source locations for accurate GitHub links.

**Frontmatter Generation**: Automatically generates YAML frontmatter for Docusaurus integration, including title, sidebar positioning, and SEO metadata.

**Parallel Processing**: Builder supports parallel execution for large documentation projects.

### Testing Strategy

Tests use a complete Sphinx project (`tests/test_docs/`) with real RST files that get converted to MDX. The test suite verifies:
- File generation and structure
- Content accuracy and formatting
- Configuration option application
- Source link generation (including decorated functions)
- Frontmatter structure

### Package Structure

```
sphinxcontrib/mdxbuilder/
├── __init__.py           # Sphinx extension entry point & config
├── builders/
│   └── mdx.py           # MdxBuilder class
└── writers/
    └── mdx.py           # MdxWriter & MdxTranslator classes
```

The package follows the `sphinxcontrib` namespace convention and is distributed as `sphinxcontrib-mdxbuilder` on PyPI.

## Configuration Notes

When working with configuration options, remember:
- `mdx_github_url` defaults to `None` (no source links) - this was changed from a Dagster-specific default
- `mdx_show_source_links` controls whether source links appear (defaults to `True` but requires `mdx_github_url`)
- File and link transformation functions can be customized via `mdx_file_transform` and `mdx_link_transform`
- All frontmatter fields (`mdx_title_suffix`, `mdx_title_meta`, `mdx_description_meta`) are optional

## Build and Release

The project uses `uv` for dependency management and follows modern Python packaging standards with `pyproject.toml`. GitHub Actions handle CI/CD with automated testing across Python 3.10-3.12 and Sphinx 7-8.