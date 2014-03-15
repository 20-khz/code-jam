NetAddr.localAddr

(
q = ();
q.particles = ();

SynthDef('jamsynth', {
    arg gate=0, baseFrq=200, ang=0, dist=0, velo=0, pid=0;
    var env = EnvGen.kr(Env.adsr(0.01, 0, 1, 0.01), gate, doneAction:2);
    var d = Lag.kr(dist, 0.1);
    var frq = 100+baseFrq-(d*50) + (pid*50);
    var sound = LFTri.ar([frq, frq+2]) * (1-d);
    Out.ar(0, sound * env * 0.2);
}).add;
)

(

// OSC /addParticle ID
OSCdef('addParticle', {
    arg msg;
    var particleId = msg[1];
    q.particles[particleId] = Synth('jamsynth', [\pid, particleId]);
}, "/addParticle");

// OSC /destroyParticle ID
OSCdef('destroyParticle', {
    arg msg;
    var particleId = msg[1];
    msg.postln;
    q.particle[particleId].set(\gate, 0);
    q.particles.removeAt(particleId);
}, "/destroyParticle");

// OSC /playParticle ID   emitter angle dist velocity
OSCdef('playParticle', {
    arg msg;
    var particleId = msg[1];
    var ang = msg[2];
    var dist = msg[3];
    var velo = msg[4];
    var emitterId = msg[5];
    q.particles[particleId].set(\gate, 1, \ang, ang, \dist, dist, \velo, velo, \baseFrq, emitterId.midicps + 40);
}, "/playParticle");
)
