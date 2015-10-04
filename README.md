# pastesl
Bash script to make a paste at the simply linux pastebin

# Usage
Run the script as follows:
```
pastesl /path/to/file
```
You will then be asked for how long the paste should be available and what syntax highlighting should be used

# Installation

## Nixos

There's a pastesl.nix provided. Copy that to your /etc/nixos folder.
Then edit your configuration.nix and find the following block:
```
environment.systemPackages = with pkgs; [
];
```
add between the [ ] brackets the following line

```
(pkgs.callPackage ./pastesl.nix {})
```

## Other Distros

Download the pastesl script, move it to /usr/bin/, make it executable.