# arm7-chrome
DockerHub:https://hub.docker.com/r/aemilianmayrhofer/arm7-chrome
The docker image runs on ARM7 machines and includes a chromium-browser installation as well as a chrome user.

```
//make sure the current core is based on armv7 
uname -a 
```

 # How to Use 

  - Build by this DockerFile or pull the image
  
  ```sh
  docker pull aemilianmayrhofer/arm7-chrome
  ```
  - Add executablePath:'/usr/bin/chromium-browser' or don't set any executablePath
  - using the base commands:
  ```sh 
  docker run -d -p 9222:9222 --cap-add=SYS_ADMIN aemilianmayrhofer/arm7-chrome:latest 
  ```

### example.js 
```
const puppeteer = require('puppeteer');

(async() => {
    const browser = await puppeteer.launch({
        executablePath:'/usr/bin/chromium-browser',
        args: [
            '--no-sandbox',
            '--disable-setuid-sandbox'
        ]
    });
    const page = await browser.newPage();
    await page.goto('https://www.google.com/', {waitUntil: 'networkidle2'});
    await browser.close();
})();
```

https://www.henry.wang/2019/12/05/arm-dockerhub.html

