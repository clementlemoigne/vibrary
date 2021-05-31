import {
  buttplugInit,
  ButtplugClient,
  ButtplugEmbeddedConnectorOptions
} from "buttplug";

async function runDeviceEnumerationExample() {
  // Instantiate our wasm module. This only needs to be done once. If you did it
  // elsewhere, ignore this.
  await buttplugInit();

  let client = new ButtplugClient("Device Enumeration Example");

  // Set up our DeviceAdded/DeviceRemoved event handlers before connecting. If
  // devices are already held to the server when we connect to it, we'll get
  // "deviceadded" events on successful connect.
  client.addListener("deviceadded", async (device) => {
    console.log(`Device Connected: ${device.Name}`);
    console.log("Client currently knows about these devices:");
    client.Devices.forEach((device) => console.log(`- ${device.Name}`));
    try {
      await device.vibrate(1.0);
    } catch (e) {
      console.log(e);
      if (e instanceof Buttplug.ButtplugDeviceError) {
        console.log("got a device error!");
      }
    }
    await new Promise(r => setTimeout(r, 1000));
    await device.stop();

    const positionFocusZoneTop = document.querySelector(".vibrating-zone").getBoundingClientRect().y;
    const positionFocusZoneBottom = document.querySelector(".vibrating-zone").getBoundingClientRect().bottom;

    const arrayOfHashes = [];

    window.addEventListener('scroll', async (event) => {

      document.querySelectorAll('[data-vibe]').forEach((p, index) => {
        p.dataset.id = index;
        const onOffHash = {
          index: p.dataset.id,
          intensity: p.dataset.intensity,
          state: 0
        };
        arrayOfHashes[index] = onOffHash;

        if ((p.getBoundingClientRect().y < positionFocusZoneBottom) && (positionFocusZoneTop < p.getBoundingClientRect().bottom)) {
          arrayOfHashes[index].state = 1;
        } else {
          arrayOfHashes[index].state = 0;
        }

        // console.log(arrayOfHashes);
        const vibingP = arrayOfHashes.find(element => element.state === 1);
        if (vibingP) {
          // console.log("I'm on");
          try {
            device.vibrate(parseFloat(vibingP.intensity));
          } catch (e) {
            console.log(e);
            if (e instanceof Buttplug.ButtplugDeviceError) {
              console.log("got a device error!");
            }
          }
        } else {
          // console.log("I'm off");
          device.stop();
        }
      });

    });

    const btn_off = document.getElementById("stop-vibing");
    btn_off.addEventListener("click", async (event) => {
      event.preventDefault();
      console.log("btn stop");
      await device.stop();
    });
  });

  client
    .addListener("deviceremoved", (device) => console.log(`Device Removed: ${device.Name}`));

  // Usual embedded connector setup.
  const connector = new ButtplugEmbeddedConnectorOptions();
  await client.connect(connector);

  // Now that everything is set up, we can scan.
  await client.startScanning();
};

const initButtplug = () => {
  const btn = document.getElementById("toggle-scan");
  if (btn) {
    btn.addEventListener("click", (event) => {
      console.log("coucou");
      event.preventDefault();
      runDeviceEnumerationExample();
    });
  }
};

export { initButtplug };

// document.addEventListener("DOMContentLoaded", () => {
//   const btn = document.getElementById("toggle-scan");
//   btn.addEventListener("click", (event) => {
//     runDeviceEnumerationExample();
//   });
// });
