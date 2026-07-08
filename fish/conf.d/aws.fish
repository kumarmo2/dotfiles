set -gx AWS_SSO_PROFILE DeveloperBase-971217900852
set -gx AWS_PROFILE axsdevops
set -gx AWS_DEFAULT_REGION us-west-2
set -gx AWS_REGION us-west-2

# -l (local): scoped to this file's execution, won't leak into user's shell
# These -l variables are temporary helpers for parsing the session file.
# Actual AWS credentials are exported below with -gx so child processes (aws CLI) can see them.
set -l aws_session_file "$HOME/.local/state/aws/session.env"

if test -f $aws_session_file
    set -l exp_epoch (string replace -r '^AWS_CREDENTIAL_EXPIRATION_EPOCH=' '' (grep '^AWS_CREDENTIAL_EXPIRATION_EPOCH=' $aws_session_file))
    set -l now (date +%s)

    if test -n "$exp_epoch"; and test "$exp_epoch" -gt "$now"
        while read -l line
            if string match -qr '^[A-Z_]+=' -- $line
                set -l parts (string split -m 1 '=' -- $line)
                # -gx exports these to the environment so child processes can access AWS credentials
                set -gx $parts[1] $parts[2]
            end
        end <$aws_session_file
    else
        echo "AWS credentials expired. Run: aws-refresh" >&2
    end
else
    echo "AWS credentials not loaded. Run: aws-refresh" >&2
end
