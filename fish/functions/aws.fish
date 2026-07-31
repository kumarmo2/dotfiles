function aws-refresh --description "Refresh AWS SSO credentials for shell and dotnet"
    if not command -sq aws-sso-refresh
        echo "aws-sso-refresh not found in PATH" >&2
        return 1
    end

    set -l output (aws-sso-refresh $argv)
    if test $status -ne 0
        return 1
    end

    eval $output
    echo "AWS credentials refreshed for profile $AWS_PROFILE (expires $AWS_CREDENTIAL_EXPIRATION)"
end

function aws-check --description "Check whether cached AWS credentials are still valid"
    aws-sso-refresh --check --skip-login
end

function aws-login --description "Open browser for AWS SSO login only"
    aws sso login --profile (set -q AWS_SSO_PROFILE; and echo $AWS_SSO_PROFILE; or echo DeveloperBase-971217900852)
end
