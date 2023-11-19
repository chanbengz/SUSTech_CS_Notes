const timers = [];  // set timer for duplicate
let danmaku = null;
const ws = new WebSocket("ws://127.0.0.1:8765");
ws.onmessage = function (e) {
    danmaku = e.data
    const jqueryDom = createDanmaku(danmaku);
    addInterval(jqueryDom);    // add timer
}

$(".send").on("click", function () {
    // send danmaku to server
    const msg = $("#danmakutext").val();
    ws.send(msg);
    $("#danmakutext").val("");
});

function createDanmaku(text) {
    const jqueryDom = $("<div class='bullet'>" + text + "</div>");
    // const fontColor = "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random()) + ")";
    const fontColor = "rgb(255,255,255)";
    // const fontSize = Math.floor((Math.random() + 1) * 24) + "px";
    const fontSize = "20px";
    let top = Math.floor(Math.random() * 400) + "px";




    const left = $(".screen_container").width() + "px";
    //
    // top = parseInt(top) > 352 ? "352px" : top;
    jqueryDom.css({
        "position": 'absolute',
        "color": fontColor,
        "font-size": fontSize,
        "left": left,
        "top": top,
        // "animation": "right2left 0s linear 0s"
    });
    $(".screen_container").append(jqueryDom);
    return jqueryDom;
    // return divElement;
}
// add timer task
function addInterval(jqueryDom) {
    let left = jqueryDom.offset().left - $(".screen_container").offset().left;
    const timer = setInterval(function () {
        left--;
        jqueryDom.css("left", left + "px");
        if (jqueryDom.offset().left + jqueryDom.width() < $(".screen_container").offset().left) {
            jqueryDom.remove();
            clearInterval(timer);
        }
    }, 5);
    timers.push(timer);
}