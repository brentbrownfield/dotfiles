# Defined in - @ line 1
function gcprojnum -wraps=gcloud\ projects\ describe\ \(gcproj\)\ --format\ \'value\(projectNumber\)\'\ 2\>/dev/null --description alias\ gcprojnum\ gcloud\ projects\ describe\ \(gcproj\)\ --format\ \'value\(projectNumber\)\'\ 2\>/dev/null
  gcloud projects describe (gcproj) --format 'value(projectNumber)' 2>/dev/null $argv;
end
