import std/[os, random]
import winim

const
    delayMin = 25_000
    delayJitter = 10_000

proc pressKey(key: WORD) =
    var keys: array[2, INPUT]
    # Key Down
    keys[0].type = INPUT_KEYBOARD
    keys[0].ki.wVk = key
    # Key Up
    keys[1].type = INPUT_KEYBOARD
    keys[1].ki.wVk = key
    keys[1].ki.dwFlags = KEYEVENTF_KEYUP
    SendInput((UINT)len(keys), &keys[0], (int32)sizeof(INPUT));

proc holdDownKey(key: WORD) =
    var keys: array[1, INPUT]
    # Key Down
    keys[0].type = INPUT_KEYBOARD
    keys[0].ki.wVk = key
    SendInput((UINT)len(keys), &keys[0], (int32)sizeof(INPUT));

proc releaseKey(key: WORD) =
    var keys: array[1, INPUT]
    # Key Up
    keys[0].type = INPUT_KEYBOARD
    keys[0].ki.wVk = key
    keys[0].ki.dwFlags = KEYEVENTF_KEYUP
    SendInput((UINT)len(keys), &keys[0], (int32)sizeof(INPUT));

while true:
    # holdDownKey(VK_NUMLOCK)
    # sleep(2_000)
    # releaseKey(VK_NUMLOCK)
    # sleep(8_000)
    echo "NL"
    pressKey(VK_NUMLOCK)
    sleep(delayMin + rand(delayJitter))
    