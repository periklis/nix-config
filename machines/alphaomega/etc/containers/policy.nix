{}: builtins.toJSON {
  default = [
    {type="reject";}
  ];
  transports= {
    "dir"= {
      ""= [
        {type="insecureAcceptAnything";}
      ];
    };
    "containers-storage"= {
      ""= [
        {type="insecureAcceptAnything";}
      ];
    };
    "docker" = {
      "docker.io" = [
        {type="insecureAcceptAnything";}
      ];
      "quay.io" = [
        {type="insecureAcceptAnything";}
      ];
      "gcr.io" = [
        {type="insecureAcceptAnything";}
      ];          
      "eu.gcr.io" = [
        {type="insecureAcceptAnything";}
      ];          
    };
    "docker-daemon" = {
      "" = [
        {type="insecureAcceptAnything";}
      ];
    };
  };
}
