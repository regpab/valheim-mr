# valheim-mr
Tool for installing and running mods in Valheim for macOS.

---
## Usage
0. (Optional) Move valheim-mr to /usr/local/bin to run it from anywhere by
```bash
cp valheim-mr /usr/local/bin
```
1. Install required tools by
```bash
sudo valheim-mr install
```
The game will launch afterwards. If the console appears after you click F5 in the game, it means the installation was successful.
2. Setup by
```bash
sudo valheim-mr setup
```
3. Add mods using
```bash
sudo valheim-mr add MODE_ARCHIVE.zip
```
4. Run the game using
```bash
valheim-mr run
```
5. Enjoy the Valheim!
---
## Dependencies
- wget
- unzip
- sed

You can ensure that dependencies are installed by running the following command:
```bash
which wget unzip sed
```
If you have 3 lines output, all dependencies are installed.
