## Thinking Mode Impact on Gemma 4

### Overall Improvement

| Model | No Think | Think | Improvement |
|-------|:--------:|:-----:|:-----------:|
| E4B (8B) | 51.17 | 66.01 | **+14.84** |
| 26B MoE | 63.89 | 77.31 | **+13.42** |
| 31B Dense | 71.91 | 82.43 | **+10.52** |

### Per-Language Gains (31B Dense)

| Language | No Think | Think | Gain |
|----------|:--------:|:-----:|:----:|
| Thai | 56.98 | 77.06 | **+20.08** |
| Burmese | 66.43 | 81.24 | **+14.81** |
| Filipino | 76.12 | 85.33 | **+9.21** |
| Malay | 77.33 | 84.22 | **+6.89** |
| Indonesian | 78.77 | 85.18 | **+6.41** |
| Vietnamese | 75.83 | 81.53 | **+5.70** |

*Key insight: Lower-resource languages (Thai, Burmese) benefit most from thinking mode*
