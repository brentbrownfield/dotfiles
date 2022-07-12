function gcproj --description "Set the gcloud project to a project that contains the regex of environment variable GCP_PROJECT"

    # If -p or --project is given, get the value of the project name regex from one or the other
    # otherwise return with non-zero exit code as this is required

    set projectName $argv[1]

    if set -q argv[1]
        echo "Setting current google project to $projectName"
        gcloud config set project (gcloud projects list --filter "projectId ~ $projectName*" --format=json | jq -r .[].projectId);
    else
        gcloud config get-value project
    end

end
