## Application Development

### List Project templates

```
vega project list-templates
```

### Vega Project Create from template

```
vega project generate --template helloWorld --name sampleapp --packageId com.amazondeveloper.sampleapp --outputDir sampleapp
```

### Install dependencies for the project

```
cd sampleapp
npm install
```

### Build the project

```
npm run build:app
```


## Running the application

### Start/Stop Vega virtual device

```
vega virtual-device start
---
vega virtual-device stop

```

### Open shell of virutal device

```
vega device shell -d VirtualDevice
```

### Enable developer mode on the virtual device

```
vsm developer-mode enable
```


### Run the application on the virtual device

```
vega run-app sampleapp.vpkg com.amazondeveloper.sampleapp.main -d VirtualDevice
```


