# Gemma 4 on SEA-HELM: Evaluating Google's Latest LLM on Southeast Asian Languages

Systematic evaluation of **Google Gemma 4** models on the [SEA-HELM benchmark](https://github.com/aisingapore/sea-helm) (Southeast Asian Holistic Evaluation of Language Models) by AI Singapore.

This project benchmarks Gemma 4 variants across **7 Southeast Asian languages** to understand how well the newest generation of Gemma performs on regional language understanding, reasoning, and knowledge tasks.

---

## Key Findings

### Gemma 4 Knowledge Pillar — Head-to-Head Comparison

| Language | E4B (8B Dense) | 26B MoE (4B active) | 31B Dense | Best Improvement |
|----------|:--------------:|:-------------------:|:---------:|:----------------:|
| Indonesian (ID) | 59.77 | 72.82 | **78.77** | +19.00 |
| Vietnamese (VI) | 52.61 | 70.24 | **75.83** | +23.22 |
| Malay (MS) | 53.52 | 71.36 | **77.33** | +23.81 |
| Filipino (TL) | 55.29 | 65.80 | **76.12** | +20.83 |
| Burmese (MY) | 42.56 | 53.50 | **66.43** | +23.87 |
| Thai (TH) | 43.28 | 49.61 | **56.98** | +13.70 |
| Tamil (TA) | N/A | N/A | N/A | — |

> **Key Insight:** The **31B dense model leads across all languages**, with the largest gains in Burmese (+23.9 over E4B) and Malay (+23.8). The 26B MoE (only 4B active params) delivers ~90% of 31B's performance — remarkable efficiency. Even the 8B E4B holds its own against much larger models on the leaderboard.

### Cross-Model Comparison (SEA-HELM Leaderboard)

How Gemma 4 stacks up against **62 models** on the [official SEA-HELM leaderboard](https://leaderboard.sea-lion.ai/). Leaderboard scores are full-suite (all pillars); our Gemma 4 scores are Knowledge-pillar only.

> **[View Interactive Leaderboard →](leaderboard-seahelm/index.html)** — Searchable, sortable comparison across all 62 models with per-language breakdowns.

#### Top 20 Models — SEA Overall Score

| Rank | Model | Size | SEA Overall |
|:----:|-------|-----:|:-----------:|
| 1 | SEA-LION v4 (Qwen) | 32B | 60.82 |
| 2 | Qwen 3 Next | 80B MoE | 60.73 |
| 3 | Qwen 3 VL | 32B | 59.88 |
| 4 | SEA-LION v4 (Gemma) | 27B | 59.84 |
| 5 | Gemma 3 | 27B | 59.74 |
| 6 | Qwen 3 | 32B | 58.60 |
| 7 | SEA-LION v3 (Llama) | 70B | 57.65 |
| 8 | Gemma 3 | 12B | 56.70 |
| 9 | Llama 4 Scout | 109B MoE | 55.85 |
| 10 | Qwen 3 (MoE) | 30B | 55.55 |
| 11 | Llama 3.1 Tulu 3 | 70B | 54.67 |
| 12 | Llama 3.3 | 70B | 53.28 |
| 13 | Qwen 3 | 14B | 53.20 |
| 14 | Qwen 2.5 | 72B | 52.97 |
| 15 | SEA-LION v4 (Qwen VL) | 8B | 52.18 |
| 16 | Qwen 3 VL | 8B | 51.58 |
| 17 | Gemma 2 | 27B | 51.08 |
| 18 | Qwen 2.5 | 32B | 50.07 |
| 19 | SEA-LION v3 (Gemma) | 9B | 49.86 |
| 20 | Llama 3.1 | 70B | 49.59 |

#### Gemma Family Evolution

| Model | Size | Architecture | SEA Overall | ID | TL | MS | VI |
|-------|-----:|:-----------:|:-----------:|:--:|:--:|:--:|:--:|
| Gemma 2 9B | 9B | Dense | 44.62 | — | — | — | — |
| Gemma 2 27B | 27B | Dense | 51.08 | 59.79 | 61.19 | — | — |
| Gemma 3 4B | 4B | Dense | 42.79 | — | — | — | — |
| Gemma 3 12B | 12B | Dense | 56.70 | 61.80 | 65.00 | — | 59.07 |
| Gemma 3 27B | 27B | Dense | 59.74 | 64.12 | 67.70 | 60.92 | 60.06 |
| **Gemma 4 E4B** | **8B** | **Dense** | **—** | **59.77*** | **55.29*** | **53.52*** | **52.61*** |
| **Gemma 4 26B MoE** | **26B** | **MoE** | **—** | **72.82*** | **65.80*** | **71.36*** | **70.24*** |
| **Gemma 4 31B** | **31B** | **Dense** | **—** | **78.77*** | **76.12*** | **77.33*** | **75.83*** |

*\*Knowledge pillar only (not full-suite). Leaderboard scores include all 5 pillars.*

> **Generation leap:** Gemma 4 31B dense tops the knowledge charts at **78.77 on Indonesian** — a +14.65 point jump over Gemma 3 27B. The 26B MoE achieves ~93% of 31B's performance with only 4B active parameters per token.

#### Gemma 4 vs GPT-OSS-20B (OpenAI) — Knowledge Pillar

| Language | Gemma 4 31B (31B Dense) | GPT-OSS-20B (3.6B active) | Gemma 4 26B MoE (4B active) | Gemma 4 E4B (8B) |
|----------|:-----------------------:|:-------------------------:|:---------------------------:|:----------------:|
| Indonesian (ID) | **78.77** | 70.74 | 72.82 | 59.77 |
| Vietnamese (VI) | **75.83** | 69.93 | 70.24 | 52.61 |
| Malay (MS) | **77.33** | 69.90 | 71.36 | 53.52 |
| Filipino (TL) | **76.12** | 71.84 | 65.80 | 55.29 |
| Thai (TH) | 56.98 | **60.11** | 49.61 | 43.28 |
| Burmese (MY) | **66.43** | 49.19 | 53.50 | 42.56 |
| **Average** | **71.91** | **65.29** | **63.89** | **51.17** |

> **Efficiency spotlight:** OpenAI's GPT-OSS-20B achieves remarkable results with only **3.6B active parameters** (MoE, 21B total). It beats Gemma 4 31B on Thai (+3.1 points) and narrowly edges out the 26B MoE overall (65.29 vs 63.89). However, Gemma 4 31B dense leads by **+6.6 points on average**, dominating on Burmese (+17.2) and Malay (+7.4).

#### 8B-Class Model Comparison

| Model | Size | SEA Overall |
|-------|-----:|:-----------:|
| Qwen 3 VL | 8B | 51.58 |
| SEA-LION v4 (Qwen VL) | 8B | 52.18 |
| Qwen 3 | 8B | 46.83 |
| Gemma 2 | 9B | 44.62 |
| SEA-LION v3 (Gemma) | 9B | 49.86 |
| SEA-LION v3 (Llama) | 8B | 43.47 |
| Llama 3.1 | 8B | 32.97 |
| **Gemma 4 E4B** | **8B** | **59.77 (ID Knowledge)*** |

*\*Knowledge-only score. The E4B's knowledge capability at 8B rivals models 3-4x larger on the leaderboard.*

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

| Code | Language | Script | E4B Knowledge | 26B MoE Knowledge | 31B Dense Knowledge |
|------|----------|--------|:-------------:|:-----------------:|:-------------------:|
| ID | Indonesian | Latin | 59.77 | 72.82 | **78.77** |
| VI | Vietnamese | Latin | 52.61 | 70.24 | **75.83** |
| MS | Malay | Latin | 53.52 | 71.36 | **77.33** |
| TL | Filipino | Latin | 55.29 | 65.80 | **76.12** |
| TH | Thai | Thai | 43.28 | 49.61 | **56.98** |
| MY | Burmese | Myanmar | 42.56 | 53.50 | **66.43** |
| TA | Tamil | Tamil | N/A | N/A | N/A |

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
| `google/gemma-4-31B-it` | 31B | Dense | ~78 GB | vLLM 0.19.0 |

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
│   ├── gemma4-26B-MoE-baseline/      # Gemma 4 26B MoE results
│   │   └── gemma-4-26B-A4B-it_seahelm_results.json
│   └── gemma4-31B-baseline/          # Gemma 4 31B Dense results
│       └── gemma-4-31B-it_seahelm_results.json
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

# Gemma 4 31B Dense
.venv/bin/python src/seahelm_evaluation.py \
  --tasks seahelm \
  --output_dir ./results/gemma4-31B-baseline \
  --model_name google/gemma-4-31B-it \
  --model_type vllm \
  --model_args "tensor_parallel_size=1,gpu_memory_utilization=0.95,max_model_len=8192"
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
