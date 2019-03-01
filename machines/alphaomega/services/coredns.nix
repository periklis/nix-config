{ config, pkgs, ...}:
{
  services.coredns = {
    enable = true;
    config = ''
hc.lan hcg-cloud.internal hcg-dev.internal hcg.cloud hcg-analytics-prod.internal intra.burda.com {
    forward . 172.30.10.230 172.30.10.231
    errors
    cache 600 {
        denial 0
        prefetch 5 5m
    }
}

fritz.box {
    forward . 192.168.178.1
}

. {
    forward . tls://1.1.1.1 tls://1.0.0.1 tls://[2606:4700:4700::1111]:853 tls://[2606:4700:4700::1001]:853 {
    except hc.lan hcg-cloud.internal hcg-dev.internal hcg.cloud intranet.burda.com
        tls_servername cloudflare-dns.com
    expire 2s
    }
    errors
    cache 600 {
        denial 5000 600
        prefetch 5 5m
    }
}      
    '';
  };
}
