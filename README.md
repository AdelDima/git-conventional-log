# Zsh Git Automation Script

This repository contains a Zsh script that simplifies git workflows, in compliance with the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) and [commitlint](https://commitlint.js.org/) guidelines. This script encapsulates multiple git commands into one and automatically generates a meaningful commit message based on your input, including support for scopes.

## Functions

This script provides functions to execute Git commands with a message conforming to Conventional Commits specification. The types of functions available include:

- Build (gbuild)
- Chore (gchore)
- CI (gci)
- Docs (gdocs)
- Feature (gfeat)
- Fix (gfix)
- Performance Improvement (gperf)
- Refactor (grf)
- Style (gsty)
- Test (gtst)

Each function supports optional scope input. For example, using `gfix -s server "fixed a bug"` would execute `git add .`, `git commit -m "fix(server): fixed a bug"`, and `git push`.

## Usage

1. Clone this repository to your local machine.
2. In your terminal, navigate to the directory containing the script.
3. Source the script in your Zsh configuration file (usually `.zshrc`), with `source path_to_script.zsh`.
4. Now, you can use the script functions in your terminal with git.

Each function supports optional scope and subject input. For example, to make a commit with a "fix" type and a "server" scope:

`gfix -s server "fixed a bug"`

This would execute `git add .`, `git commit -m "fix(server): fixed a bug"`, and `git push`.

If you want to include multiple scopes, separate them with slashes, backslashes, or commas. For example:

`gfeat "ui/backend" "implemented new feature"`

This would execute `git add .`, `git commit -m "feat(ui/backend): implemented new feature"`, and `git push`.

## Bash/Zsh Workflow

For quick prototyping, I have made the following functions that you can add to your .bashrc/.zshrc files and use Emoji-Log quickly.

```sh
    # Git Commit, Add all, and Push — in one step.
    # General commit function
    function gcap() {
        git add . && git commit -m "$1" && git push
    }

    # Helper function for generating the commit message
    function generate_commit_message() {
        local type=$1; shift
        if [[ $1 = '-s' ]]; then
            local scope=$2; shift 2
            echo "$type($scope): $*"
        else
            echo "$type: $*"
        fi
    }

    # Build
    function gbuild() {
        gcap "$(generate_commit_message "build" "$@")"
    }

    # Chore
    function gchore() {
        gcap "$(generate_commit_message "chore" "$@")"
    }

    # CI
    function gci() {
        gcap "$(generate_commit_message "ci" "$@")"
    }

    # Docs
    function gdocs() {
        gcap "$(generate_commit_message "docs" "$@")"
    }

    # Feat
    function gfeat() {
        gcap "$(generate_commit_message "feat" "$@")"
    }

    # Fix
    function gfix() {
        gcap "$(generate_commit_message "fix" "$@")"
    }

    # Perf
    function gperf() {
        gcap "$(generate_commit_message "perf" "$@")"
    }

    # Refactor
    function grf() {
        gcap "$(generate_commit_message "refactor" "$@")"
    }

    # Style
    function gsty() {
        gcap "$(generate_commit_message "style" "$@")"
    }

    # Test
    function gtst() {
        gcap "$(generate_commit_message "test" "$@")"
    }
```

## Contributing

If you have any suggestions, bug reports, enhancements or modifications, feel free to make a pull request or open an issue. We appreciate any contribution.

## License

This project is open source and available under the [MIT License](LICENSE).
