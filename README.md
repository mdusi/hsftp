# Hsftp: SFTP client tools for secure file transfer operations.

Usage of hsftp
-----------------

```
Hsftp 1.0.1. Usage: hsftp OPTION

hsftp [OPTIONS] [ITEM]

Common flags:
  -c --conf=FILE          Load conf from file
     --from-date=DATE     Filter files by date (expected format YYYY-MM-DD
                          HH:MM UTC|PST|...)
  -e --extensions=ITEM    Filter files by extensions
  -u --up                 upload
  -d --down               download
     --transfer-from=DIR  Folder to transfer from
     --transfer-to=ITEM   Folder to transfer to
     --archive-to=DIR     Folder to archive to after upload

Miscellaneous:
     --verbose=INT        Verbose level: 1, 2 or 3
  -? --help               Display help message
  -V --version            Print version information
     --numeric-version    Print just the version number
```

Example of conf.yaml
--------------------

```
remote:
        hostname: sftp.domain.com
        port: 22
        username: username
        password: password
        known_hosts: /home/user/.ssh/known_hosts
```

# Usage

## Download from remote to local - filter by date and extension

```
hsftp -c conf.yaml -d \
    --from-date "2024-06-14 12:15 PDT" \
    --transfer-from /path/to/remote/folder \
    --transfer-to /path/to/local/folder \
    -e xml
```

## Upload from local to remote - filter by extensions

```
hsftp -c conf.yaml -u \
    --from-date "2024-06-14 12:15 PDT" \
    --transfer-from /path/to/local/folder \
    --transfer-to /path/to/remote/folder \
    -e xml -e Xml
```

## Upload from local to remote - archive files locally after upload

```
hsftp -c conf.yaml -u \
    --from-date "2024-06-14 12:15 PDT" \
    --transfer-from /path/to/local/folder \
    --transfer-to /path/to/remote/folder \
    --archive-to /path/to/local/archive/folder \
    -e xml -e Xml
```
