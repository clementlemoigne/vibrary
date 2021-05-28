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
    document.querySelectorAll('[data-vibe]').forEach((p, index) => {
      p.dataset.id = index;
      const onOffHash = {
        index: p.dataset.id,
        intensity: p.dataset.intensity,
        state: 0
      };
      arrayOfHashes.push(onOffHash)
      console.log(arrayOfHashes);

      window.addEventListener('scroll', async (event) => {
        if ((p.getBoundingClientRect().y < positionFocusZoneBottom) && (positionFocusZoneTop < p.getBoundingClientRect().bottom)) {
          arrayOfHashes[index].state = 1;
        } else {
          arrayOfHashes[index].state = 0;
        }

        const onOffArray = []
        arrayOfHashes.forEach((hash) => {
          onOffArray.push(hash.state);
        });

        const isOff = (currentValue) => currentValue === 0;
        if (onOffArray.every(isOff)) {
          await device.stop();
        } else {
          try {
            await device.vibrate(1.0);
          } catch (e) {
            console.log(e);
            if (e instanceof Buttplug.ButtplugDeviceError) {
              console.log("got a device error!");
            }
          }
        }
      });

      // const positionTextVibingTop = document.querySelectorAll(".vibe").getBoundingClientRect().y;
      // const positionTextVibingBottom = document.querySelectorAll(".vibe").getBoundingClientRect().bottom;
      // const positionFocusZoneTop = document.querySelector(".vibrating-zone").getBoundingClientRect().y;
      // const positionFocusZoneBottom = document.querySelector(".vibrating-zone").getBoundingClientRect().bottom;
      // if ((positionTextVibingTop < positionFocusZoneBottom) && (positionFocusZoneTop < positionTextVibingBottom )) {
      //   console.log("je suis dedans");
      //   try {
      //     await device.vibrate(0.2);
      //   } catch (e) {
      //     console.log(e);
      //     if (e instanceof Buttplug.ButtplugDeviceError) {
      //       console.log("got a device error!");
      //     }
      //   }
      // } else {
      //   console.log("je suis dehors");
      //   await device.stop();
      // }

    // if (positionTextVibingTop < positionFocusZoneTop) {
    //   if ((positionTextVibingBottom < positionFocusZoneTop) || (positionTextVibingTop > positionFocusZoneBottom)) {
    //     console.log("STOP");
    //     await device.stop();
    //   } else {
    //     console.log("WIZZZZZZZZ");
    //     try {
    //       await device.vibrate(0.2);
    //     } catch (e) {
    //       console.log(e);
    //       if (e instanceof Buttplug.ButtplugDeviceError) {
    //         console.log("got a device error!");
    //       }
    //     }
    //   }
    // }

    });

    const btn_off = document.getElementById("stop-vibing");
    await btn_off.addEventListener("click", async (event) => {
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

export {
  initButtplug
};

// document.addEventListener("DOMContentLoaded", () => {
//   const btn = document.getElementById("toggle-scan");
//   btn.addEventListener("click", (event) => {
//     runDeviceEnumerationExample();
//   });
// });
