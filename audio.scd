NetAddr.localAddr

(
q = ();
q.particles = ();

SynthDef('jamsynth', {
    arg gate=0, baseFrq=200, ang=0, dist=0, velo=0, pid=0, filterFrq=50;
    var env = EnvGen.kr(Env.adsr(0.01, 0, 1, 0.01), gate, doneAction:2);
    var lfo = LFSaw.kr(2.pow(pid%4), 1, -0.5, 0.5);
    var d = Lag.kr(dist, 0.05);
    var frq = baseFrq*(1+d-10);
    var sound = (LFSaw.ar([frq, frq*1.03]) + LFSaw.ar(frq*0.251)) * (1-d) * lfo;
    sound = RLPF.ar(sound, filterFrq - (d * 20), 0.5);
    Out.ar(0, sound * env * 0.2);
}).add;
)

(

// OSC /addParticle ID
OSCdef('addParticle', {
    arg msg;
    var particleId = msg[1];
    q.particles[particleId] = Synth('jamsynth', [\pid, particleId, \filterFrq, 50.rrand(15000)]);
}, "/addParticle");

// OSC /destroyParticle ID
OSCdef('destroyParticle', {
    arg msg;
    var particleId = msg[1];
    q.particles[particleId].set(\gate, 0);
    q.particles.removeAt(particleId);
}, "/destroyParticle");

// OSC /playParticle ID angle dist velocity emitter
OSCdef('playParticle', {
    arg msg;
    var particleId = msg[1];
    var ang = msg[2];
    var dist = msg[3];
    var velo = msg[4];
    var emitterId = msg[5];
    q.particles[particleId].set(\gate, 1, \ang, ang, \dist, dist, \velo, velo, \baseFrq, (switch(emitterId%3,0,0,1,5,2,9)+(emitterId/3*12)).midicps);
}, "/playParticle");

// OSC /muteParticle ID
OSCdef('muteParticle', {
    arg msg;
    var particleId = msg[1];
    q.particles[particleId].set(\dist, 1);
}, "/muteParticle");
)
