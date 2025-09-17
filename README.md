# OpenAI Whisper Setup for transcribing videos

## Setup venv
```
python3 -m venv ~/venvs/whisper
source ~/venvs/whisper/bin/activate
pip install -U pip
pip install openai-whisper
```

## When done:
`deactivate`

# Fix macOS certificates (Python.org install)
Run Apple’s bundled cert installer:
`/Applications/Python\ 3.10/Install\ Certificates.command`
