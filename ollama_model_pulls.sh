set +e

# Embedding Models
ollama pull embeddinggemma
ollama pull nomic-embed-text
#ollama pull mxbai-embed-large

# Reasoning Models
ollama pull deepseek-r1:1.5b
ollama pull deepseek-r1:7b

# Coding Models
ollama pull qwen2.5-coder:3b
ollama pull qwen2.5-coder:7b

# Gemeral Models
ollama pull gemma3:4b
ollama pull gemma3:12b
