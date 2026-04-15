#!/bin/bash
# Run SEA-HELM evaluation for Gemma 4 models
# Usage: ./run_seahelm.sh <model_name> <output_dir>
#
# Prerequisites:
#   - SEA-HELM cloned and installed (uv sync)
#   - vLLM >= 0.19.0 (for Gemma 4 support)
#   - transformers >= 5.5 (for gemma4 architecture)
#   - NVIDIA GPU with >= 16GB VRAM (E4B) or >= 52GB (26B MoE)

set -euo pipefail

MODEL_NAME="${1:-google/gemma-4-E4B-it}"
OUTPUT_DIR="${2:-./results/gemma4-eval}"
MAX_MODEL_LEN="${3:-8192}"
SEA_HELM_DIR="${SEA_HELM_DIR:-$HOME/sea-helm}"

echo "============================================"
echo "SEA-HELM Evaluation"
echo "============================================"
echo "Model:      $MODEL_NAME"
echo "Output:     $OUTPUT_DIR"
echo "Max length: $MAX_MODEL_LEN"
echo "SEA-HELM:   $SEA_HELM_DIR"
echo "============================================"

# Check prerequisites
if [ ! -d "$SEA_HELM_DIR" ]; then
    echo "ERROR: SEA-HELM not found at $SEA_HELM_DIR"
    echo "Clone it: git clone https://github.com/aisingapore/sea-helm.git $SEA_HELM_DIR"
    exit 1
fi

if [ -z "${HF_TOKEN:-}" ]; then
    export HF_TOKEN=$(cat ~/.cache/huggingface/token 2>/dev/null || echo "")
    if [ -z "$HF_TOKEN" ]; then
        echo "WARNING: HF_TOKEN not set. Gated models may fail to load."
    fi
fi

# Disable flashinfer version check (vLLM upgrade can cause mismatch)
export FLASHINFER_DISABLE_VERSION_CHECK=1

cd "$SEA_HELM_DIR"
mkdir -p "$OUTPUT_DIR"

.venv/bin/python src/seahelm_evaluation.py \
    --tasks seahelm \
    --output_dir "$OUTPUT_DIR" \
    --model_name "$MODEL_NAME" \
    --model_type vllm \
    --model_args "tensor_parallel_size=1,gpu_memory_utilization=0.9,max_model_len=$MAX_MODEL_LEN"

echo ""
echo "Evaluation complete. Results saved to: $OUTPUT_DIR"
