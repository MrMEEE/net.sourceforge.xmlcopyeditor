# XML Copy Editor Flatpak

This repository contains the Flatpak manifest for [XML Copy Editor](https://xml-copy-editor.sourceforge.io/), a fast, free, validating XML editor.

## Application ID

`net.sourceforge.xmlcopyeditor`

This follows the standard Flatpak naming convention using reverse domain notation based on the SourceForge hosting platform.

## Runtime

The Flatpak uses **org.freedesktop.Platform** runtime version 25.08, which is based on Red Hat's freedesktop-sdk. This provides a stable, well-maintained base for the application.

## Building the Flatpak

### Prerequisites

Ensure you have `flatpak` and `flatpak-builder` installed:

```bash
# On Fedora/RHEL
sudo dnf install flatpak flatpak-builder

# On Ubuntu/Debian
sudo apt install flatpak flatpak-builder

# On Arch Linux
sudo pacman -S flatpak flatpak-builder
```

Add the Flathub repository (if not already added):

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Install the required runtime and SDK:

```bash
flatpak install flathub org.freedesktop.Platform//25.08 org.freedesktop.Sdk//25.08
```

### Build

To build the Flatpak:

```bash
flatpak-builder --repo=repo --force-clean build-dir net.sourceforge.xmlcopyeditor.yaml
```

### Install Locally

To install the built Flatpak locally:

```bash
flatpak-builder --user --install --force-clean build-dir net.sourceforge.xmlcopyeditor.yaml
```

### Test

Run the application:

```bash
flatpak run net.sourceforge.xmlcopyeditor
```

## Creating a Bundle

To create a single-file bundle for distribution:

```bash
flatpak build-bundle repo xmlcopyeditor.flatpak net.sourceforge.xmlcopyeditor
```

Install the bundle:

```bash
flatpak install xmlcopyeditor.flatpak
```

## Application Features

- **Validation**: DTD/XML Schema/RELAX NG validation
- **XSLT/XPath**: Full support for transformations and queries
- **Pretty-printing**: Format XML documents with proper indentation
- **Syntax highlighting**: Color-coded XML elements
- **Element folding**: Collapse and expand XML structures
- **Tag completion**: Auto-complete XML tags
- **Tag locking**: Prevent accidental tag editing
- **Tag-free editing**: Edit content without seeing tags
- **Built-in support**: XHTML, XSL, DocBook, TEI
- **Schema generation**: Create XML Schema from documents
- **Spell checking**: Built-in spell checker with Enchant

## File Structure

- `net.sourceforge.xmlcopyeditor.yaml` - Main Flatpak manifest
- `net.sourceforge.xmlcopyeditor.desktop` - Desktop entry file
- `net.sourceforge.xmlcopyeditor.metainfo.xml` - AppStream metadata

## Version

Current version: **1.3.1.0**

Release date: October 8, 2022

## Dependencies

The Flatpak includes:
- wxWidgets 3.0.5 (GUI toolkit)
- Xerces-C++ 3.2.5 (XML parser)
- Boost 1.83.0 (C++ libraries, headers only)
- libxml2 (system)
- libxslt (system)
- libpcre2 (system)
- Enchant (system, spell checking)

## License

XML Copy Editor is released under the GNU General Public License version 2 or later (GPL-2.0-or-later).

## Links

- [Official Website](https://xml-copy-editor.sourceforge.io/)
- [SourceForge Project](https://sourceforge.net/projects/xml-copy-editor/)
- [Bug Tracker](https://sourceforge.net/p/xml-copy-editor/bugs/)
- [Wiki/Documentation](https://xml-copy-editor.wiki.sourceforge.net/)
- [Forum](https://sourceforge.net/forum/forum.php?forum_id=475215)

## Permissions

The Flatpak requests the following permissions:

- **X11 and Wayland**: For graphical display
- **IPC**: Required for X11 shared memory
- **OpenGL/DRI**: For hardware acceleration
- **Network**: For accessing online resources (DTDs, schemas)
- **Home directory access**: To open and save XML files
- **XDG Documents**: Access to Documents folder

## Notes

- XML Copy Editor is built with wxWidgets 3.0 for modern GTK3 support
- Includes full validation support for XML documents
- Spell checking requires Enchant library (included in the runtime)
- The application supports multiple languages (Catalan, Chinese, Dutch, English, French, German, Italian, Slovak, Swedish, Ukrainian)

## Troubleshooting

If the application doesn't start:

```bash
# Check logs
flatpak run net.sourceforge.xmlcopyeditor --verbose

# Or use journalctl
journalctl --user -xe | grep xmlcopyeditor
```

If you encounter permission issues:

```bash
# Grant additional permissions if needed
flatpak override --user --filesystem=/path/to/your/xml/files net.sourceforge.xmlcopyeditor
```
