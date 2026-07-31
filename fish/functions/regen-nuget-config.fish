function regen-nuget-config --description "Regenerate nuget.config with fresh AWS CodeArtifact token"
    if test (count $argv) -ne 0
        echo "Usage: regen-nuget-config" >&2
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

    set -l escaped_token (string replace -a '&' '&amp;' -- "$token" | string replace -a '"' '&quot;' | string replace -a '<' '&lt;' | string replace -a '>' '&gt;')
    set -l output "$PWD/nuget.config"

    printf '\xEF\xBB\xBF<?xml version="1.0" encoding="utf-8"?>\n<configuration> <packageSources> <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" /> <add key="codeartifact" value="https://axs-971217900852.d.codeartifact.us-west-2.amazonaws.com/nuget/nuget/v3/index.json" /> </packageSources> <packageSourceCredentials> <codeartifact> <add key="Username" value="aws" /> <add key="ClearTextPassword" value="%s" /> </codeartifact> </packageSourceCredentials> </configuration>\n' "$escaped_token" >$output

    echo "Wrote $output"
end

function regenerate-nuget-config --description "Alias for regen-nuget-config"
    regen-nuget-config $argv
end
