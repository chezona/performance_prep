#!/usr/bin/env python3
"""
GPU Programming Environment Setup Script
This script helps verify your GPU environment is properly configured.
"""

import sys
import subprocess
import importlib.util

def check_python_version():
    """Check if Python version is compatible."""
    if sys.version_info < (3, 8):
        print("❌ Python 3.8+ is required. Current version:", sys.version)
        return False
    print(f"✅ Python version: {sys.version}")
    return True

def check_package(package_name, import_name=None):
    """Check if a package is installed and importable."""
    if import_name is None:
        import_name = package_name
    
    try:
        importlib.import_module(import_name)
        print(f"✅ {package_name} is installed")
        return True
    except ImportError:
        print(f"❌ {package_name} is not installed")
        return False

def check_cuda():
    """Check CUDA availability."""
    try:
        import torch
        if torch.cuda.is_available():
            device_count = torch.cuda.device_count()
            device_name = torch.cuda.get_device_name(0) if device_count > 0 else "Unknown"
            print(f"✅ CUDA is available")
            print(f"   - Devices: {device_count}")
            print(f"   - Primary device: {device_name}")
            print(f"   - CUDA version: {torch.version.cuda}")
            return True
        else:
            print("❌ CUDA is not available")
            return False
    except Exception as e:
        print(f"❌ Error checking CUDA: {e}")
        return False

def test_basic_operations():
    """Test basic GPU operations."""
    try:
        import torch
        
        # Test tensor creation and GPU transfer
        x = torch.randn(100, 100)
        if torch.cuda.is_available():
            x_gpu = x.cuda()
            result = torch.square(x_gpu)
            print("✅ Basic GPU operations work")
            return True
        else:
            print("⚠️  GPU not available, testing CPU operations")
            result = torch.square(x)
            print("✅ Basic CPU operations work")
            return True
    except Exception as e:
        print(f"❌ Error in basic operations: {e}")
        return False

def test_triton():
    """Test Triton installation."""
    try:
        import triton
        import triton.language as tl
        print(f"✅ Triton is working (version: {triton.__version__})")
        return True
    except Exception as e:
        print(f"❌ Triton test failed: {e}")
        return False

def test_numba_cuda():
    """Test Numba CUDA installation."""
    try:
        from numba import cuda
        print("✅ Numba CUDA is available")
        
        # Check if CUDA is detected by Numba
        if cuda.is_available():
            print(f"   - Numba detected CUDA devices: {len(cuda.gpus)}")
            return True
        else:
            print("⚠️  Numba CUDA installed but no CUDA devices detected")
            return False
    except Exception as e:
        print(f"❌ Numba CUDA test failed: {e}")
        return False

def main():
    """Run all environment checks."""
    print("🔍 GPU Programming Environment Check")
    print("=" * 40)
    
    checks = [
        ("Python Version", check_python_version),
        ("PyTorch", lambda: check_package("torch")),
        ("CUDA Support", check_cuda),
        ("Triton", test_triton),
        ("Numba CUDA", test_numba_cuda),
        ("NumPy", lambda: check_package("numpy")),
        ("Matplotlib", lambda: check_package("matplotlib")),
        ("Basic Operations", test_basic_operations),
    ]
    
    results = []
    for name, check_func in checks:
        print(f"\n🔍 Checking {name}...")
        try:
            result = check_func()
            results.append((name, result))
        except Exception as e:
            print(f"❌ Error checking {name}: {e}")
            results.append((name, False))
    
    print("\n" + "=" * 40)
    print("📊 Summary:")
    
    passed = sum(1 for _, result in results if result)
    total = len(results)
    
    for name, result in results:
        status = "✅ PASS" if result else "❌ FAIL"
        print(f"   {name}: {status}")
    
    print(f"\nOverall: {passed}/{total} checks passed")
    
    if passed == total:
        print("🎉 Your environment is ready for GPU programming!")
        return True
    else:
        print("⚠️  Some components need attention. Check the installation guide above.")
        return False

if __name__ == "__main__":
    main()
