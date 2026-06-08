import subprocess
import sys
import os

def run(args):
    subprocess.check_call([sys.executable, "-m", "pip"] + args)

def main():
    print("\n" + "=" * 44)
    print("   PylaAi-XXZ Setup")
    print("=" * 44 + "\n")

    run(["install", "--upgrade", "pip", "--quiet"])

    print("Installing numpy...")
    run(["install", "numpy==1.26.4", "--force-reinstall", "--no-deps", "--quiet"])

    print("Installing core packages...")
    run(["install",
        "Pillow>=10.0.0",
        "aiohttp",
        "requests",
        "packaging>=23.0",
        "toml>=0.10.2",
        "psutil>=7.0.0",
        "websockets>=15.0",
        "discord.py>=2.3.2",
        "customtkinter>=5.2.0",
        "PySide6>=6.7.0",
        "pyautogui>=0.9.54",
        "easyocr",
        "ultralytics",
        "google-play-scraper",
        "--quiet",
    ])

    print("Installing adb and av...")
    run(["install", "adbutils==2.12.0", "av==12.3.0", "--quiet"])

    print("Installing PyTorch (CPU)...")
    run(["install", "torch", "torchvision",
         "--index-url", "https://download.pytorch.org/whl/cpu", "--quiet"])

    print("Installing ONNX Runtime (DirectML)...")
    run(["install", "onnxruntime-directml==1.24.4", "--quiet"])

    print("Installing scrcpy client...")
    run(["install",
         "https://github.com/leng-yue/py-scrcpy-client/archive/refs/tags/v0.5.0.zip",
         "--no-deps", "--quiet"])

    print("Pinning opencv...")
    subprocess.run([sys.executable, "-m", "pip", "uninstall",
                    "opencv-python", "opencv-python-headless", "-y"],
                   check=False, capture_output=True)
    run(["install", "opencv-python==4.8.0.76", "--force-reinstall", "--no-deps", "--quiet"])

    print("Pinning numpy...")
    run(["install", "numpy==1.26.4", "--force-reinstall", "--no-deps", "--quiet"])

    os.system("cls" if os.name == "nt" else "clear")
    print("\n" + "=" * 44)
    print("   Setup Complete! Run multi_instance_add_instance.bat")
    print("=" * 44 + "\n")

if __name__ == "__main__":
    try:
        main()
    except subprocess.CalledProcessError as e:
        print(f"\nSetup failed: {e}")
        sys.exit(1)
