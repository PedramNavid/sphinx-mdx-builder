# sphinx-mdx-builder

[![PyPI version](https://badge.fury.io/py/sphinxcontrib-mdxbuilder.svg)](https://badge.fury.io/py/sphinxcontrib-mdxbuilder)
[![Python Support](https://img.shields.io/pypi/pyversions/sphinxcontrib-mdxbuilder.svg)](https://pypi.org/project/sphinxcontrib-mdxbuilder/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Sphinx extension that converts reStructuredText (RST) documentation to MDX format for use with Docusaurus and other React-based documentation frameworks.

## Features

- 🔄 **Full RST to MDX conversion** - Converts Sphinx documentation to MDX with React component support
- 📝 **Rich content support** - Handles code blocks, tables, admonitions, cross-references, and more
- 🔗 **Source links** - Automatic generation of GitHub source links for API documentation
- 🎨 **Configurable output** - Flexible configuration options for customizing MDX output
- 📦 **Frontmatter generation** - Automatic YAML frontmatter for Docusaurus integration
- 🚀 **Performance** - Parallel processing support for large documentation projects

## Installation

Install from PyPI:

```bash
pip install sphinxcontrib-mdxbuilder
```

Or install from source:

```bash
git clone https://github.com/PedramNavid/sphinx-mdx-builder.git
cd sphinx-mdx-builder
pip install -e .
```

## Quick Start

1. **Add the extension to your Sphinx configuration** (`conf.py`):

```python
extensions = [
    # ... your other extensions
    'sphinxcontrib.mdxbuilder',
]
```

2. **Configure the extension** (optional):

```python
# MDX builder configuration
mdx_file_suffix = '.mdx'
mdx_github_url = 'https://github.com/your-org/your-repo/blob/main'
mdx_show_source_links = True
mdx_title_suffix = ' | Your Docs'
```

3. **Build your documentation**:

```bash
sphinx-build -b mdx source/ build/mdx/
```

## Configuration Options

The extension supports the following configuration options in your `conf.py`:

| Name                   | Description                                                  | Default |
| ---------------------- | ------------------------------------------------------------ | ------- |
| `mdx_file_suffix`      | File suffix for generated files                             | `.mdx`  |
| `mdx_link_suffix`      | Suffix for internal links                                   | Same as `mdx_file_suffix` |
| `mdx_file_transform`   | Function to transform docname to filename                   | `None` (uses default) |
| `mdx_link_transform`   | Function to transform docname to linkname                   | `None` (uses default) |
| `mdx_title_suffix`     | String to append to title in frontmatter                    | `""` |
| `mdx_title_meta`       | String to append to title in title_meta frontmatter         | `""` |
| `mdx_description_meta` | String to append to title in description frontmatter        | `""` |
| `mdx_max_line_width`   | Maximum line width for wrapped text                         | `120` |
| `mdx_github_url`       | Base URL for GitHub source links                            | `None` (no source links) |
| `mdx_show_source_links`| Whether to show source links                                | `True` |
| `mdx_sidebar_position` | Default sidebar position in Docusaurus                     | `None` |

## Usage Examples

### Basic Configuration

```python
# conf.py
extensions = ['sphinxcontrib.mdxbuilder']

# Basic MDX configuration
mdx_title_suffix = ' | My Documentation'
mdx_github_url = 'https://github.com/myorg/myproject/blob/main'
```

### Advanced Configuration

```python
# conf.py
extensions = ['sphinxcontrib.mdxbuilder']

# Custom file naming
def custom_file_transform(docname):
    """Transform document names to custom file names."""
    return f"docs_{docname.replace('/', '_')}.mdx"

def custom_link_transform(docname):
    """Transform document names to custom link paths."""
    return f"/docs/{docname}"

# Advanced MDX configuration
mdx_file_transform = custom_file_transform
mdx_link_transform = custom_link_transform
mdx_title_suffix = ' | API Reference'
mdx_title_meta = ' - Complete API Documentation'
mdx_description_meta = ' API documentation and examples'
mdx_max_line_width = 100
mdx_github_url = 'https://github.com/myorg/myproject/blob/main'
mdx_show_source_links = True
```

### Integration with Docusaurus

The generated MDX files include Docusaurus-compatible frontmatter:

```yaml
---
title: 'Your Page Title | Your Docs'
sidebar_position: 1
description: 'Page description for SEO'
last_update:
  date: '2024-01-15'
custom_edit_url: null
---
```

## Supported RST Features

The extension supports most Sphinx/RST features:

- ✅ **Text formatting** - Bold, italic, code spans, literals
- ✅ **Headings** - All heading levels with proper MDX conversion
- ✅ **Lists** - Bullet lists, numbered lists, definition lists
- ✅ **Code blocks** - Syntax highlighting with language detection
- ✅ **Tables** - Full table support with alignment
- ✅ **Links** - Internal references, external links, source links
- ✅ **Images** - Image embedding with alt text
- ✅ **Admonitions** - Note, warning, tip, etc. (converted to Docusaurus format)
- ✅ **API documentation** - Python docstrings, modules, classes, functions
- ✅ **Cross-references** - Internal document and section references

## Development

### Setting up for Development

```bash
git clone https://github.com/PedramNavid/sphinx-mdx-builder.git
cd sphinx-mdx-builder
pip install -e .[dev]
```

### Running Tests

```bash
# Run all tests
make test

# Run tests with coverage
pytest --cov=sphinxcontrib.mdxbuilder --cov-report=html

# Run tests against multiple Python/Sphinx versions
tox
```

### Code Quality

```bash
# Format code
make format

# Run linting and type checking
make check

# Run all quality checks
make all
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

### 1.0.0 (2024-12-25)

- Initial standalone release
- Removed Dagster-specific dependencies
- Added comprehensive configuration options
- Improved error handling and documentation
- Added support for Python 3.10-3.12
- Enhanced test coverage

## Acknowledgments

- Originally developed as part of the Dagster project
- Built on top of the excellent Sphinx documentation system
- Designed for integration with Docusaurus and React-based documentation