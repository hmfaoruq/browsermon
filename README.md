# BrowserMon - Simple Python Application

Welcome to BrowserMon, the revolutionary browser monitoring tool designed to provide unparalleled insights into browsing activities. With seamless compatibility with Chrome and Edge browsers, BrowserMon stands as a unique solution in the realm of browser monitoring. Whether operating in real-time mode or scheduled mode, this tool meticulously records browsing histories, capturing a comprehensive range of 17 distinct parameters.

## Features

- **Comprehensive Monitoring**: BrowserMon captures a rich set of 17 browsing parameters, providing a comprehensive view of browsing activities. This depth of data enables accurate analysis and informed decision-making.

- **Data Privacy**: BrowserMon focuses solely on browser history and does not infringe upon broader internet activity or compromise user privacy beyond the scope of browsing data.

- **Non-Intrusive Monitoring**: One of the standout benefits of BrowserMon is its non-intrusive monitoring capability. Regardless of the operating system you’re using, BrowserMon operates seamlessly behind the scenes without causing disruptions or interfering with other data on your system.

## Get Started

### Installation

To install using freeze executable/binaries, download the .zip file and follow the instructions mentioned in the release for your specific operating system.

To build the project:

1. Get the source code:
    ```
    git clone https://github.com/eunomatix/browsermon
    ```

2. Create a Python environment:
    ```
    python -m venv venv
    ```
    Install dependencies in the environment:
    ```
    pip install -r requirements.txt
    ```
    **Note**: For Windows, you will also have to install *pywin32*, which is not present in the requirement.txt file:
    ```
    pip install pywin32
    ```

3. Create executable using PyInstaller:
    ```
    pyinstaller -F src/browsermon.py
    ```
    For Windows:
    ```
    pyinstaller --hiddenimport win32timezone -F src/browsermon.py
    ```

4. Run service install scripts:
    ```
    ./linux_install.sh
    ```
    or
    ```
    Set-ExecutionPolicy RemoteSigned -Force ; .\win_install.ps1
    ```

## License

MIT License

Copyright (c) 2023 Eunomatix

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sub-license, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

**THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.