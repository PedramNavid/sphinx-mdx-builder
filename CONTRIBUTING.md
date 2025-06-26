# Contributing to sphinx-mdx-builder

Thank you for your interest in contributing to sphinx-mdx-builder! This document provides guidelines and information for contributors.

## Development Setup

1. **Fork and clone the repository**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/sphinx-mdx-builder.git
   cd sphinx-mdx-builder
   ```

2. **Create a virtual environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install the package in development mode**:
   ```bash
   make install_dev
   # or manually:
   pip install -e .[dev]
   ```

## Code Style and Quality

We use several tools to maintain code quality:

- **Ruff** for linting and formatting
- **MyPy** for type checking
- **pytest** for testing

### Running Quality Checks

```bash
# Format code
make format

# Run linting and type checking
make check

# Run all quality checks
make all
```

### Pre-commit Hooks

We recommend setting up pre-commit hooks to automatically run quality checks:

```bash
pip install pre-commit
pre-commit install
```

## Testing

### Running Tests

```bash
# Run all tests
make test

# Run tests with coverage
pytest --cov=sphinxcontrib.mdxbuilder --cov-report=html

# Run tests against multiple Python/Sphinx versions
tox
```

### Writing Tests

- Place test files in the `tests/` directory
- Use descriptive test names
- Include docstrings for test functions
- Test both happy path and error conditions
- Add tests for new features or bug fixes

### Test Structure

```python
def test_feature_description():
    """Test that feature works as expected."""
    # Arrange
    setup_data = create_test_data()
    
    # Act
    result = function_under_test(setup_data)
    
    # Assert
    assert result == expected_result
```

## Submitting Changes

### Pull Request Process

1. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**:
   - Write clean, readable code
   - Add tests for new functionality
   - Update documentation as needed
   - Follow the existing code style

3. **Run quality checks**:
   ```bash
   make all
   make test
   ```

4. **Commit your changes**:
   ```bash
   git add .
   git commit -m "Add descriptive commit message"
   ```

5. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**:
   - Use a descriptive title
   - Include a detailed description of changes
   - Reference any related issues
   - Include screenshots if applicable

### Pull Request Guidelines

- **Keep PRs focused**: One feature or fix per PR
- **Write good commit messages**: Use present tense, be descriptive
- **Update documentation**: Include relevant documentation updates
- **Add tests**: Ensure new code is properly tested
- **Check CI**: Make sure all CI checks pass

## Code Guidelines

### Python Style

- Follow PEP 8 (enforced by Ruff)
- Use type hints for all functions and methods
- Write descriptive variable and function names
- Keep functions small and focused
- Add docstrings for public functions and classes

### Documentation

- Use clear, concise language
- Include code examples where helpful
- Update README.md for significant changes
- Add inline comments for complex logic

## Issue Guidelines

### Reporting Bugs

When reporting bugs, please include:

- **Description**: Clear description of the issue
- **Environment**: Python version, Sphinx version, OS
- **Reproduction steps**: Minimal steps to reproduce
- **Expected behavior**: What should happen
- **Actual behavior**: What actually happens
- **Code samples**: Minimal reproducible example

### Feature Requests

For feature requests, please include:

- **Use case**: Why is this feature needed?
- **Description**: Detailed description of the feature
- **Examples**: How would it be used?
- **Alternatives**: What alternatives have you considered?

### Issue Labels

We use labels to organize issues:

- `bug`: Something isn't working
- `enhancement`: New feature or request
- `documentation`: Improvements or additions to documentation
- `good first issue`: Good for newcomers
- `help wanted`: Extra attention is needed

## Code of Conduct

### Our Standards

- **Be respectful**: Treat everyone with respect and kindness
- **Be inclusive**: Welcome people of all backgrounds and experience levels
- **Be collaborative**: Work together constructively
- **Be helpful**: Help others learn and contribute

### Enforcement

Instances of unacceptable behavior may be reported to the project maintainers. All complaints will be reviewed and investigated promptly and fairly.

## Getting Help

If you need help or have questions:

- **GitHub Issues**: For bug reports and feature requests
- **GitHub Discussions**: For questions and general discussion
- **Email**: Contact the maintainers directly for sensitive issues

## Recognition

Contributors will be recognized in:

- The project README
- Release notes for significant contributions
- GitHub contributors list

Thank you for contributing to sphinx-mdx-builder!