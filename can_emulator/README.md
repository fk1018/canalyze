# Can Emulator

## Description

The purpose of this code is to send messages to the can bus

## Setting up virtual can bus to emulate and test locally with

### Step 1: Load the `vcan` Kernel Module

The `vcan` (virtual CAN) module enables the creation of virtual CAN devices. Run the following command to load this module:

```bash
sudo modprobe vcan
```

### Step 2: Create the vcan0 Interface

After loading the module, create the vcan0 interface:

```bash
sudo ip link add dev vcan0 type vcan
```

### Step 3: Bring vcan0 Up

Enable (bring up) the vcan0 interface to make it active:

```bash
sudo ip link set vcan0 up
```

### Step 4: Verify vcan0 is Active

Check if vcan0 is now available by running:

```bash
ip link show vcan0
```

If vcan0 is active, you should see output similar to this:

```bash
3: vcan0: <NOARP,UP,LOWER_UP> mtu 72 qdisc noop state UNKNOWN mode DEFAULT group default qlen 1000 link/can
```

### Step 5: Run Your CAN Emulator

With vcan0 set up, you can now run your CAN emulator:

```bash
ruby main.rb
```

### Step 6: (Optional) Install can-utils for Testing

```bash
sudo apt install can-utils
```

#### Example Usage with can-utils

- Monitor messages on vcan0:

  ```bash
  candump vcan0
  ```

- Send a test message on vcan0:
  ```bash
    cansend vcan0 123#DEADBEEF
  ```
