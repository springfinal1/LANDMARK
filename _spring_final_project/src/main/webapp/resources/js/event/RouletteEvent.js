const $c = document.querySelector("canvas");
const ctx = $c.getContext(`2d`);
let path = null

const product = [
    "꽝", "100p", "10% coupon","꽝", "500p", "50% coupon","꽝", "1000p"
];

const colors = ["#7b7dd2", "#ffffff"];

const newMake = () => {
    const [cw, ch] = [$c.width / 2, $c.height / 2];
    const arc = Math.PI / (product.length / 2);

    for (let i = 0; i < product.length; i++) {
        ctx.beginPath();
        ctx.fillStyle = i % 2 == 0 ? colors[0] : colors[1];
        ctx.moveTo(cw, ch);
        ctx.arc(cw, ch, cw, arc * (i - 1), arc * i);
        ctx.fill();
        ctx.closePath();
        ctx.stroke();
    }

    // ctx.beginPath();
    // ctx.arc(cw, ch, 70, 0, 2 * Math.PI);
    // ctx.fillStyle = '#fffff';
    // ctx.fill();
    // ctx.closePath();
    ctx.save();
    path=new Path2D();
    path.fillStyle = "white";
    path.arc(cw, ch,70, 0, 2 * Math.PI);
    ctx.fill(path);
    ctx.stroke(path);
    ctx.restore();

    ctx.fillStyle = "#4d4047";
    ctx.font = "25px Orbit-Regular";
    ctx.textAlign = "center";

    for (let i = 0; i < product.length; i++) {
        const angle = (arc * i) + (arc / 2);

        ctx.save();

        ctx.translate(
            cw + Math.cos(angle) * (cw - 50),
            ch + Math.sin(angle) * (ch - 50),
        );

        ctx.rotate(angle + Math.PI / 2);

        product[i].split(" ").forEach((text, j) => {
            ctx.fillText(text, 0, 30 * j);
        });

        ctx.restore();
    }
  
}

const rotate = () => {
    $c.style.transform = `initial`;
    $c.style.transition = `initial`;

    setTimeout(() => {

        const ran = Math.floor(Math.random() * product.length);

        const arc = 360 / product.length;
        const rotate = (ran * arc) + 3600 + (arc * 3) - (arc / 4);

        $c.style.transform = `rotate(-${rotate}deg)`;
        $c.style.transition = `2s`;

        setTimeout(() => alert(` ${product[ran]} 당첨!`), 2000);
    }, 1);
};

function clickCanvas(event) {
    console.log(path);
    var x = event.pageX;
    var y = event.pageY;
    if(ctx.isPointInPath(path, x,  y,"nonzero")) {
        console.log("in",x,y);
        alert("in circle");
    } else {
        console.log("out",x,y);
        alert("out circle");
    }
}

newMake();