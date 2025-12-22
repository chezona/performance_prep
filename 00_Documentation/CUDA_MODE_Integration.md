# CUDA MODE Lecture Series Integration

## What is CUDA MODE?

**CUDA MODE** is the most comprehensive GPU programming lecture series covering:
- 70+ lectures from industry experts (NVIDIA, Meta, Google, etc.)
- Topics: CUDA, Triton, Flash Attention, Quantization, CUTLASS, Tensor Cores
- Code examples for every lecture
- From beginner to advanced topics

**YouTube**: https://www.youtube.com/@GPUMODE  
**Discord**: https://discord.gg/gpumode

## Why This is HUGE for Anthropic Interviews

CUDA MODE covers EXACTLY what Anthropic asks for:
- "Implement low-latency high-throughput sampling" (Lectures 22, 40)
- "GPU kernels for low-precision inference" (Lectures 7, 30, 34, 38)
- "Flash Attention" (Lectures 12, 13, 36)
- "Tensor Cores" (Lecture 23)
- "Custom kernel development" (ALL lectures)
- "Memory bandwidth optimization" (Lectures 8, 9)
- "NCCL/Distributed" (Lectures 17, 67, 70)

## Recommended Lectures for Anthropic Prep

### Phase 1: Fundamentals (Weeks 1-4)
```
Lecture 1: Profiling CUDA kernels in PyTorch
Lecture 2: PMPP Book Ch. 1-3 Recap
Lecture 3: Getting Started with CUDA (Jeremy Howard)
Lecture 4: Compute and Memory Architecture
Lecture 5: CUDA for Python Programmers (Jeremy Howard)
```

### Phase 2: Optimization (Weeks 5-8)
```
Lecture 8: CUDA Performance Checklist
Lecture 9: Reductions
Lecture 16: Hands-on Profiling
Lecture 18: Fused Kernels
```

### Phase 3: Advanced (Weeks 9-16)
```
Lecture 12: Flash Attention
Lecture 13: Ring Attention
Lecture 23: Tensor Cores (NVIDIA experts!)
Lecture 36: CUTLASS and Flash Attention 3
Lecture 37: SASS & GPU Microarchitecture
```

### Phase 4: Frameworks & Tools (Weeks 17-20)
```
Lecture 14: Practitioner's Guide to Triton
Lecture 15: CUTLASS
Lecture 29: Triton Internals
Lecture 57: CuTe
```

### Phase 5: Quantization (Weeks 21-22)
```
Lecture 7: Advanced Quantization
Lecture 30: Quantized Training
Lecture 33: BitBLAS
Lecture 34: Low Bit Triton Kernels
Lecture 38: Lowbit kernels for ARM
```

### Phase 6: Production Systems (Weeks 23-24)
```
Lecture 17: NCCL (Collective Communication)
Lecture 22: Speculative Decoding in VLLM
Lecture 28: Liger Kernel
Lecture 32: Unsloth - LLM Systems Engineering
Lecture 35: SGLang Performance Optimization
```

## How to Use

### Watch + Code Pattern
1. **Watch** lecture on YouTube
2. **Read** the code in corresponding lecture folder
3. **Implement** similar optimization in LeetGPU challenge
4. **Profile** your implementation

### Example: Flash Attention Deep Dive
```
Week 13-14:
1. Watch Lecture 12 (Flash Attention basics)
2. Watch Lecture 13 (Ring Attention)
3. Watch Lecture 36 (Flash Attention 3)
4. Read lecture code
5. Implement in LeetGPU challenge #12 (Multi-Head Attention)
6. Profile with Nsight
```

## Study Integration with LeetGPU

| LeetGPU Challenge | CUDA MODE Lectures | What to Learn |
|-------------------|-------------------|---------------|
| Vector Addition | Lectures 2, 3 | Basic CUDA concepts |
| Matrix Multiplication | Lectures 4, 5 | Memory patterns |
| Reduction | Lecture 9 | Reduction algorithms |
| Softmax | Lectures 8, 18 | Kernel fusion |
| GEMM | Lecture 23 | Tensor cores |
| Multi-Head Attention | Lectures 12, 13, 36 | Flash Attention |
| Quantization challenges | Lectures 7, 30, 33, 34 | Low-precision |

## Code Examples Available

Every lecture folder contains:
- Working CUDA/Triton code
- Profiling scripts
- Notebooks (Jupyter/Colab)
- Performance benchmarks

**Example**: `lecture_009/` has 10+ reduction implementations showing progressive optimization!

## Key Speakers (Industry Leaders)

- **Jeremy Howard** (fast.ai) - Lectures 3, 5
- **Mark Saroufim** (PyTorch) - Lectures 1, 8, 9
- **Andreas Koepf** (Stability AI) - Lectures 2, 13
- **Thomas Viehmann** (PyTorch Lightning) - Lectures 4, 12
- **Cris Cecka** (NVIDIA, CuTe author) - Lecture 57
- **Jay Shah** (Flash Attention 3) - Lecture 36
- **And 50+ more experts**

## Interview Story Material

After completing CUDA MODE + LeetGPU:

> "I studied the CUDA MODE lecture series covering 70+ topics from industry experts. I combined this with hands-on implementation of 50+ GPU kernels. For example, after watching the Flash Attention lectures (12, 13, 36), I implemented multi-head attention in CUDA achieving 5.8x speedup by applying the block-sparse tiling technique I learned. I profiled every optimization with Nsight Compute and documented the memory bandwidth improvement from 23% to 89% utilization."

## Resources in Lectures Folder

- **70+ lecture folders** with code
- **GPU environment** (Python venv with PyTorch, Triton, etc.)
- **Profiling examples** (Nsight, PyTorch Profiler)
- **PMPP book examples** (Programming Massively Parallel Processors)

## Integration with Your Prep

Your revised study allocation:
```
LeetGPU Challenges:      30% (9 hours)  - Implement kernels
CUDA MODE Lectures:      20% (6 hours)  - Watch + study code
tiny-gpu:                15% (4.5 hours) - Architecture
tensor-core:             15% (4.5 hours) - Hardware
BitNet/ggml/others:      20% (6 hours)  - Quantization & misc
```

## Next Steps

1. **Start with Lecture 1**: Profiling basics
2. **Follow along with code**: Run the examples
3. **Map to LeetGPU**: For each lecture, find related challenge
4. **Build portfolio**: Combine lecture concepts with your implementations

---

**Bottom Line**: CUDA MODE is taught by the SAME people who work at companies like Anthropic! This is insider knowledge on how to build production GPU systems. Combined with LeetGPU for practice, you have the perfect preparation.

