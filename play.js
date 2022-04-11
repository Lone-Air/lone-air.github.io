var click=false
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
    var success=mus.play();
    if(success){click=true;}
    else{return 0;}
    mus.loop=false;
    function playEndedHandler(){
        if(repeat>=arr.length){repeat=0;playMus(oldarr);repeat=0;return 0;}
        src=arr.pop();
        mus.src=src;
        arr.unshift(src);
        mus.play();
        repeat++;
    }
}

function clickpress(arr){
    if(click==true){return 0;}
    click=true;
    playMus(arr);
}
