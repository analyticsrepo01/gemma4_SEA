## Gemma 4 Model Specifications

| Property | Gemma 4 E4B (8B) | Gemma 4 26B MoE | Gemma 4 31B Dense |
|----------|:-----------------:|:----------------:|:-----------------:|
| Parameters | 8.0B | 26B (4B active) | 31B |
| Architecture | Dense | MoE (128 experts, top-8) | Dense |
| Layers | 42 | — | — |
| Hidden Size | 2,560 | — | — |
| Context Length | 131K tokens | 131K tokens | 131K tokens |
| Vocabulary | 262,144 tokens | 262,144 tokens | 262,144 tokens |
| Attention | Hybrid (35 sliding + 7 global) | — | — |
| VRAM Usage | ~15 GB | ~52 GB | ~78 GB |

*Architecture details based on Gemma 4 E4B-it (google/gemma-4-E4B-it)*
