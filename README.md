# Cyrethium Reborn

Fork comunitário e atualizado do projeto descontinuado **Cyrethium GNU/Linux** (baseado em Debian 13 Trixie), voltado a privacidade, anonimato e segurança.

## Créditos
- Projeto original criado por **emk4sec** (https://sourceforge.net/projects/cyrethium/).

## Alterações neste fork
- Remoção de pacotes Python instalados via pip em `/usr/local/lib` em favor dos pacotes `.deb` nativos do Debian Trixie.
- Blindagem do `balance-checker` com roteamento obrigatório via Tor (`socks5h://127.0.0.1:9050`, `trust_env = False`) e remoção do RPC inativo da Cloudflare.
- Remoção dos `.xpi` desatualizados do repositório Git e substituição por hook de build (`config/hooks/normal/0100-install-firefox-extensions.hook.chroot`).
- Correção dos nomes de executáveis e atalhos `.desktop` (`cyrethium-dnscrypt` e `address-validator`).

## Aviso
Distribuição destinada a estudo, auditoria e uso consciente. Audite os scripts antes de utilizar em produção.
