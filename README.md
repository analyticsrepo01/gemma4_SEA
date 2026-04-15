# Gemma 4 on SEA-HELM: Evaluating Google's Latest LLM on Southeast Asian Languages

Systematic evaluation of **Google Gemma 4** models on the [SEA-HELM benchmark](https://github.com/aisingapore/sea-helm) (Southeast Asian Holistic Evaluation of Language Models) by AI Singapore.

This project benchmarks Gemma 4 variants across **7 Southeast Asian languages** to understand how well the newest generation of Gemma performs on regional language understanding, reasoning, and knowledge tasks.

---

## Key Findings

### Gemma 4 Knowledge Pillar — Head-to-Head Comparison

| Language | E4B (8B Dense) | 26B MoE (4B active) | Improvement |
|----------|:--------------:|:-------------------:|:-----------:|
| Indonesian (ID) | 59.77 | **72.82** | +13.05 |
| Vietnamese (VI) | 52.61 | **70.24** | +17.63 |
| Malay (MS) | 53.52 | **71.36** | +17.84 |
| Filipino (TL) | 55.29 | **65.80** | +10.51 |
| Burmese (MY) | 42.56 | **53.50** | +10.94 |
| Thai (TH) | 43.28 | **49.61** | +6.33 |
| Tamil (TA) | N/A | N/A | — |

> **Key Insight:** The 26B MoE model delivers a **+12.7 point average improvement** over the 8B dense model across all languages. The biggest gains are in Malay (+17.8) and Vietnamese (+17.6). Despite only 4B active parameters per token, the MoE architecture significantly outperforms the 8B dense model.

### SEA-HELM Leaderboard Context

| Model | Size | Active Params | Best Language Score (Knowledge) |
|-------|-----:|:------------:|:------------------------------:|
| SEA-LION v4 (Qwen) | 32B | 32B | 60.82 (overall)* |
| Qwen 3 Next | 80B MoE | ~13B | 60.73 (overall)* |
| SEA-LION v4 (Gemma) | 27B | 27B | 59.84 (overall)* |
| Gemma 3 | 27B | 27B | 59.74 (overall)* |
| **Gemma 4 26B MoE** | **26B** | **4B** | **72.82 (ID Knowledge)** |
| **Gemma 4 E4B** | **8B** | **8B** | **59.77 (ID Knowledge)** |
| Llama 4 Scout | 109B MoE | ~17B | 45.54 (MY)* |

*\*Leaderboard scores are full-suite (all pillars). Our Knowledge-only scores are not directly comparable but show Gemma 4's strong knowledge capabilities in SEA languages.*

---

## Evaluation Details

### SEA-HELM Benchmark

[SEA-HELM](https://leaderboard.sea-lion.ai/) evaluates LLMs across **5 pillars**:

| Pillar | What It Tests | Tasks |
|--------|--------------|-------|
| NLP Classics | Core NLP capabilities | QA, Sentiment, Translation, Summarization |
| LLM-Specifics | Instruction following, conversation | SEA-IFEval, SEA-MTBench |
| SEA Linguistics | Language proficiency | LINDSEA (pragmatics, syntax, semantics) |
| SEA Culture | Cultural awareness | Region-specific cultural knowledge |
| Safety | Harm detection | Toxicity, hate speech detection |

### Languages Evaluated

| Code | Language | Script | E4B Knowledge | 26B MoE Knowledge |
|------|----------|--------|:-------------:|:-----------------:|
| ID | Indonesian | Latin | 59.77 | **72.82** |
| VI | Vietnamese | Latin | 52.61 | **70.24** |
| MS | Malay | Latin | 53.52 | **71.36** |
| TL | Filipino | Latin | 55.29 | **65.80** |
| TH | Thai | Thai | 43.28 | **49.61** |
| MY | Burmese | Myanmar | 42.56 | **53.50** |
| TA | Tamil | Tamil | N/A | N/A |

---

## Per-Subject Performance — E4B (Global MMLU Lite)

### Top Performing Subjects (Across Languages)

| Subject | ID | VI | TL | MS | MY |
|---------|:--:|:--:|:--:|:--:|:--:|
| Computer Science | 100 | 100 | 75 | 100 | 100 |
| College Mathematics | 100 | 0 | 50 | 50 | 50 |
| Electrical Engineering | 100 | 75 | 75 | 50 | 75 |
| Marketing | 83 | 92 | 100 | 83 | 58 |
| European History | 83 | 58 | 58 | 92 | 92 |

### Challenging Subjects

| Subject | ID | VI | TL | MS | MY |
|---------|:--:|:--:|:--:|:--:|:--:|
| High School Chemistry | 0 | 0 | 0 | 0 | 50 |
| Professional Medicine | 75 | 50 | 0 | 0 | 50 |
| Global Facts | 38 | 38 | 50 | 50 | 50 |
| College Biology | 50 | 50 | 50 | 50 | 0 |

> **Pattern:** Gemma 4 E4B excels at STEM subjects (CS, Math, Engineering) and struggles with Chemistry and domain-specific professional knowledge across all SEA languages.

---

## Thai Exam Results

Thai evaluation uses the **Thai Exam** benchmark (national standardized tests) instead of Global MMLU Lite:

| Exam | Score (%) |
|------|:---------:|
| IC (Investment Consultant) | 65.79 |
| O-NET | 59.85 |
| TGAT | 58.24 |
| A-Level | 47.64 |
| TPAT1 | 43.87 |

---

## Models Evaluated

| Model | Parameters | Architecture | VRAM Usage | Inference Backend |
|-------|-----------|-------------|:----------:|:-----------------:|
| `google/gemma-4-E4B-it` | 8B | Dense | ~15 GB | vLLM 0.19.0 |
| `google/gemma-4-26B-A4B-it` | 26B (4B active) | MoE (128 experts, top-8) | ~52 GB | vLLM 0.19.0 |

### Infrastructure

- **GPU:** NVIDIA A100-SXM4-80GB
- **Inference:** vLLM 0.19.0 with Triton attention backend
- **Transformers:** 5.5.4
- **Context Length:** 8,192 tokens (max_model_len)
- **Precision:** BF16

---

## Repository Structure

```
gemma4_SEA/
├── README.md                          # This file
├── results/
│   ├── gemma4-E4B-baseline/          # Gemma 4 E4B (8B) results
│   │   └── gemma-4-E4B-it_seahelm_results.json
│   └── gemma4-26B-MoE-baseline/      # Gemma 4 26B MoE results
│       └── gemma-4-26B-A4B-it_seahelm_results.json
├── configs/
│   └── experiments.yaml               # Experiment configurations
├── scripts/
│   └── run_seahelm.sh                # Evaluation runner script
└── .gitignore
```

---

## Reproducing Results

### Prerequisites

```bash
# Clone SEA-HELM
git clone https://github.com/aisingapore/sea-helm.git
cd sea-helm

# Install dependencies
pip install uv
uv sync

# Upgrade for Gemma 4 support
uv pip install --python .venv/bin/python "transformers>=5.5" "vllm>=0.19"
```

### Patch for Gemma 4 Compatibility

SEA-HELM requires two patches for Gemma 4 models:

```python
# 1. Fix metricx_models.py (transformers 5.x compatibility)
# In src/serving/local/metricx_models.py, line 35:
# Replace:
transformers.models.mt5.modeling_mt5.__HEAD_MASK_WARNING_MSG
# With:
getattr(transformers.models.mt5.modeling_mt5, "__HEAD_MASK_WARNING_MSG", "")

# 2. Fix aggregate_metrics.py (missing subcategories guard)
# In src/aggregate_metrics.py, guard .get() for subcategories access
# and add division-by-zero protection for subset_accuracy
```

### Run Evaluation

```bash
cd sea-helm

# Set environment
export HF_TOKEN="your_huggingface_token"
export FLASHINFER_DISABLE_VERSION_CHECK=1

# Gemma 4 E4B (8B)
.venv/bin/python src/seahelm_evaluation.py \
  --tasks seahelm \
  --output_dir ./results/gemma4-E4B-baseline \
  --model_name google/gemma-4-E4B-it \
  --model_type vllm \
  --model_args "tensor_parallel_size=1,gpu_memory_utilization=0.9,max_model_len=8192"

# Gemma 4 26B MoE
.venv/bin/python src/seahelm_evaluation.py \
  --tasks seahelm \
  --output_dir ./results/gemma4-26B-MoE-baseline \
  --model_name google/gemma-4-26B-A4B-it \
  --model_type vllm \
  --model_args "tensor_parallel_size=1,gpu_memory_utilization=0.9,max_model_len=8192"
```

---

## Notes

- **Knowledge-only evaluation:** The full SEA-HELM suite includes LLM judge-based evaluations (MT-Bench, NLG quality) that require external API keys. This evaluation focuses on the **Knowledge pillar** which uses automated metrics (accuracy on multiple-choice questions).
- **Gemma 4 is multimodal:** The E4B model includes vision and audio towers. vLLM loads the full model but evaluation is text-only. The audio/vision parameters are frozen during inference.
- **MoE efficiency:** The 26B MoE model has 128 experts with top-8 routing, meaning only ~4B parameters are active per token despite the 26B total parameter count.

---

## References

- [SEA-HELM Benchmark](https://github.com/aisingapore/sea-helm) — AI Singapore
- [SEA-HELM Leaderboard](https://leaderboard.sea-lion.ai/) — Live rankings
- [Gemma 4 Model Card](https://huggingface.co/google/gemma-4-E4B-it) — Google
- [Global MMLU Lite](https://huggingface.co/datasets/CohereForAI/Global-MMLU-Lite) — Cohere

---

## License

This evaluation work is released under the MIT License. Model weights are subject to [Google's Gemma Terms of Use](https://ai.google.dev/gemma/terms).
