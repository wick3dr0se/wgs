<div align="center">
<h1><a href="https://github.com/wick3dr0se/wgs">wgs</a> - wallpaper getter setter</h1>
<p>Written in pure BASH, <code>wgs</code> is minimal, fast and requires no external dependencies outside of your supported wallpaper setter choice. <code>wgs</code> utilizes Unsplash's API to return random images based on optional queries. <code>wgs</code> can repeatedly download and set images, with common wallpaper setters, on a set interval. It can also be pushed to the background and disowned from the terminal (see below) to keep <code>wgs</code> alive, even upon closing the window</p> 

<img src="https://shields.io/badge/made-with%20%20bash-green?style=flat-square&color=d5c4a1&labelColor=1d2021&logo=gnu-bash">
<img src=https://img.shields.io/badge/Maintained%3F-yes-green.svg></img>  
<a href="https://discord.gg/W4mQqNnfSq">
<img src="https://discordapp.com/api/guilds/913584348937207839/widget.png?style=shield"/></a>
</div>

## Install
Download the repository
```bash
git clone https://github.com/wick3dr0se/wgs&& cd wgs
```

## Arguments
```bash
-a [interval]  ...  repeatedley get/set wallpapers per interval
-o <file_name>  ...  set wallpaper name to file name
```

*Legend*  
`[]` - optional option  
`<>` - required argument  
`#` - comment

## Usage
Download and set a completely random image to wallpaper
```bash
bash wgs.sh
```

Name image output
```bash
bash wgs.sh <-o:wallpaper_name>
```

Download and set a random image based on quer{y,ies}
```bash
bash wgs.sh <query> <query>
```

Continuously download and set images
```bash
bash -a <interval:N> <query>
```

*interval will fallback to 30 seconds when -a is supplied without :N seconds*

Cotinuously download and set images in the background
```bash
bash -a <interval:N> <query> & disown
# if you run it more than once, make sure to kill the previous process, otherwise they will stack
```
