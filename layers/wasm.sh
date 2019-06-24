ENV PATH $PATH:/root/.cargo/bin

# SCRIPT
apt_install cmake make curl libc6-dev-i386
tag=release_80

git clone --depth 1 --branch $tag https://github.com/llvm-mirror/llvm.git
cd llvm/tools
git clone --depth 1 --branch $tag https://github.com/llvm-mirror/clang
git clone --depth 1 --branch $tag https://github.com/llvm-mirror/lld
cd ..
mkdir build
cd build
#-DLLVM_LINK_LLVM_DYLIB=ON
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DLLVM_TARGETS_TO_BUILD= -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly ..
make -j 4 install

cd ../..
rm -rf llvm

# Setup rust
while ! curl https://sh.rustup.rs -sSf | sh -s -- -y
do
  true
done

cargo install --git "https://github.com/alexcrichton/wasm-gc.git"

git clone --recursive https://github.com/WebAssembly/wabt
cd wabt
make gcc-release
cp bin/* /usr/bin
cd ..
rm -rf wabt


apt-get remove -y cmake make curl

