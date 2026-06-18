# 📜 Changelog


## [1.0.1] - 2026-06-18
### Corrigido
- `passlib[bcrypt]` sem pin de versão instalava `bcrypt` 4.1+, que quebra
  o detector interno do passlib (`ValueError: password cannot be longer
  than 72 bytes` em qualquer `hash_password()`). Fixado `bcrypt<4.1`.

### Alterado
- Removido `setup.py` duplicado; `pyproject.toml` passa a ser a única
  fonte de metadados do pacote.
- Build via `python -m build` + `twine check`, com CI (`ci.yml`) e release
  automatizado por tag (`release.yml`) publicando no PyPI.

## [1.0.0] - 2025-05-06
### Adicionado
- Validar senhas vazias
- Identificar senhas fracas
- Validar senhas fortes
- Detectar senhas comuns
- Identificar sequências de caracteres
- Detectar repetições
- Fornecer sugestões de melhoria
- Avaliar o comprimento da senha
- Verificar a complexidade da senha
- Lidar com casos limite

## [0.1.0] - 2025-04-03
### Adicionado
- 🚀 Primeira versão do SmartSecurityPy.