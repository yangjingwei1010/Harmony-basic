@Entry
@Component
struct CanvasCase {
  // 2、 准备画笔
  myPen: CanvasRenderingContext2D = new CanvasRenderingContext2D()
  @State
  canvasWidth: number = 0
  @State
  canvasHeight: number = 0
  // 画线
  drawLine() {
    // 画笔移动到指定坐标
    this.myPen.beginPath()
    this.myPen.moveTo(0, 0)
    // 画线
    this.myPen.lineTo(100, 100)
    // 绘制
    this.myPen.lineWidth = 5
    this.myPen.strokeStyle = 'red'
    this.myPen.stroke()
    this.myPen.closePath()
  }
  // 画矩形
  drawRect() {
    this.myPen.beginPath()
    this.myPen.lineWidth = 3
    this.myPen.strokeStyle = '#FFF045'
    this.myPen.moveTo(200, 200)
    this.myPen.strokeRect(200, 200, 100, 100)
    this.myPen.closePath()
  }
  drawCircle() {
    this.myPen.beginPath()
    this.myPen.arc(75, 75, 30, 0, 360)
    this.myPen.lineWidth = 7
    this.myPen.strokeStyle = '#FFF045'
    this.myPen.stroke()
    this.myPen.closePath()
  }
  drawBezier() {
    this.myPen.beginPath()
    this.myPen.lineWidth = 2
    this.myPen.strokeStyle = 'red'
    this.myPen.moveTo(50, 50)
    this.myPen.bezierCurveTo(100, 100, 300, 300, 200, 10)
    this.myPen.stroke()
    this.myPen.closePath()
  }
  drawText() {
    this.myPen.beginPath()
    this.myPen.font = '100px san-serif'
    this.myPen.fillText('杨静伟', this.canvasWidth / 2, this.canvasHeight / 2)
    this.myPen.closePath()
  }
  drawImage() {
    this.myPen.beginPath()
    this.myPen.drawImage(new ImageBitmap('assets/1.webp'), 0,0)
    this.myPen.closePath()
  }
  drawWorld() {
    // 动画：
    // b.找出动画变动的因素
    let earthRotate = 0
    let moonRotate = 0
    // a.画出动画的一帧
    const sun = "/assets/sun.png";
    const moon = "/assets/moon.png";
    const earth = "/assets/earth.png";
    const draw = () => {
      this.myPen.beginPath()
      this.myPen.clearRect(0, 0, this.canvasWidth, this.canvasHeight)
      const r = 100
      const er = 10
      const mr = 5
      // 1.太阳
      this.myPen.restore()
      this.myPen.beginPath()
      this.myPen.drawImage(new ImageBitmap(sun), 0, 0, this.canvasWidth, this.canvasWidth)
      this.myPen.save()
      // 2.轨道
      this.myPen.translate(this.canvasWidth / 2, this.canvasWidth / 2)
      this.myPen.beginPath()
      this.myPen.strokeStyle = 'rgba(0,153,255,0.4)'
      this.myPen.arc(0, 0, r, 0, Math.PI / 180 * 360)
      this.myPen.stroke()
      // 3.地球
      earthRotate += 1
      this.myPen.rotate(Math.PI / 180 * earthRotate)
      this.myPen.save()
      this.myPen.beginPath()
      this.myPen.drawImage(new ImageBitmap(earth), r - er, -er, 2*er, 2*er)
      // 4.月亮
      this.myPen.translate(r, 0)
      moonRotate+=3
      this.myPen.rotate(Math.PI / 180 * moonRotate)
      this.myPen.beginPath()
      this.myPen.drawImage(new ImageBitmap(moon), 2 * er, 0, mr, mr)

      // 5.遮罩层
      this.myPen.restore()
      this.myPen.fillStyle = 'rgba(0,0,0,0.4)'
      this.myPen.fillRect(r, -12, 50, 24)
      this.myPen.closePath()
    }
    setInterval(draw, 30)
  }
  drawRobotCat() {
    this.myPen.lineWidth = 2
    const center = [300, 300]
    const r = 240
    //1.以画布中心为圆心，画出头
    this.myPen.arc(center[0], center[1], r, Math.PI / 180 * 135, Math.PI / 180 * 405)
    this.myPen.stroke()
    //2.眼睛
    //  2.1椭圆
    this.myPen.beginPath()
    this.myPen.ellipse(238, 138, 50, 70, Math.PI / 180 * 10, 0, Math.PI / 180 * 360)
    this.myPen.stroke()
    this.myPen.beginPath()
    this.myPen.ellipse(343, 135, 55, 70, Math.PI / 180 * -10, 0, Math.PI / 180 * 360)
    this.myPen.stroke()
    //  2.2折线
    this.myPen.moveTo(267, 116)
    this.myPen.bezierCurveTo(242, 114, 224, 127, 203, 151)
    this.myPen.bezierCurveTo(229, 129, 242, 124, 270, 125)
    this.myPen.bezierCurveTo(243, 123, 214, 142, 210, 158)
    this.myPen.moveTo(317, 116)
    this.myPen.bezierCurveTo(359, 112, 389, 136, 389, 136)
    this.myPen.bezierCurveTo(358, 119, 318, 123, 318, 123)
    this.myPen.bezierCurveTo(362, 112, 384, 140, 384, 140)
    //3.脸
    this.myPen.moveTo(186, 146)
    // 三角函数
    const offset = r * Math.cos(Math.PI / 180 * 45)
    // console.log(center[0]+offset,center[1]+offset);//130,420
    this.myPen.bezierCurveTo(92, 147, 0, 322, center[0] - offset, center[1] + offset)
    this.myPen.moveTo(398, 138)
    this.myPen.bezierCurveTo(576, 138, 550, 402, center[0] + offset, center[1] + offset)
    this.myPen.stroke()
    //4.鼻子
    this.myPen.beginPath()
    this.myPen.moveTo(307, 195)
    this.myPen.arc(285, 195, 25, 0, Math.PI * 360 / 180)
    this.myPen.closePath()
    this.myPen.fill()
    //5.鼻线
    this.myPen.beginPath()
    this.myPen.moveTo(285, 220)
    this.myPen.lineTo(295, 287)
    //6.上嘴角
    this.myPen.moveTo(120, 264)
    this.myPen.bezierCurveTo(100, 233, 30, 327, 111, 343)
    this.myPen.bezierCurveTo(153, 345, 230, 282, 295, 287)
    this.myPen.bezierCurveTo(420, 275, 427, 319, 480, 310)
    this.myPen.bezierCurveTo(529, 304, 518, 239, 460, 245)
    this.myPen.moveTo(111, 343)
    this.myPen.bezierCurveTo(166, 525, 445, 530, 480, 310)
    //7.下嘴巴
    //8.牙齿
    this.myPen.moveTo(160, 340)
    this.myPen.bezierCurveTo(163, 371, 174, 419, 192, 430)
    this.myPen.moveTo(210, 342)
    this.myPen.bezierCurveTo(209, 371, 226, 419, 244, 444)
    this.myPen.moveTo(294, 327)
    this.myPen.lineTo(310, 460)
    this.myPen.moveTo(374, 327)
    this.myPen.bezierCurveTo(390, 355, 387, 407, 370, 434)
    this.myPen.moveTo(435, 335)
    this.myPen.bezierCurveTo(440, 354, 444, 384, 433, 410)

    //9.胡须
    this.myPen.moveTo(169, 162)
    this.myPen.bezierCurveTo(127, 131, 55, 120, 25, 130)
    this.myPen.moveTo(171, 208)
    this.myPen.bezierCurveTo(100, 191, 44, 193, 22, 215)
    this.myPen.moveTo(171, 250)
    this.myPen.bezierCurveTo(110, 251, 50, 271, 20, 310)
    this.myPen.moveTo(412, 162)
    this.myPen.bezierCurveTo(426, 146, 529, 89, 550, 110)
    this.myPen.moveTo(412, 195)
    this.myPen.bezierCurveTo(426, 196, 529, 169, 570, 195)
    this.myPen.moveTo(412, 235)
    this.myPen.bezierCurveTo(426, 236, 529, 239, 580, 260)
    //10.项圈
    this.myPen.moveTo(center[0] - offset, center[1] + offset)
    this.myPen.bezierCurveTo(208, 505, 348, 496, center[0] + offset, center[1] + offset)
    this.myPen.moveTo(center[0] - offset, center[1] + offset)
    this.myPen.bezierCurveTo(center[0] - offset - 10, center[1] + offset + 10, center[0] - offset, center[1] + offset + 20, center[0] - offset, center[1] + offset + 20)
    this.myPen.moveTo(center[0] + offset, center[1] + offset)
    this.myPen.bezierCurveTo(center[0] + offset + 10, center[1] + offset + 10, center[0] + offset, center[1] + offset + 20, center[0] + offset, center[1] + offset + 20)
    this.myPen.moveTo(center[0] - offset, center[1] + offset + 20)
    this.myPen.bezierCurveTo(208, 525, 348, 516, center[0] + offset, center[1] + offset + 20)
    this.myPen.stroke()
  }

  // 清空画布
  clearCanvas() {
    this.myPen.clearRect(0,0,this.canvasWidth,this.canvasHeight)
  }

  build() {
    Column({space: 20}) {
      // 1、准备画布
      Canvas(this.myPen)
        .width('100%')
        .height(300)
        .backgroundColor(Color.Pink)
        .onReady(() => {
          // this.drawLine()
        })
        .onAreaChange((_,_new) => {
          this.canvasWidth = _new.width as number
          this.canvasHeight = _new.height as number
        })
      Flex({wrap: FlexWrap.Wrap}) {
        Button('清空画布')
          .onClick(() => {
            this.clearCanvas()
          })
        Button('画线')
          .onClick(() => {
            this.drawLine()
          })
        Button('画矩形')
          .onClick(() => {
            this.drawRect()
          })
        Button('画圆')
          .onClick(() => {
            this.drawCircle()
          })
        Button('贝塞尔曲线')
          .onClick(() => {
            this.drawBezier()
          })
        Button('画文字')
          .onClick(() => {
            this.drawText()
          })
        Button('画图')
          .onClick(() => {
            this.drawImage()
          })
        Button('地球转动')
          .onClick(() => {
            this.drawWorld()
          })
        Button('机器猫')
          .onClick(() => {
            this.drawRobotCat()
          })
      }
    }
    .height('100%')
    .width('100%')
  }
}