import time
import sys
import functools
import numpy as np
from pvtrace import *

# World node contains all objects
world = Node(
    name="world (air)",
    geometry=Sphere(
        radius=10.0,
        material=Material(refractive_index=1.0),
    )
)

# The glass sphere
sphere = Node(
    name="sphere (glass)",
    geometry=Sphere(
        radius=0.1,
        material=Material(refractive_index=3),
    ),
    parent=world
)
sphere.location = (0, 0, 5)

# The source of rays
light = Node(
    name="Light (555nm)",
    light=Light(direction=functools.partial(cone, 0.01)),
    parent=world
)

# Render and ray-trace
renderer = MeshcatRenderer(wireframe=True, open_browser=True)
scene = Scene(world)
renderer.render(scene)
for ray in scene.emit(100):
    steps = photon_tracer.follow(scene, ray)
    path, events = zip(*steps)
    renderer.add_ray_path(path)
    time.sleep(0.1)

# Wait for Ctrl-C to terminate the script; keep the window open
print("Ctrl-C to close")
while True:
    try:
        time.sleep(.3)
    except KeyboardInterrupt:
        sys.exit()
