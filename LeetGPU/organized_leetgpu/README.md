# LeetGPU - Organized Structure

This folder contains a reorganized version of the LeetGPU challenges and solutions, consolidated from three different folder structures into a clean, logical organization.

##  Folder Structure

### 1. `official_challenges/`
Contains the **official LeetGPU challenges** organized by difficulty level:
- **easy/** - Beginner-friendly challenges
- **medium/** - Intermediate difficulty challenges  
- **hard/** - Advanced challenges

Each challenge includes:
- `challenge.html` - Problem description and requirements
- `challenge.py` - Test cases and validation
- `starter/` - Starter code templates for different frameworks (CUDA, Triton, PyTorch, Mojo, CuTe DSL)

### 2. `solutions_by_framework/`
Solutions organized by **programming framework/language**:

- **CUDA/** - Pure CUDA C/C++ implementations (~60 challenges)
- **Triton/** - OpenAI Triton implementations
- **PyTorch/** - PyTorch-based solutions (~35 challenges)
- **Mojo/** - Mojo language implementations
- **CuTe_DSL/** - CuTe DSL implementations
- **CuTe_DSL_standalone/** - Individual CuTe DSL solution files
- **TinyGrad/** - TinyGrad framework solutions

Each framework folder contains challenge solutions organized by challenge name.

### 3. `solutions_by_challenge/`
Solutions organized by **challenge number and name**:

- `01-vector-addition/`
- `02-matrix-multiplication/`
- `03-matrix-transpose/`
- `09-rainbow-table/`
- `11-monte-carlo-integration/`
- `13-softmax/`
- `22-categorical-cross-entropy-loss/`
- `23-password-cracking-fnv-1a/`
- `32-multi-head-self-attention/`

Each challenge folder contains subdirectories for different framework implementations:
- `CUDA/` - CUDA implementation
- `CuTeDSL/` - CuTe DSL implementation
- `MOJO/` - Mojo implementation
- `Triton/` - Triton implementation

### 4. `utils/`
Utility scripts and helper functions:
- `createFolder.py` - Folder creation utilities

---

##  How to Use This Structure

### If you want to explore challenges by difficulty:
 Go to `official_challenges/challenges/easy|medium|hard/`

### If you want to see all solutions for a specific framework:
 Go to `solutions_by_framework/[Framework Name]/`

### If you want to see all implementations of a specific challenge:
 Go to `solutions_by_challenge/[Challenge Number-Name]/`

---

##  Challenge Categories

### Common Challenge Types:
- **Linear Algebra**: Vector addition, matrix multiplication, matrix transpose, dot product, GEMM
- **Deep Learning Operations**: Softmax, ReLU, Leaky ReLU, attention mechanisms, batch normalization
- **Image Processing**: Color inversion, Gaussian blur, convolutions (1D, 2D, 3D)
- **Algorithms**: Sorting, prefix sum, reduction, histogramming, radix sort
- **Advanced Topics**: Monte Carlo integration, K-means clustering, FFT, password cracking
- **Neural Network Primitives**: Multi-head attention, categorical cross-entropy loss, mean squared error

---

##  Getting Started

1. **Choose your preferred framework** (CUDA, Triton, PyTorch, etc.)
2. **Browse challenges** in `official_challenges/` to understand the requirements
3. **Study solutions** in `solutions_by_framework/` or `solutions_by_challenge/`
4. **Run and modify** the code to learn GPU programming concepts

---

##  Original Sources

This organized structure consolidates content from:
1. `LeetGPU/LeetGPU/` - Mixed framework and challenge organization
2. `LeetGPU/leetgpu-challenges-main/` - Official challenge repository

The original README is preserved as `README_original.md` for reference.

---

##  Contributing

To add new solutions or challenges:
1. Add to the appropriate framework folder in `solutions_by_framework/`
2. If it's a new challenge, create a folder in `solutions_by_challenge/`
3. Update official challenges in `official_challenges/` if applicable

---

##  Framework Comparison

| Framework | Difficulty | Use Case | File Type |
|-----------|-----------|----------|-----------|
| **PyTorch** | Easy | High-level, research | `.py` |
| **Triton** | Medium | Performance-focused Python | `.py` |
| **CUDA** | Hard | Low-level, maximum control | `.cu` |
| **Mojo** | Medium | Modern systems language | `.mojo` |
| **CuTe DSL** | Medium | CUDA template DSL | `.py` |
| **TinyGrad** | Easy | Minimal ML framework | `.py` |

---

##  Resources

- [LeetGPU Official](https://leetgpu.com)
- [CUDA Programming Guide](https://docs.nvidia.com/cuda/)
- [Triton Documentation](https://triton-lang.org/)
- [PyTorch CUDA Semantics](https://pytorch.org/docs/stable/notes/cuda.html)

---

**Last Updated**: December 21, 2025  
**Total Challenges**: 60+ across multiple frameworks  
**Organization Version**: 1.0

