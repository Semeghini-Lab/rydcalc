from distutils.core import setup, Extension
import numpy as np

setup(ext_modules=[Extension("arc_c_extensions", ["arc_c_extensions.c"],
                             extra_compile_args = ['-Wall', '-O3'],
      include_dirs=np.get_include())])
