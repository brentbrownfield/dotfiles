function ksecret --argument-names secret --description "Retrieve a kubernetes secret and decode"
    kubectl get secret $secret -o go-template='{{range $k,$v := .data}}{{"### "}}{{$k}}{{"\n"}}{{$v|base64decode}}{{"\n\n"}}{{end}}'
end
