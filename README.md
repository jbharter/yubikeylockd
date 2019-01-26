# yubikeylockd

Simple daemon for locking and unlocking macOS with Yubikey.

## Build
```
make clean
make install
```

## Additional requirements
  * [YubiKey using the native smart card (PIV) mode](https://www.yubico.com/why-yubico/for-businesses/computer-login/mac-os-login/)

## How it works

When you attach Yubikey for the first time `launchctl` will run `yubikeylockd` daemon
that will simply monitor the state of the Yubikey USB devices.
Daemon based on the sample provided by Apple for IOKit development.

It does two things:
* when device is attached it makes activity via
```IOPMAssertionDeclareUserActivity``` call to turn screen on
* after device is detached it uses ```SACLockScreenImmediate``` from the Login framework to immediately lock macOS
