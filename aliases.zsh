
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
