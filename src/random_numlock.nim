import std/[os, random]
import winim

type
    SendKeys = array[2, INPUT]
var
    inputs: SendKeys
const
    key = VK_NUMLOCK
    delayMin = 25_000
    delayJitter = 10_000

# Key Down event
inputs[0].type = INPUT_KEYBOARD
inputs[0].ki.wVk = key

# Key Up event
inputs[1].type = INPUT_KEYBOARD
inputs[1].ki.wVk = key
inputs[1].ki.dwFlags = KEYEVENTF_KEYUP

# Send keypress randomly
while true:
    SendInput((UINT)len(inputs), &inputs[0], (int32)sizeof(INPUT));
    sleep(delayMin + rand(delayJitter))