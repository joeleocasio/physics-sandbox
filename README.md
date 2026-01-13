# Physics Sandbox (Love2D)

A small, interactive physics playground built in **Love2D** using the built-in **Box2D** physics engine.  
The goal of this project is to hack a thing to explore physics systems (bodies/fixtures/material properties), and basic interactions.

## Features

- Spawn physics objects that collide, stack, and roll
  - Left click: circles
  - Right click: boxes
- Material presets that change how objects behave
  - Rubber / Metal / Sticky (different restitution, friction, density)
- Gravity toggle
- Debug overlay (optional) showing runtime info (FPS, object count, gravity, material, mouse position)

## Controls

**Spawning**
- **Left Mouse Button**: Spawn circle
- **Right Mouse Button**: Spawn box

**Materials**
- **1**: Rubber  
- **2**: Metal  
- **3**: Sticky  

**World**
- **G**: Toggle gravity on/off
- **R**: Reset the scene

**Debug**
- **F1**: Toggle debug overlay
- **H**: Toggle debug help section (when debug is on)