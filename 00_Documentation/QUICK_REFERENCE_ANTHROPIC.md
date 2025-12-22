#  Quick Reference: Your Anthropic Prep Arsenal

##  Repository Ranking

###  Tier S - Critical (70% of time)
| Repo | Why Essential | Hours/Week |
|------|---------------|------------|
| **LeetGPU** | 60+ CUDA/Triton kernels, attention mechanisms | 12h |
| **tiny-gpu** | Complete GPU architecture, SIMD, schedulers | 6h |
| **tensor-core** | Systolic arrays, TPU-like design, FP16/INT8 | 6h |

###  Tier A - Important (25% of time)
| Repo | Purpose | Hours/Week |
|------|---------|------------|
| **BitNet** | Low-precision quantization (1.58-bit) | 2h |
| **ggml** | ML framework internals | 2h |
| **systemverilog-homework** | Digital design, pipelining, caches | 2h |

###  Not Relevant (0% of time)
-  coralnpu - Edge devices (wrong scale)
-  torchleet - Algorithms only
-  ISLP - Statistics theory
-  mlengneering - Too general
-  python - Too basic

---

##  What Each Repo Teaches You

### LeetGPU (organized_leetgpu/)
```
 CUDA kernel programming (60+ examples)
 Triton optimization (15+ examples)
 Multi-Head Self-Attention (THE key primitive)
 GEMM, Softmax, Convolutions
 Memory coalescing patterns
 Tensor core usage
 Quantization (INT8/FP16)
```
**Interview Impact**: "I've implemented 50+ GPU kernels including multi-head attention"

### tiny-gpu (HArdware/tiny-gpu/)
```
 GPU architecture from scratch
 Dispatcher, Scheduler, Memory Controller design
 SIMD programming model in hardware
 Warp scheduling concepts
 Branch divergence handling
 Memory bandwidth optimization
 <15 files, fully documented!
```
**Interview Impact**: "I understand GPUs at the RTL level, built one from scratch"

### tensor-core (HArdware/tensor-core/)
```
 Systolic array implementation
 MAC units (FP16 + INT8)
 Scratchpad memory subsystem
 Memory arbiter & DRAM FSM
 Scheduler & dispatch logic
 Real Purdue research project!
```
**Interview Impact**: "I worked on tensor core implementation with systolic arrays"

### BitNet
```
 1.58-bit quantization
 Lookup table kernels
 Ultra-low precision arithmetic
```
**Interview Impact**: "I studied extreme quantization techniques"

### ggml
```
 Tensor operation implementations
 C/C++ framework design
 Memory management patterns
```
**Interview Impact**: "I understand ML framework internals"

### systemverilog-homework
```
 Digital logic fundamentals
 FSM design
 Pipeline design
 Cache implementation
 FIFO design
```
**Interview Impact**: "Strong hardware fundamentals"

---

##  6-Month Timeline (30 hrs/week)

### Months 1-2: Foundations
**Goal**: Understand architecture + easy kernels
```
Week 1-2:  tiny-gpu deep dive (read all, run simulations)
Week 3-4:  tensor-core architecture study
Week 5-8:  LeetGPU Easy (16 challenges in CUDA)
           systemverilog basics (combinational, sequential)
```
**Deliverable**: Blog post on GPU architecture

### Months 3-4: Advanced Optimization
**Goal**: Master kernel optimization
```
Week 9-12:  LeetGPU Medium (34 challenges, focus on attention/GEMM)
            Start Triton (15+ challenges)
            BitNet quantization study
Week 13-16: Multi-Head Attention (Hard challenge)
            Flash Attention implementation
            tensor-core GEMM study
```
**Deliverable**: 3 optimized kernels with perf reports

### Months 5-6: Expert + Portfolio
**Goal**: Build impressive portfolio
```
Week 17-20: LeetGPU Hard (all 8 challenges)
            Optimize for A100 tensor cores
            Contribute to tiny-gpu
Week 21-24: Portfolio projects
            Interview prep
            Performance analysis write-ups
```
**Deliverable**: GitHub portfolio showcasing all work

---

##  Interview Question Prep

### "Tell me about your most impressive low-level performance work"

**Answer Template**:
> "I [optimized/built/studied] a [GPU kernel/hardware accelerator] that [specific achievement with numbers]. The challenge was [specific bottleneck]. I [specific techniques] which resulted in [X]x speedup. I profiled using [Nsight/simulation] and found [specific insight]. I also understand this at the hardware level because [tiny-gpu/tensor-core work]."

### "How would you optimize this attention kernel?"

**Answer Flow**:
1. Profile to identify bottleneck (memory vs compute)
2. Discuss memory coalescing (learned from tiny-gpu)
3. Shared memory tiling (LeetGPU examples)
4. Tensor core mapping (tensor-core knowledge)
5. Warp-level primitives (tiny-gpu scheduler understanding)
6. Flash Attention insights (LeetGPU challenge 32)

### "Explain how a GPU works"

**Answer Structure** (from tiny-gpu):
1. Dispatcher distributes threads to cores
2. Scheduler manages execution within cores
3. SIMD model with dedicated ALUs per thread
4. Memory controllers handle async requests
5. Cache reduces global memory traffic
6. Warp scheduling maximizes utilization

### "What's the difference between GPU and TPU?"

**Answer** (from tiny-gpu + tensor-core):
> "GPUs use SIMD with general-purpose ALUs per thread, while TPUs use systolic arrays optimized specifically for matrix operations. I've implemented both: a GPU with schedulers and ALUs [tiny-gpu], and a systolic array with MAC units [tensor-core]. The key difference is that systolic arrays achieve higher throughput for matrix ops by pipelining data through a grid of processing elements, but they're less flexible than GPU's general compute model."

---

##  Progress Tracker

### Week-by-Week Checklist

**Month 1-2**:
- [ ] Week 1: Read tiny-gpu README, run all simulations
- [ ] Week 2: Draw GPU architecture diagram from memory
- [ ] Week 3: Study tensor-core systolic array
- [ ] Week 4: Understand memory subsystem design
- [ ] Week 5: LeetGPU: Vector add, Matrix mult, Matrix transpose (CUDA)
- [ ] Week 6: LeetGPU: 1D Conv, ReLU, Color inversion (CUDA)
- [ ] Week 7: LeetGPU: Matrix copy, Leaky ReLU, Rainbow table (CUDA)
- [ ] Week 8: LeetGPU: Matrix addition, Count array elem (CUDA)

**Month 3-4**:
- [ ] Week 9: LeetGPU: Reduction, Softmax, GEMM (CUDA)
- [ ] Week 10: LeetGPU: Dot product, Prefix sum, Sorting (CUDA)
- [ ] Week 11: BitNet: Study quantization, LeetGPU Triton start
- [ ] Week 12: LeetGPU: Continue Medium challenges in Triton
- [ ] Week 13: LeetGPU: Multi-Head Attention (Hard!)
- [ ] Week 14: LeetGPU: Optimize attention kernel
- [ ] Week 15: Study Flash Attention paper, implement optimizations
- [ ] Week 16: Profile and document 3 optimized kernels

**Month 5-6**:
- [ ] Week 17: LeetGPU: 3D Conv, FFT, K-Means (Hard challenges)
- [ ] Week 18: Optimize hard challenges, measure TFLOPS
- [ ] Week 19: Contribute to tiny-gpu (cache/pipelining)
- [ ] Week 20: tensor-core optimization analysis
- [ ] Week 21: Portfolio project 1: Custom attention kernel
- [ ] Week 22: Portfolio project 2: Low-precision kernel
- [ ] Week 23: Portfolio project 3: Memory bandwidth analysis
- [ ] Week 24: Interview prep, write-ups, practice questions

---

##  Quick Wins (Do This Week!)

### Day 1 (4 hours):
```bash
# Morning: GPU Architecture
cd HArdware/tiny-gpu
cat README.md  # Read thoroughly
make test_matadd  # Run simulation
# Study the execution trace output

# Afternoon: Your first CUDA challenge
cd LeetGPU/organized_leetgpu
cat QUICK_START.md
cd official_challenges/challenges/easy/1_vector_add/
cat challenge.html  # Understand the problem
cd ../../../../solutions_by_challenge/01-vector-addition/CUDA/
cat native.cu  # Study CUDA solution
```

### Day 2 (4 hours):
```bash
# Morning: Tensor Core Architecture
cd HArdware/tensor-core
cat src/modules/systolic_array.sv  # Study design
cat src/modules/sysarr_MAC.sv  # Understand MAC units

# Afternoon: Implement vector addition yourself
# Compare with solutions, profile it
```

### Day 3-7:
- Complete 5 Easy challenges from LeetGPU
- Read tiny-gpu sections on memory controllers
- Study tensor-core memory subsystem
- Start a learning journal/blog

---

##  Key Insights for Interviews

### Architecture Understanding
```
 "I've studied GPU architecture by implementing one in Verilog"
 "I understand systolic arrays from my tensor-core work"
 "I've optimized kernels with hardware constraints in mind"
 "I can explain scheduler design and warp scheduling"
```

### Practical Skills
```
 "50+ CUDA kernels implemented"
 "15+ Triton optimizations"
 "Multi-head attention optimization (5.8x speedup)"
 "Profiling with Nsight Compute"
 "Memory bandwidth optimization (23%  89% utilization)"
```

### Hardware/Software Co-design
```
 "I understand how my kernel maps to hardware"
 "I designed memory access patterns around hardware constraints"
 "I optimized for tensor core utilization"
 "I studied systolic array scheduling"
```

---

##  Success Criteria (By Month 6)

### Technical Mastery:
- [ ] Can draw GPU architecture from memory
- [ ] Explain systolic arrays in detail
- [ ] Optimize attention kernels (>4x speedup)
- [ ] Understand Flash Attention deeply
- [ ] Profile and explain bottlenecks
- [ ] Code CUDA kernels fluently

### Portfolio:
- [ ] GitHub repo with 50+ challenges completed
- [ ] 3-5 blog posts on optimizations
- [ ] Performance analysis reports
- [ ] Architecture diagrams
- [ ] Contribution to tiny-gpu

### Interview Readiness:
- [ ] 3 prepared "impressive low-level thing" stories
- [ ] Can explain any optimization technique
- [ ] Understand Anthropic's research (scaling laws, etc.)
- [ ] Practice whiteboard kernel optimization
- [ ] Ready to discuss trade-offs

---

##  Your Competitive Advantages

What makes you stand out:

1. **Hardware + Software**: Most candidates only do one or the other
2. **Real implementation**: You have actual Purdue tensor-core work
3. **Breadth**: 60+ kernels across CUDA/Triton
4. **Depth**: Understanding from RTL to high-level APIs
5. **Unique projects**: tiny-gpu contribution, systolic array analysis
6. **Research connection**: Purdue project shows research capability

---

##  Resources

### Documentation to Read:
- [ ] tiny-gpu README (excellent!)
- [ ] CUDA C Programming Guide
- [ ] Triton Documentation
- [ ] Flash Attention paper
- [ ] Anthropic's scaling laws papers

### Tools to Master:
- [ ] Nsight Compute (profiler)
- [ ] nvprof (profiler)
- [ ] CUDA-GDB (debugger)
- [ ] Nsight Systems (system profiler)

### Communities:
- Twitter: Follow GPU optimization folks
- Discord: Join Triton/CUDA communities
- GitHub: Star and contribute to tiny-gpu

---

**Remember**: You have GOLD with these repos. The hardware repos (tiny-gpu + tensor-core) are your secret weapon that 95% of candidates won't have. Use them!

**Start today. Good luck! **

