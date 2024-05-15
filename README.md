# Protein Folding (OVC Application)

This project was based on [Omniverse Kit App Template](https://github.com/NVIDIA-Omniverse/kit-app-template). From that basis changes where made to create a custom application based on USD Explorer. This custom application was created as if a company called RedShift wanted to publish an application called “Protein Folding” that would be hosted on a NVIDIA OVC platform. This OVC application will not really do anything other than the standard USD Explorer functionality. But all names, descriptions, titles, etc are changed to remove "USD Explorer" and customized for this fake company/app.

There is one addition of a custom extension (Protein Scaling) that shows up under the “window” menu dropdown. This is just to show that one can create both a custom application with some additional unique extensions.

> **_NOTE:_**  This repo can be used for both Windows and Linux application creation. Most of the execution steps are shown with the .bat usage, substitute with .sh when building/running on Linux



## Links

* Recommended: [Tutorial](https://docs.omniverse.nvidia.com/kit/docs/kit-app-template) for
getting started with application development.
* [Developer Guide](https://docs.omniverse.nvidia.com/dev-guide/latest/index.html).

## Build

1. Clone [OVC-App-Protein-Folding](https://gitlab-master.nvidia.com/nves/omniveres/ovc-app-protein-folding) to your local machine.
2. Open a command prompt and navigate to the root of your cloned repo.
3. Run `build.bat`
4. Run `_build\windows-x86_64\release\reshift.protein_folding.ovc.bat`

## Package for Launcher

1. Run `build.bat -c`
2. Run `build.bat`
3. Run `repo.bat package --launcher`

After packageing install on Launcher:

```
start omniverse-launcher://install?path="E:/Omniverse/GITS/ovc-app-protein-folding/_build/packages/kit-a
pp-template.2024.1.0.windows-x86_64-launcher-package.zip"
```

or

```
xdg-open omniverse-launcher://install?path="/home/ubuntu/omniverse/GITs/ovc-app-protein-folding-main/_build/packages/kit-app-template.2024.1.0.linux-x86_64-launcher-package.zip" 
```

## Package for OVC
1. Run `build.bat -c`
2. Run `build.bat`
3. Run `repo.bat package`

### Containerize for OVC

```
Some stuyff
```

<span style="font-size:0.9em;">Text goes here</span>

## Upload to OVC
TBD

## Contributing
The source code for this repository is provided as-is and we are not accepting outside contributions.
