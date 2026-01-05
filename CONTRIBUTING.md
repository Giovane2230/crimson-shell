# Contributing to Crimson Shell

Thanks for your interest in contributing to Crimson Shell! This guide will help you get started.

## Getting Started

### Prerequisites

- [QuickShell](https://quickshell.org/) installed on your system
- Basic knowledge of QML (Qt Modeling Language)
- A Wayland or X11 desktop environment

### Setting Up Development Environment

1. Fork and clone the repository
```bash
git clone https://github.com/yourusername/crimson-shell.git
cd crimson-shell
```

2. Check QuickShell documentation
- [QuickShell Docs](https://quickshell.org/docs/)
- [QML Documentation](https://doc.qt.io/qt-6/qmlapplications.html)

3. Run the shell in development mode
```bash
# Command will be added once we have a working version
```

## Project Structure

```
crimson-shell/
├── src/           # Main shell components
├── widgets/       # Individual widgets
├── themes/        # Theme configurations
├── config/        # Default configurations
└── docs/          # Documentation
```

Note: Structure may change as the project evolves.

## How to Contribute

### Reporting Bugs

- Use GitHub Issues
- Describe what you expected vs what happened
- Include your environment details (OS, QuickShell version, etc.)
- Add screenshots if relevant

### Suggesting Features

- Open an issue with the "enhancement" label
- Explain the use case
- Describe how it would work

### Code Contributions

1. **Pick an issue** or create one describing what you want to work on
2. **Create a branch** from main
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Write your code**
   - Follow existing code style
   - Keep QML components modular and reusable
   - Comment complex logic
4. **Test your changes** thoroughly
5. **Commit with clear messages**
   ```bash
   git commit -m "Add: new widget for system monitor"
   ```
6. **Push and create a Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

### Commit Message Guidelines

- Start with a verb: Add, Fix, Update, Remove, Refactor
- Be clear and concise
- Examples:
  - `Add: clock widget with date display`
  - `Fix: bar positioning on multi-monitor setup`
  - `Update: theme configuration format`

### Code Style

- Use clear, descriptive variable names
- Keep components small and focused
- Follow QML best practices
- Use 2 or 4 spaces for indentation (we'll decide on a standard)

## Learning Resources

### QuickShell
- [Official Documentation](https://quickshell.org/docs/)
- [GitHub Repository](https://github.com/quickshell-mirror/quickshell)

### QML
- [Qt QML Documentation](https://doc.qt.io/qt-6/qmlapplications.html)
- [QML Tutorial](https://doc.qt.io/qt-6/qml-tutorial.html)

### Desktop Shell Concepts
- Look at other shells for inspiration: Waybar, Polybar, Awesome WM
- Study Wayland/X11 protocols if working on window management

## Questions?

- Open a GitHub Discussion
- Check existing issues and PRs
- Read QuickShell documentation

## Code of Conduct

Be respectful and constructive. We're all learning and building this together.

---

Thank you for contributing to Crimson Shell!
