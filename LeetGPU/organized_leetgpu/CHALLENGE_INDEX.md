# LeetGPU Challenge Index

##  Complete Challenge List

### Easy Challenges (16)
| # | Challenge Name | Frameworks Available |
|---|---------------|---------------------|
| 1 | Vector Addition | CUDA, Triton, PyTorch, Mojo, CuTe DSL |
| 2 | Matrix Multiplication | CUDA, Triton, PyTorch, Mojo, CuTe DSL |
| 3 | Matrix Transpose | CUDA, Triton, PyTorch, Mojo, CuTe DSL |
| 7 | Color Inversion | CUDA, Triton, PyTorch, Mojo, CuTe DSL |
| 8 | Matrix Addition | CUDA, PyTorch |
| 9 | 1D Convolution | CUDA, Triton, PyTorch, Mojo, TinyGrad |
| 19 | Reverse Array | CUDA, PyTorch, Mojo |
| 21 | ReLU Activation | CUDA, PyTorch, Mojo |
| 23 | Leaky ReLU | CUDA, PyTorch, Mojo |
| 24 | Rainbow Table | CUDA, PyTorch, Mojo |
| 31 | Matrix Copy | CUDA, PyTorch, Mojo |
| 41 | Simple Inference | PyTorch |
| 43 | Count Array Element | CUDA, PyTorch |
| 44 | Count 2D Array Element | CUDA, PyTorch |
| 52 | SiLU (Sigmoid Linear Unit) | CUDA |
| 54 | SwiGLU (Swish-Gated Linear Unit) | CUDA |

### Medium Challenges (34)
| # | Challenge Name | Frameworks Available |
|---|---------------|---------------------|
| 4 | Reduction | CUDA, PyTorch |
| 5 | Softmax | CUDA, PyTorch, Triton, CuTe DSL, Mojo |
| 6 | Softmax Attention | CUDA, PyTorch |
| 10 | 2D Convolution | CUDA, Triton, PyTorch |
| 13 | Histogramming | CUDA, PyTorch |
| 15 | Sorting | CUDA, PyTorch |
| 16 | Prefix Sum | CUDA, PyTorch |
| 17 | Dot Product | CUDA, PyTorch |
| 18 | Sparse Matrix-Vector Multiplication | CUDA, PyTorch |
| 22 | GEMM (General Matrix Multiply) | CUDA, PyTorch |
| 25 | Categorical Cross-Entropy Loss | CUDA, PyTorch, Triton |
| 27 | Mean Squared Error | CUDA, PyTorch |
| 28 | Gaussian Blur | CUDA, PyTorch |
| 29 | Top-K Selection | CUDA, PyTorch |
| 30 | Batched Matrix Multiplication | CUDA, PyTorch |
| 32 | INT8 Quantized MatMul | CUDA, PyTorch |
| 33 | Ordinary Least Squares | CUDA, PyTorch |
| 34 | Logistic Regression | CUDA, PyTorch |
| 35 | Monte Carlo Integration | CUDA, PyTorch, Mojo, Triton |
| 36 | Radix Sort | CUDA, PyTorch |
| 37 | Matrix Power | CUDA |
| 38 | Nearest Neighbor | CUDA |
| 40 | Batch Normalization | CUDA |
| 42 | 2D Max Pooling | CUDA |
| 45 | Count 3D Array Element | CUDA |
| 46 | BFS Shortest Path | CUDA |
| 47 | Subarray Sum | CUDA |
| 48 | 2D Subarray Sum | CUDA |
| 49 | 3D Subarray Sum | CUDA |
| 50 | RMS Normalization | CUDA |
| 51 | Max Subarray Sum | CUDA |
| 55 | Attention with Linear Biases | CUDA |
| 57 | FP16 Batched MatMul | CUDA |
| 58 | FP16 Dot Product | CUDA |

### Hard Challenges (8)
| # | Challenge Name | Frameworks Available |
|---|---------------|---------------------|
| 11 | 3D Convolution | CUDA |
| 12 | Multi-Head Self-Attention | CUDA, Triton |
| 14 | Multi-Agent Simulation | CUDA |
| 20 | K-Means Clustering | CUDA |
| 39 | Fast Fourier Transform (FFT) | CUDA |
| 53 | Casual Attention | CUDA |
| 56 | Linear Self-Attention | CUDA |
| 59 | Sliding Window Attention | CUDA |

---

##  Challenges by Category

### Linear Algebra & Matrix Operations
- Vector Addition (#1) - Easy
- Matrix Addition (#8) - Easy
- Matrix Multiplication (#2) - Easy
- Matrix Transpose (#3) - Easy
- Matrix Copy (#31) - Easy
- Dot Product (#17) - Medium
- GEMM (#22) - Medium
- Batched Matrix Multiplication (#30) - Medium
- Matrix Power (#37) - Medium
- Sparse Matrix-Vector Multiplication (#18) - Medium

### Activation Functions
- ReLU (#21) - Easy
- Leaky ReLU (#23) - Easy
- Softmax (#5) - Medium
- SiLU/Sigmoid Linear Unit (#52) - Easy
- SwiGLU (#54) - Easy

### Convolutions
- 1D Convolution (#9) - Easy
- 2D Convolution (#10) - Medium
- 3D Convolution (#11) - Hard

### Attention Mechanisms
- Softmax Attention (#6) - Medium
- Multi-Head Self-Attention (#12) - Hard
- Linear Self-Attention (#56) - Hard
- Sliding Window Attention (#59) - Hard
- Casual Attention (#53) - Hard
- Attention with Linear Biases (#55) - Medium

### Loss Functions
- Mean Squared Error (#27) - Medium
- Categorical Cross-Entropy Loss (#25) - Medium

### Normalization
- Batch Normalization (#40) - Medium
- RMS Normalization (#50) - Medium

### Array/Data Operations
- Reverse Array (#19) - Easy
- Reduction (#4) - Medium
- Prefix Sum (#16) - Medium
- Count Array Element (#43) - Easy
- Count 2D Array Element (#44) - Easy
- Count 3D Array Element (#45) - Medium

### Subarray Problems
- Subarray Sum (#47) - Medium
- 2D Subarray Sum (#48) - Medium
- 3D Subarray Sum (#49) - Medium
- Max Subarray Sum (#51) - Medium

### Sorting & Search
- Sorting (#15) - Medium
- Radix Sort (#36) - Medium
- Top-K Selection (#29) - Medium
- Histogramming (#13) - Medium
- BFS Shortest Path (#46) - Medium
- Nearest Neighbor (#38) - Medium

### Image Processing
- Color Inversion (#7) - Easy
- Gaussian Blur (#28) - Medium
- 2D Max Pooling (#42) - Medium

### Machine Learning
- Logistic Regression (#34) - Medium
- Ordinary Least Squares (#33) - Medium
- K-Means Clustering (#20) - Hard
- Simple Inference (#41) - Easy

### Quantization & Precision
- INT8 Quantized MatMul (#32) - Medium
- FP16 Batched MatMul (#57) - Medium
- FP16 Dot Product (#58) - Medium

### Advanced Topics
- Fast Fourier Transform (#39) - Hard
- Monte Carlo Integration (#35) - Medium
- Rainbow Table (#24) - Easy
- Password Cracking (FNV-1a) (#23) - Triton
- Multi-Agent Simulation (#14) - Hard

---

## Framework Coverage

| Framework | # of Challenges | Strengths |
|-----------|----------------|-----------|
| **CUDA** | 60+ | Most comprehensive, all difficulty levels |
| **PyTorch** | 35+ | Easy to medium challenges, great for learning |
| **Triton** | 15+ | Performance-focused, modern challenges |
| **Mojo** | 12+ | Easy challenges, emerging language |
| **CuTe DSL** | 8+ | Template-based CUDA, advanced patterns |
| **TinyGrad** | 3 | Basic operations only |

---

## Recommended Learning Paths

### Path 1: Complete Beginner
1. Start with PyTorch implementations (easy challenges)
2. Understand the algorithms first
3. Then move to Triton for better performance
4. Finally tackle CUDA for full control

### Path 2: CUDA Developer
1. Start with CUDA easy challenges
2. Master memory management and optimization
3. Progress through medium and hard challenges
4. Compare with other frameworks for insights

### Path 3: ML Engineer
Focus on:
- Activation functions (#21, #23, #5, #52, #54)
- Attention mechanisms (#6, #12, #56, #59)
- Loss functions (#25, #27)
- Convolutions (#9, #10, #11)
- Normalization (#40, #50)

### Path 4: Algorithms Specialist
Focus on:
- Sorting & search (#15, #36, #29, #13)
- Graph algorithms (#46)
- Dynamic programming (#47, #48, #49, #51)
- Advanced algorithms (#39, #35, #20)

---

## Tips for Success

1. **Start Simple**: Begin with vector addition, it teaches the basics
2. **Understand Memory**: Pay attention to memory access patterns
3. **Profile Everything**: Use nvprof, nsight, or PyTorch profiler
4. **Compare Implementations**: See how different frameworks solve the same problem
5. **Optimize Iteratively**: First make it work, then make it fast
6. **Read CUDA Documentation**: Essential for understanding GPU architecture

---

**Total Challenges**: 58 unique challenges  
**Total Implementations**: 200+ across all frameworks  
**Lines of Code**: 10,000+ lines of GPU code

Happy Learning!

