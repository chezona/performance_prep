# Anthropic Interview Preparation

Complete 6-month preparation materials for Anthropic Performance Engineer, TPU Kernel Engineer, and GPU Performance Engineer roles.

## Folder Structure

```
Anthropic_Interview_Prep/
├── 00_Documentation/           # Study plans and guides
│   ├── ANTHROPIC_INTERVIEW_PREP_UPDATED.md    # Complete 6-month plan
│   ├── QUICK_REFERENCE_ANTHROPIC.md           # Quick reference guide
│   ├── Anthropic_Interview_Prep_Tasks.csv     # Weekly task tracker (24 weeks)
│   └── CUDA_MODE_Integration.md               # How to use CUDA MODE lectures
│
├── 01_LeetGPU/                 # GPU kernel programming (60+ challenges)
│   ├── organized_leetgpu/      # CUDA, Triton, PyTorch implementations
│   │   ├── README.md
│   │   ├── CHALLENGE_INDEX.md
│   │   ├── official_challenges/
│   │   ├── solutions_by_framework/
│   │   └── solutions_by_challenge/
│   └── CUDA_MODE_Lectures/     # 70+ lectures from industry experts (symlink)
│
├── 02_Hardware_Repos/          # GPU/TPU architecture studies
│   ├── tiny-gpu/              # Complete GPU implementation (Verilog)
│   ├── tensor-core/           # Systolic array & tensor core (Purdue)
│   ├── systemverilog-homework/ # Digital design fundamentals
│   └── coralnpu/              # Google's NPU architecture
│
├── 03_Quantization/            # Low-precision optimization
│   ├── BitNet/                # 1.58-bit quantization
│   └── ggml/                  # ML framework internals
│
└── 04_Portfolio_Projects/      # Space for your projects
    ├── custom_attention_kernel/
    ├── low_precision_kernel/
    ├── memory_bandwidth_analysis/
    └── systolic_array_analysis/
```

## Quick Start

### Week 1-2: GPU Architecture
```bash
cd 02_Hardware_Repos/tiny-gpu
# Read README, run simulations
make test_matadd
make test_matmul
```

### Week 3-4: Tensor Core Architecture
```bash
cd 02_Hardware_Repos/tensor-core
# Study systolic array implementation
cat src/modules/systolic_array.sv
cat src/modules/sysarr_MAC.sv
```

### Week 5+: Start Coding Challenges
```bash
cd 01_LeetGPU/organized_leetgpu
# Check CHALLENGE_INDEX.md for full list
cd official_challenges/challenges/easy/1_vector_add/
```

## Time Allocation (30 hrs/week)

- **LeetGPU Challenges**: 30% (9 hours) - Hands-on kernel implementation
- **CUDA MODE Lectures**: 20% (6 hours) - Watch lectures + study code
- **tiny-gpu**: 15% (4.5 hours) - GPU architecture understanding
- **tensor-core**: 15% (4.5 hours) - Hardware design
- **BitNet + ggml**: 10% (3 hours) - Framework internals
- **systemverilog**: 5% (1.5 hours) - Digital design
- **coralnpu**: 5% (1.5 hours) - NPU architecture

## Progress Tracking

Use `00_Documentation/Anthropic_Interview_Prep_Tasks.csv` to track your weekly progress:
- 24 weeks of structured tasks
- Organized by week and priority
- Tracks hours, difficulty, and deliverables

Import into:
- Excel/Google Sheets
- Notion (import as database)
- Obsidian (as dataview)

## Key Resources

### Documentation
- Complete study plan with weekly breakdown
- Quick reference for interview prep
- Challenge index with 58+ problems

### Repositories (via symlinks)
- All repos linked from original locations
- No duplication, saves disk space
- Updates reflect in original repos

### Target Roles
1. **Performance Engineer** ($315k-$560k)
   - GPU/Accelerator programming
   - High-performance ML systems
   - Low-precision inference kernels

2. **TPU Kernel Engineer** ($280k-$560k)
   - TPU kernel optimization
   - Systolic array design
   - Computer architecture

3. **GPU Performance Engineer** ($315k-$560k)
   - CUDA kernel development
   - Tensor core optimization
   - Flash Attention implementation

## Interview Preparation Checklist

### Technical Skills
- [ ] Completed 50+ LeetGPU challenges
- [ ] Can draw GPU architecture from memory
- [ ] Understand systolic arrays in detail
- [ ] Optimized attention kernels (>4x speedup)
- [ ] Profile and explain bottlenecks
- [ ] Code CUDA kernels fluently

### Portfolio
- [ ] GitHub repo with challenges completed
- [ ] 3-5 blog posts on optimizations
- [ ] Performance analysis reports
- [ ] Architecture diagrams
- [ ] Contribution to tiny-gpu

### Interview Readiness
- [ ] 3 prepared "impressive low-level thing" stories
- [ ] Can explain any optimization technique
- [ ] Understand Anthropic's research
- [ ] Practice whiteboard kernel optimization
- [ ] Ready to discuss trade-offs

## Study Schedule

Import `Anthropic_Interview_Prep_Tasks.csv` into your preferred tool and follow week-by-week:

**Months 1-2**: Architecture + Easy Challenges
**Months 3-4**: Medium Challenges + Attention Mechanisms
**Months 5-6**: Hard Challenges + Portfolio Projects

## Notes

- Symlinks preserve original repo structure
- Changes sync with original repos
- CSV file tracks all 24 weeks of tasks
- All documentation is emoji-free (clean ASCII)

## Next Steps

1. Open `00_Documentation/ANTHROPIC_INTERVIEW_PREP_UPDATED.md`
2. Import `Anthropic_Interview_Prep_Tasks.csv` into your task manager
3. Start Week 1: Read tiny-gpu README
4. Track progress weekly in CSV

Good luck!

