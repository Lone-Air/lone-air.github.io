function playMus(arr){
    var repeat=0;
    var mus=new Audio();
    mus.preload=false;
    mus.controls=false;
    mus.hidden=true;
    var src=arr.pop();
    mus.src=src;
    mus.addEventListener("ended", playEndedHandler, false);
    mus.play()
    mus.loop=false;
    function playEndedHandler(){
        if(repeat>=arr.length){return false;}
        src>arr.pop();
        mus.src=src;
        arr.unshift(src);
        mus.play();
        repeat++;
}

function playLoop(arr){
    playMus(arr);
    playLoop(arr);
}
