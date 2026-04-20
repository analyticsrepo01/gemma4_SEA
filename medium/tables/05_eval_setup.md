## Evaluation Setup

| Component | Details |
|-----------|---------|
| GPU | NVIDIA A100-SXM4-80GB |
| Inference Engine | vLLM 0.19.0 (Triton attention backend) |
| Precision | BF16 |
| Max Context | 8,192 tokens |
| Benchmark | SEA-HELM (AI Singapore) |
| Pillar Evaluated | Knowledge (Global MMLU Lite + Thai Exam) |

## Models Tested

| Model | Size | Active Params | VRAM | Processing Time |
|-------|------|:------------:|:----:|:--------------:|
| Gemma 4 E4B-it | 8B | 8B (dense) | ~15 GB | 1h |
| Gemma 4 26B-A4B-it | 26B | 4B (MoE) | ~52 GB | 3h |
| Gemma 4 31B-it | 31B | 31B (dense) | ~78 GB | 4.7h (think) / 0.5h (no think) |
| Qwen 3.5 27B | 27B | 27B (dense) | ~54 GB | 7h |
| Qwen 3.6 35B-A3B | 35B | 3B (MoE) | ~66 GB | 2.3h |
