function regen-npmrc --description "Regenerate .npmrc with fresh AWS CodeArtifact token"
    if test (count $argv) -ne 0
        echo "Usage: regen-npmrc" >&2
        return 2
    end

    if not command -sq aws
        echo "aws CLI not found" >&2
        return 1
    end

    set -l token (aws codeartifact get-authorization-token --domain axs --domain-owner 971217900852 --query authorizationToken --output text)
    set -l aws_status $status

    if test $aws_status -ne 0
        echo "Failed to get CodeArtifact token. Ensure AWS session active; run: aws-refresh" >&2
        return $aws_status
    end

    if test -z "$token"; or test "$token" = "None"
        echo "AWS returned empty CodeArtifact token" >&2
        return 1
    end

    set -l output "$PWD/.npmrc"

    printf 'registry=https://axs-971217900852.d.codeartifact.us-west-2.amazonaws.com/npm/npm/\n//axs-971217900852.d.codeartifact.us-west-2.amazonaws.com/npm/npm/:_authToken=%s\nalways-auth=true\n' "$token" >$output

    echo "Wrote $output"
end

function regenerate-npmrc --description "Alias for regen-npmrc"
    regen-npmrc $argv
end
