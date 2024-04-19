# git-local-prune

A git tool to clean the local branches that are deleted [gone] on remote

## Install

You can install `git-local-prune` using one of the options listed below

| Source   | Command                                                                                                                  |
| -------- | ------------------------------------------------------------------------------------------------------------------------ |
| curl     | `curl -L https://raw.githubusercontent.com/MathieuDoyon/git-local-prune/master/installer.sh \| sudo sh`                  |
| npm      | `npm install -g git-local-prune`                                                                                         |
| manual   | Clone and run `make install`                                                                                             |
| git-bash | For Windows : `curl -L https://raw.githubusercontent.com/MathieuDoyon/git-local-prune/master/windows-installer.sh \| sh` |

<!-- TODO add brew tap etc. -->
<!-- | brew | `brew update && brew install git-local-prune` | -->
<!-- | aur | `pacaur -S git-local-prune-git` | -->

## Usage

Simply run it in your project directory and it will give you the output from the last working day

```shell
git local-prune
```

If you run it in a folder containing multiple git repositories, it will go through each of the projects and give you the local-prune report for each one of them.

## Options

You can pass several options to modify how git-local-prune behaves

```shell
git local-prune [-m <max-dir-depth>]
            [-f]
            [-F]
            [-r]
            [-L]
            [-h]
```

git local-prune [-m <max-dir-depth>] [-f] [-F] [-r] [-F] [-L] [-h]

Here is the detail for each of the options

| Option | Description                                                                                 |
| ------ | ------------------------------------------------------------------------------------------- |
| m      | Specify the depth of recursive directory search e.g. `-m 3` defaults to two                 |
| f      | Fetch the latest commits beforehand                                                         |
| F      | Force recursion up to specified depth even when git repository found earlier                |
| L      | Toggle inclusion of symbolic links in recursive directory search                            |
| h      | Display the help screen                                                                     |
| r      | Generates the local-prune report file `git-local-prune-report.txt` in the current directory |

For the basic usage, all you have to do is run `git local-prune` in a repository or a folder containing multiple repositories

## Single Repository Usage

To check all your personal commits from last working day, head to the project repository and run

```shell
$ git local-prune
```

## Directory depth

By default the script searches only in the current directory or one
level deep. If you want to increase that, use the `-m` switch.
If the base directory is a git repository you can use the `-F` switch to force the recursion.

```shell
$ git local-prune -m 3
```

### Directory whitelisting

If you want to restrict the local-prune to some paths, you can whitelist them by adding them to a `.git-local-prune-whitelist` file. For example if you have the below directory structure

    ├── Workspace              # All your projects are here
    │   ├── project-a          # Some git repository called project-a
    │   ├── project-b          # Some git repository called project-b
    │   ├── sketch-files       # Some sketch files
    │   ├── mockups            # Some balsamiq mockups
    │   └── ...                # etc.
    └── ...

And you want the `git-local-prune` to show logs for only `project-a` and `project-b`, you can do that by creating a `.git-local-prune-whitelist` file under the `Workspace` directory with the below contents and it will only consider these directories for the local-prune

```
project-a
project-b
```

## Fetch commits before showing local-prune

If you have many repositories that you want to generate a local-prune for, it may be useful to automatically run `git fetch` before viewing the local-prune.

If you would like to automatically run `git fetch --all` before printing the local-prune, you can add the `-f` flag, as show below

```shell
$ git git local-prune -f
```

## Mixing options

Of course you can mix the options together but please note that if you provide the number of days, it will override the weekdays configuration (`MON-FRI`) and will show you the commits specifically from `n` days ago.

```shell
# Show all the John Doe's commits from 5 days ago
$ git local-prune -m 5 -r -f
```

## License

MIT © [Mathieu Doyon](https://github.com/MathieuDoyon)
