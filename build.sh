echo "Torghost installer v3.0"
echo "Installing prerequisites "
sudo apt-get install tor python3-pip python3-dev -y 
echo "Installing dependencies "
sudo pip3 install -r requirements.txt 
PYVER=$(python3 --version | awk '{print$2}' | cut -f 1,2 -d .)
mkdir build
cd build
cython3 ../torghost.py --embed -o torghost.c --verbose
if [ $? -eq 0 ]; then
    echo [SUCCESS] Generated C code
else
    echo [ERROR] Build failed. Unable to generate C code using cython3
    exit 1
fi
gcc -Os -I /usr/include/python${PYVER} -o torghost torghost.c -lpython${PYVER} -lpthread -lm -lutil -ldl
if [ $? -eq 0 ]; then
    echo [SUCCESS] Compiled to static binay 
else
    echo [ERROR] Build failed
    exit 1
fi
sudo cp -r torghost /usr/bin/
if [ $? -eq 0 ]; then
    echo [SUCCESS] Copied binary to /usr/bin 
else
    echo [ERROR] Unable to copy
    ecit 1
fi

