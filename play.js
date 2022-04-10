function playMus(arr){
    var repeat=0;
    var mus=new Audio();
    var oldarr=arr.slice();
    mus.preload=false;
    mus.controls=false;
    mus.hidden=true;
    var src=arr.pop();
    mus.src=src;
    arr.unshift(src);
    mus.addEventListener("ended", playEndedHandler, false);
    mus.play()
    mus.loop=false;
    function playEndedHandler(){
        if(repeat>=arr.length){playMus(oldarr);}
        src=arr.pop();
        mus.src=src;
        arr.unshift(src);
        mus.play();
        repeat++;
    }
}
