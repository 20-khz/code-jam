Sound game.

(initial description, to be updated to match what we did)

Our canvas has visible vectors that act as wind.
The wind moves particles.
We drop the particles in the screen with our mouse.
We also drop circles of different sizes.
When the particle is inside the circle, it produces sound.

Processing sends the distance to the center of the circle to SuperCollider as a 0..1 float value. SuperCollider uses this distance to decide the pitch and volume.

We could add particle creator objects and particle destructor objects. It would be nice to drag the forces and emmitters, destroyers.

The look should be a bit like asteroids (retro look). White lines on black background.

I was here and I commited.
