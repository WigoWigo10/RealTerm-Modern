# RealTerm: The Next Generation

![Project Status](https://img.shields.io/badge/status-Phase%201%3A%20Codebase%20Modernization-blueviolet)
![License](https://img.shields.io/github/license/WigoWigo10/RealTerm-Modern)
![Last Commit](https://img.shields.io/github/last-commit/WigoWigo10/RealTerm-Modern)

This is an open-source initiative to modernize the classic **RealTerm** serial terminal for Windows. While RealTerm remains a powerful and beloved tool for engineers and developers, its codebase and user interface reflect an older era of software development.

This project aims to bring RealTerm into the modern development landscape by focusing on three core pillars:

* **Codebase Refactoring:** Migrating the original Object Pascal source code to the latest version of Delphi, replacing obsolete components, and improving the architecture for stability and maintainability.
* **UI/UX Redesign:** Rebuilding the user interface with the modern Delphi VCL framework to provide a clean, intuitive, and responsive user experience, including support for high-DPI displays and themes (light/dark).
* **Modern Automation API:** Evolving the scripting capabilities from legacy ActiveX/COM to a more robust solution, such as an enhanced command-line interface (CLI) or a REST API.

---

## 🖼️ Visuals (Coming Soon)

![RealTerm Modern UI Placeholder](https://user-images.githubusercontent.com/2889315/213349072-68569264-1294-433c-a8c7-951e39f3b17c.png)


---

## 🗺️ Project Roadmap

This project is being developed in phases. The current status is:

-   [x] **Planning:** Defining project phases and setting up the development environment.
-   [ ] **Phase 1: Codebase Modernization**
    -   [ ] Compile the original project in the latest Delphi version.
    -   [ ] Resolve compatibility issues (Unicode, deprecated functions).
    -   [ ] Replace the `AsyncPro` serial communication library with a modern alternative (e.g., `TComPort`).
    -   [ ] Refactor the main unit (`realterm1.pas`) to separate business logic from the UI.
-   [ ] **Phase 2: UI/UX Modernization**
    -   [ ] Redesign the main layout to improve usability.
    -   [ ] Implement VCL theme support (light and dark modes).
    -   [ ] Replace all icons with a high-resolution (SVG) icon set.
-   [ ] **Phase 3: Automation API**
    -   [ ] Design and implement a robust command-line interface (CLI).

---

## 🚀 Getting Started / How to Compile

To compile this project, you will need:

1.  **IDE:** [**Embarcadero Delphi Community Edition**](https://www.embarcadero.com/products/delphi/starter) (version 11 Alexandria or newer).
2.  **Repository:** Clone this repository to your local machine:
    ```bash
    git clone [https://github.com/WigoWigo10/RealTerm-Modern.git](https://github.com/WigoWigo10/RealTerm-Modern.git)
    ```
3.  **Dependencies:** (This section will be updated as new libraries are added).
4.  **Compilation:** Open the `.dproj` project file in Delphi and compile (F9).

---

## 🤝 How to Contribute

Currently, the project is in its initial structuring phase. If you are interested in contributing in the future, please open an **Issue** to discuss the change you would like to make. The standard workflow will be Fork & Pull Request.

---

## 🙏 Acknowledgments

This project is only possible thanks to the incredible work of **Simon Bridgeman**, the original author of RealTerm, and all the project's contributors over the years. This effort is a tribute and an attempt to continue his legacy.

The original project can be found on [SourceForge](https://sourceforge.net/projects/realterm/).

---

## 📄 License

This project is distributed under the **MIT License**. See the `LICENSE` file for more details.