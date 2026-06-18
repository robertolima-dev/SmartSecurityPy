#!/usr/bin/env bash
# Builda o wheel e instala numa venv limpa (sem deps de dev) para pegar
# dependências/entry points que só faltam fora do ambiente de desenvolvimento.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

rm -rf dist build
rm -rf ./*.egg-info 2>/dev/null || true
python -m build

VENV_DIR="$(mktemp -d)/venv"
python -m venv "$VENV_DIR"
"$VENV_DIR/bin/pip" install -q "$(ls dist/*.whl)"

"$VENV_DIR/bin/python" -c "
from SmartSecurityPy.hasher import hash_password, verify_password
hashed = hash_password('senha123')
assert verify_password('senha123', hashed) is True
assert verify_password('errada', hashed) is False
print('IMPORT OK')
"

rm -rf "$(dirname "$VENV_DIR")"
echo "Smoke test passou."
