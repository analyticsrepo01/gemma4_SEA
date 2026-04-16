# Qwen 3.5 27B — SEA-HELM Knowledge Pillar Results

**Model:** Qwen/Qwen3.5-27B (27B Dense, Hybrid GDN + Sparse MoE)  
**Reasoning mode:** Enabled (`--is_reasoning_model`, 20K thinking tokens)  
**Inference:** vLLM 0.19.0 on A100-SXM4-80GB, BF16, max_model_len=8192  
**Date:** 2026-04-15  

---

## Knowledge Pillar Scores

| Language | Qwen 3.5 27B | Gemma 4 31B | Gemma 4 26B MoE | Gemma 4 E4B | GPT-OSS-20B |
|----------|:------------:|:-----------:|:---------------:|:-----------:|:-----------:|
| Indonesian (ID) | **85.82** | 78.77 | 72.82 | 59.77 | 70.74 |
| Vietnamese (VI) | **83.29** | 75.83 | 70.24 | 52.61 | 69.93 |
| Malay (MS) | **84.51** | 77.33 | 71.36 | 53.52 | 69.90 |
| Filipino (TL) | **82.78** | 76.12 | 65.80 | 55.29 | 71.84 |
| Thai (TH) | **75.64** | 56.98 | 49.61 | 43.28 | 60.11 |
| Burmese (MY) | **77.94** | 66.43 | 53.50 | 42.56 | 49.19 |
| Tamil (TA) | N/A | N/A | N/A | N/A | N/A |
| **Average** | **81.66** | **71.91** | **63.89** | **51.17** | **65.29** |

---

## Delta vs Gemma 4 31B

| Language | Delta |
|----------|:-----:|
| Thai (TH) | +18.66 |
| Burmese (MY) | +11.51 |
| Vietnamese (VI) | +7.46 |
| Malay (MS) | +7.18 |
| Indonesian (ID) | +7.05 |
| Filipino (TL) | +6.66 |
| **Average** | **+9.75** |

---

## Execution Times

| Model | Params (active) | Thinking Mode | Execution Time |
|-------|:---------------:|:-------------:|:--------------:|
| Gemma 4 E4B | 8B | No | ~30 min |
| Gemma 4 26B MoE | 26B (4B active) | No | ~45 min |
| Gemma 4 31B | 31B | No | ~1.5 hrs |
| GPT-OSS-20B | 21B (3.6B active) | Yes | ~2 hrs |
| Qwen 3.5 27B | 27B dense | Yes | **~9.5 hrs** |

> Qwen 3.5 27B was by far the slowest — 27B dense params + thinking mode generating up to 20K tokens per question. MoE models are much faster since only a fraction of params are active per token.

---

## Notes

- Qwen 3.5 27B uses thinking mode by default (`<think></think>` tags). The `--is_reasoning_model` flag was required to strip thinking content before answer parsing.
- The model is 27B dense parameters with a hybrid GDN (Gated Delta Networks) + sparse MoE architecture.
- Gemma 4 results above were run **without** thinking mode. A fair comparison requires re-running Gemma 4 with `--is_reasoning_model` enabled.
- Largest gaps are on Thai (+18.7) and Burmese (+11.5), suggesting Qwen 3.5 has stronger low-resource SEA language coverage.
- These results are **not published** to the GitHub repo per project policy.
