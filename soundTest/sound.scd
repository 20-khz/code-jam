NetAddr.localAddr

(
q = ();
q.particles = ();
//q.particles[1] = "one";
//q.particles[7] = "seven";
//q.particles.removeAt(7)
//q.particles
)

(
SynthDef('jamsynth', {
    arg gate=0;
    arg emitterId, ang=0, dist=0, velo=0;
    var env = EnvGen.kr(Env.adsr(0.01,0,1,0.01), doneAction:2);
    var sound = SinOsc.ar(400-(dist*10)) * (1-dist) * env;
    Out.ar(0, sound * env);
}).add;
)

(

// OSC /addParticle ID
OSCdef('addParticle', {
    arg msg;
    var particleId = msg[1],
    emitterId = msg[2];
    q.particles[particleId] = Synth('jamsynth', [\emitterId, emitterId]);
}, "/addParticle");

// OSC /destroyParticle ID
OSCdef('destroyParticle', {
    arg msg;
    var particleId = msg[1];
    q.particles[particleId].TELLTOSHUTDOWN;
    q.particles.removeAt(particleId);
}, "/destroyParticle");

// OSC /playParticle ID   emitter angle dist velocity
OSCdef('playParticle', {
    arg msg;
    var particleId = msg[1],
    ang = msg[2],
    dist = msg[3],
    velo = msg[4];
    q.particle[particleId].set(\gate, 1, \ang, ang, \dist, dist, \velo, velo);
}, "/playParticle");
)
